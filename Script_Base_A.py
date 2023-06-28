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
cur.execute("DROP DATABASE Base_Datos_A")
cur.execute(query_create)
cur.execute("USE Base_Datos_A")
cur.execute("CREATE TABLE Prensa (id INT NOT NULL AUTO_INCREMENT, Region CHAR(16), Ciudad CHAR(32), Nombre CHAR(32), Continente CHAR(16), pais CHAR(32), Año_Fundacion DATE, PRIMARY KEY(id))")
cur.execute("CREATE TABLE Redes (Tipo_R CHAR(16), Usuario CHAR(32), IDPrensa INT NOT NULL AUTO_INCREMENT,  PRIMARY KEY(Tipo_R,Usuario), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id))")
cur.execute("CREATE TABLE Categoria (idCategoria INT NOT NULL AUTO_INCREMENT, Tipo CHAR(16), URL VARCHAR(2083), PRIMARY KEY(idCategoria))")
cur.execute("CREATE TABLE Fundadores (Fecha_N DATE, Nombre CHAR(32), ID INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(ID))")
cur.execute("CREATE TABLE Ejemplo_N (XPATH_T CHAR(64), XPATH_C CHAR(128), XPATH_F CHAR(128), URL VARCHAR(2083), IDPrensa INT, PRIMARY KEY(URL), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id))")
cur.execute("CREATE TABLE Tener (IDPrensa INT, IDCategoria INT, PRIMARY KEY(IDPrensa,IDCategoria), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id), FOREIGN KEY (IDCategoria) REFERENCES Categoria(idCategoria))")
cur.execute("CREATE TABLE Crear (IDPrensa INT, IDFundadores INT, PRIMARY KEY(IDPrensa,IDFundadores), FOREIGN KEY (IDPrensa) REFERENCES Prensa(id), FOREIGN KEY (IDFundadores) REFERENCES Fundadores(ID))")

conn.commit() 
conn.close()