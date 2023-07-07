import mariadb
import sys

# Connect to MariaDB Platform
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

# Get Cursor
cur = conn.cursor()
cur.execute("USE Base_Datos_A")

cur.execute("SELECT t.IDCategoria, t.IDPrensa, m.Nombre, c.Tipo from Tener t JOIN Prensa m ON m.id = t.IDPrensa JOIN Categoria c ON c.idCategoria = t.IDCategoria ORDER BY t.IDPrensa")
Tener=cur.fetchall()
for i in Tener:
    print(i[2], i[3])
    info = input("Ingrese URL_C, URL_P, XPATH_N separao por ', ': ")
    infoArray=info.split(", ")
    sigue=True
    while (sigue):
        while (len(infoArray)!= 3):
                info=input("Por favor, siga el formato establecido. ")
                infoArray=info.split(", ")
        print(infoArray)
        correcto=input("¿La información es correcta?, (Y/n): ")
        if(correcto=="Y" or correcto=="y"):
            sigue=False
    try:
        ##cur.execute("INSERT INTO TENER (IDCategoria, IDPrensa, URL_C, URL_P, XPATH_N) VALUES (?, ?, ?, ?, ?)",(i[0], i[1], infoArray[0], infoArray[1], infoArray[2]))
        cur.execute("UPDATE Tener SET URL_C=?, URL_P=?, XPATH_N=? WHERE IDCategoria = ? AND IDPrensa = ?", (infoArray[0],infoArray[1],infoArray[2],i[0],i[1]))
        print("Datos Insertados correctamente")
    except mariadb.Error as e: 
        print(f"Error: {e}")
        sigue=False
conn.commit()
conn.close()