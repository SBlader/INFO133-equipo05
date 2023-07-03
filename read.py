import mariadb
import sys

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
    consulta = input("Ingrese aquí su consulta SQL")
    cur.execute(consulta)
    print("¿desea realizar otra consulta? y/n: ")
