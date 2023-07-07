import random
from requests_html import HTMLSession
import w3lib.html
import html
import mariadb
import sys
import time

def format_date(date):
        return(date.split("T")[0])

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

cur = conn.cursor()
cur.execute("USE Base_Datos_A")

sigue = True
while(sigue):
    correcto = False
    while not(correcto):
                consulta = input("Ingrese aquí el nombre del medio y el URL de la noticia. separo los datos con ', ': ")
                ConsultaArray=consulta.split(", ")
                while (len(ConsultaArray)!= 2):
                    info=input("Por favor, siga el formato establecido. ")
                    infoArray=info.split(", ")
                correcto = True
    try:
        cur.execute("SELECT XPATH_T FROM prensa p JOIN ejemplo_n en ON p.id = en.IDPrensa WHERE p.Nombre = ?;",(ConsultaArray[0],))
        xpath_title = cur.fetchall()
        cur.execute("SELECT XPATH_F FROM prensa p JOIN ejemplo_n en ON p.id = en.IDPrensa WHERE p.Nombre = ?;",(ConsultaArray[0],))
        xpath_date = cur.fetchall()
        Paso = True

    except mariadb.Error as e:
        Paso = False
        print(f"Error: {e}")
    
    if(Paso):
        response = session.get(ConsultaArray[1],headers=headers)

        title = response.html.xpath(xpath_title[0][0])[0].text
        date = response.html.xpath(xpath_date[0][0])[0].text

        print(f"titulo: {title}     Fecha: {date}")

    consulta = input("¿desea realizar otra consulta? y/n: ")
    while(consulta.lower()!="y" and consulta.lower()!="n"):
        consulta = input("siga el formato. ¿desea realizar otra consulta? y/n: ")
    if(consulta.lower()=="n"):
        sigue = False