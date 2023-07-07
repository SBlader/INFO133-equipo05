import mariadb
import sys
import mariadb
import random
from requests_html import HTMLSession
import time

try:
    conn = mariadb.connect(
        user="prueba",
        password="1234",
        host="127.0.0.1",
        port=3306
    )

except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

session = HTMLSession()

## Simular que estamos utilizando un navegador web
USER_AGENT_LIST = [
        "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1",
        "Mozilla/5.0 (X11; CrOS i686 2268.111.0) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11",
        "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6",
        "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1090.0 Safari/536.6",
        "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/19.77.34.5 Safari/537.1",
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5",
        "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.36 Safari/536.5",
        "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
        "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
        "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
        "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
        "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
        "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
        "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
        "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.0 Safari/536.3",
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24",
        "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24"
]
headers = {'user-agent':random.choice(USER_AGENT_LIST) }

cur = conn.cursor()
cur.execute("USE Base_Datos_A")
sigue = True
while(sigue):
    correcto = False
    while not(correcto):
                consulta = input("Ingrese aquí el nombre del medio y el de la categoria. separo los datos con ', ': ")
                ConsultaArray=consulta.split(", ")
                while (len(ConsultaArray)!= 2):
                    consulta=input("Por favor, siga el formato establecido. ")
                    ConsultaArray=consulta.split(", ")
                correcto = True
    try:
        cur.execute("SELECT XPATH_N FROM prensa p JOIN Tener t ON p.id = t.IDPrensa JOIN categoria c ON c.idCategoria = t.IDCategoria  WHERE p.Nombre = ? AND c.Tipo = ?;",(ConsultaArray[0],ConsultaArray[1]))
        xpath = cur.fetchall()
        cur.execute("SELECT URL_C FROM prensa p JOIN Tener t ON p.id = t.IDPrensa JOIN categoria c ON c.idCategoria = t.IDCategoria  WHERE p.Nombre = ? AND c.Tipo = ?;",(ConsultaArray[0],ConsultaArray[1]))
        URL_SEED = cur.fetchall()
        cur.execute("SELECT URL_P FROM prensa p JOIN Tener t ON p.id = t.IDPrensa JOIN categoria c ON c.idCategoria = t.IDCategoria  WHERE p.Nombre = ? AND c.Tipo = ?;",(ConsultaArray[0],ConsultaArray[1]))
        URL_PAGE= cur.fetchall()
        url=URL_SEED[0][0]
        xpath_url=xpath[0][0]
        Paso = True

    except mariadb.Error as e:
        Paso = False
        print(f"Error: {e}")
    
    if(Paso):
        response = session.get(URL_SEED[0][0],headers=headers)
        print(xpath_url[0][0])
        output = response.html.xpath(xpath_url[0][0])
        print("Lo encontrado por el crawling, puede no incluir la pagina base: ", output[0])
            
        time.sleep(2)

    consulta = input("¿desea realizar otra consulta? y/n: ")
    while(consulta.lower()!="y" and consulta.lower()!="n"):
        consulta = input("siga el formato. ¿desea realizar otra consulta? y/n: ")
    if(consulta.lower()=="n"):
        sigue = False