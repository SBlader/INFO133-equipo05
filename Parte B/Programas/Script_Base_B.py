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
query_create = "CREATE DATABASE prueba"
cur.execute(query_create)
cur.execute("USE prueba")
cur.execute("CREATE TABLE Comuna (id INT, Region TEXT, Pais TEXT,Nombre TEXT,  PRIMARY KEY(id))")
cur.execute("CREATE TABLE Reportes (Nombre_Reporte VARCHAR(100), Tematica TEXT, Descripcion TEXT,  PRIMARY KEY(Nombre_Reporte))")
cur.execute("CREATE TABLE Carabineros (Nombre VARCHAR(100), Ubicacion TEXT, Tipo TEXT, PRIMARY KEY(Nombre))")
cur.execute("CREATE TABLE Antenas (Ubicacion VARCHAR(100), Empresa TEXT,  PRIMARY KEY(Ubicacion))")
cur.execute("CREATE TABLE Farmacia (Ubicacion VARCHAR(100), Fecha_Turno TEXT, Cadena TEXT, Horario TEXT,  PRIMARY KEY(Ubicacion))")
cur.execute("CREATE TABLE Tener (Valor INT, Año VARCHAR(100), Comuna INT, Reportes VARCHAR(100),  PRIMARY KEY(Comuna,Reportes,año), FOREIGN KEY (Comuna) REFERENCES Comuna(id), FOREIGN KEY (Reportes) REFERENCES Reportes(Nombre_Reporte))")
cur.execute("CREATE TABLE P_Laboral (ID_Comuna INT, H_Ocupados INT, H_Desocupados INT, F_Ocupados INT, F_Desocupados INT,  PRIMARY KEY(ID_Comuna),FOREIGN KEY (ID_Comuna) REFERENCES Comuna(id))")

conn.commit() 
conn.close()