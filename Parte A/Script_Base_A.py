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

# Create Database
query_create = "CREATE DATABASE Base_Datos_A"
cur.execute(query_create)
cur.execute("USE Base_Datos_A")
cur.execute("CREATE TABLE Prensa (id CHAR(4), Region CHAR(16), Ciudad CHAR(32), Nombre CHAR(32), Continente CHAR(16), pais CHAR(32), Año_Fundacion DATE, PRIMARY KEY(id))")
cur.execute("CREATE TABLE Redes (Tipo_R CHAR(16), Usuario CHAR(32), IDPrensa CHAR(4),  PRIMARY KEY(Tipo_R,Usuario), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id))")
cur.execute("CREATE TABLE Categoria (Tipo CHAR(16), URL VARCHAR(2083), PRIMARY KEY(URL))")
cur.execute("CREATE TABLE Fundadores (Fecha_N DATE, Nombre CHAR(32), ID CHAR(4), PRIMARY KEY(ID))")
cur.execute("CREATE TABLE Ejemplo_N (XPATH_T CHAR(64), XPATH_C CHAR(128), XPATH_F CHAR(128), URL VARCHAR(2083), IDPrensa CHAR(4), PRIMARY KEY(URL), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id))")
cur.execute("CREATE TABLE Tener (IDPrensa CHAR(4), Categoria_url VARCHAR(2083), PRIMARY KEY(IDPrensa,Categoria_url), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id), FOREIGN KEY (Categoria_url) REFERENCES Categoria(URL))")
cur.execute("CREATE TABLE Crear (IDPrensa CHAR(4), IDFundadores CHAR(4), PRIMARY KEY(IDPrensa,IDFundadores), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id), FOREIGN KEY (IDFundadores) REFERENCES Fundadores(ID))")

conn.commit() 
conn.close()