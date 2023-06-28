import mariadb
import sys
import random

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

def CrearCategoria():
    print("Categoria")

def InsertarMedio():
    insercion = True
    sigue = True
    #Tabla Prensa
    while(sigue):
        infoPrensa=input("Por favor, ingrese el nombre del medio de prensa, su año de fundación (Formato: YYYY-MM-DD), el continete de origen, el pais, la región y la ciudad. separe los datos con ', ': ")
        infoPrensaArray=infoPrensa.split(", ")
        while (len(infoPrensaArray)!= 6):
            infoPrensa=input("Por favor, siga el formato establecido. ")
            infoPrensaArray=infoPrensa.split(", ")
        print(infoPrensaArray)
        correcto=input("¿La información es correcta?, (Y/n): ")
        if(correcto=="Y" or correcto=="y"):
            sigue=False
    #consulta="INSERT INTO Prensa (id, Region, Ciudad, Nombre, Continente, pais, Año_Fundacion) VALUES (%s,%s,%s,%s,%s);"
    try:
        cur.execute("INSERT INTO Prensa (Region, Ciudad, Nombre, Continente, pais, Año_Fundacion) VALUES (?, ?, ?, ?, ?, ?, ?)",(infoPrensaArray[4], infoPrensaArray[5], infoPrensaArray[0], infoPrensaArray[2], infoPrensaArray[3], infoPrensaArray[1]))
        print("Datos Insertados correctamente")
        IDPrensa=cur.execute("SELECT LAST_INSERT_ID()")
    except mariadb.Error as e: 
        print(f"Error: {e}")
        insercion = False

    #Tabla Redes
    if(insercion):
        sigue=True
        correcto=True
        VarConsulta = ""
        while(VarConsulta != "y" and VarConsulta != "n"):
            VarConsulta = input("¿El medio tiene una o mas redes sociales? Y/n: ").lower()
            if (VarConsulta=="n"):
                sigue=False
        while(sigue):
            while(correcto):
                infoRed=input("Muy bien!, ahora ingrese el tipo de la red social(Facebook,Instagram,etc) y el usuario o entidad que la maneja(ej: @Elcomerico_peru). separe los datos con ', ': ")
                infoRedArray=infoPrensa.split(", ")
                while (len(infoRedArray)!= 2):
                    infoRed=input("Por favor, siga el formato establecido. ")
                    infoRedArray=infoRed.split(", ")
                print(infoRedArray)
                if(input("¿La información es correcta?, (Y/n): ").lower()=="n"):
                    correcto=False
        try:
            cur.execute("INSERT INTO Redes (Tipo_R, URL, IDPrensa) VALUES (?, ?, ?)",(infoRedArray[0],infoRedArray[1],IDPrensa))
            print("Datos Insertados correctamente")
            if (input("¿Desea insertar otra red? Y/n: ").lower()=="n"):
                sigue=False
        except mariadb.Error as e: 
            print(f"Error: {e}")
    #Tabla Fundadores
    if(insercion):
        sigue=True
        correcto=True
        VarConsulta = ""
        while(VarConsulta != "y" and VarConsulta != "n"):
            VarConsulta = input("¿Conoce al/los fundador/es? Y/n: ").lower()
            if (VarConsulta=="n"):
                sigue=False
            FundadoresID=[]
        while(sigue):
            while(correcto):
                infoFundador=input("Muy bien!, ahora ingrese el nombre y año de nacimiento de un fundador. separe los datos con ', ': ")
                infoFundadorArray=infoFundador.split(", ")
                while (len(infoFundadorArray)!= 2):
                    infoFundador=input("Por favor, siga el formato establecido. ")
                    infoFundadorArray=infoFundador.split(", ")
                print(infoFundadorArray)
                if(input("¿La información es correcta?, (Y/n): ").lower()=="n"):
                    correcto=False
        try:
            cur.execute("INSERT INTO Fundadores (Nombre, Fecha_N) VALUES (?, ?)",(infoFundadorArray[0],infoRedArray[1]))
            print("Datos Insertados correctamente")
            FundadoresID.append(cur.execute("SELECT LAST_INSERT_ID()"))
            if (input("¿Desea insertar otro fundador? Y/n: ").lower()=="n"):
                sigue=False
        except mariadb.Error as e:
            print(f"Error: {e}")
    #Tabla Ejemplo_N
    
    conn.commit()
    conn.close()
    print("Medio")

#####################################################################################################
funcionando = True
while(funcionando):
    VarConsulta = 0
    print("¿Qué desea insertar?")
    print("1.- Medio de Prensa / 2.- Categoría")
    while(VarConsulta != "1" and VarConsulta != "2"):
        VarConsulta=input()
        if (VarConsulta != "1" and VarConsulta != "2"):
            print("Por favor escriba 1 o 2")
    if(VarConsulta=="1"):
        InsertarMedio()
    else:
        CrearCategoria()
    if (input("¿Desea insertar algo más? Y/n: ").lower()=="n"):
        #print("  ^__^")
        #print(" (oo)\_______")
        #print(" (__)\       )\/\\")
        #print("     ||----w |")
        #print("     ||     ||")
        print("Muchas Gracias! Aqui una vaquita y un dragon.")
        dragon = '''
                                / \\  //\\
                |\\___/|      /   \\//  \\\\
                /0  0  \\__  /    //  | \\ \\
                /     /  \\/_/    //   |  \\  \\
                @_^_@'/   \\/_   //    |   \\   \\
                //_^_/     \\/_ //     |    \\    \\
            ( //) |        \\//      |     \\     \\
            ( / /) _|_ /   )  //       |      \\     _\\
        ( // /) '/,_ _ _/  ( ; -.    |    _ _\\.-~        .-~~~^-.
        (( / / )) ,-{        _      `-.|.-~-.           .~         `.
        (( // / ))  '/\\      /                 ~-. _ .-~      .-~^-.  \\            ^__^
        (( /// ))      `.   {            }                   /      \\  \\           (oo)\_______
        (( / ))     .----~-.\        \\-'                 .~         \\  `. \\^-.     (__)\       )\/\\
                    ///.----..>        \\             _ -~             `.  ^-`  ^-_      ||----w |
                    ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~         ||     ||
                                                                        /.-~
'''
        print(dragon)

        funcionando=False