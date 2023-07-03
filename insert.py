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
    sigue = True
    while(sigue):
        info=input("Por favor, ingrese Tipo de Categoria, y una url de ejemplo. separe los datos con ', ': ")
        infoArray=info.split(", ")
        while (len(infoArray)!= 2):
            info=input("Por favor, siga el formato establecido. ")
            infoArray=info.split(", ")
        print(infoArray)
        correcto=input("¿La información es correcta?, (Y/n): ")
        if(correcto=="Y" or correcto=="y"):
            sigue=False
        try:
            cur.execute("INSERT INTO Categoria (Tipo, URL) VALUES (?, ?)",(infoArray[0], infoArray[1]))
            conn.commit()
            print("Datos Insertados correctamente")
        except mariadb.Error as e: 
            print(f"Error: {e}")
            sigue=False

def InsertarMedio():
    sigue = True
    #Tabla Prensa
    while(sigue):
        correcto=False
        while not(correcto):
            info=input("Por favor, ingrese el nombre del medio de prensa, su año de fundación (Formato: YYYY), el continete de origen, el pais, la región y la ciudad. separe los datos con ', ': ")
            infoArray=info.split(", ")
            while (len(infoArray)!= 6):
                info=input("Por favor, siga el formato establecido. ")
                infoArray=info.split(", ")
            print(infoArray)
            if(input("¿La información es correcta?, (Y/n): ").lower()=="y"):
                correcto=True
        try:
            cur.execute("INSERT INTO Prensa (Region, Ciudad, Nombre, Continente, pais, Año_Fundacion) VALUES (?, ?, ?, ?, ?, ?)",(infoArray[4], infoArray[5], infoArray[0], infoArray[2], infoArray[3], infoArray[1]))
            print("Datos Insertados correctamente")
            IDPrensa=cur.lastrowid
            print(IDPrensa)
            sigue = False
            insercion=True
        except mariadb.Error as e: 
            print(f"Error: {e}")
            insercion = False

    #Tabla Redes
    if(insercion):
        sigue=True
        VarConsulta = ""
        while(VarConsulta != "y" and VarConsulta != "n"):
            VarConsulta = input("¿El medio tiene una o mas redes sociales? Y/n: ").lower()
            if (VarConsulta=="n"):
                sigue=False
        while(sigue):
            correcto=False
            while not(correcto):
                info=input("Ahora ingrese el tipo de la red social(Facebook,Instagram,etc) y el usuario o entidad que la maneja(ej: @Elcomerico_peru). separe los datos con ', ': ")
                infoArray=info.split(", ")
                while (len(infoArray)!= 2):
                    info=input("Por favor, siga el formato establecido. ")
                    infoArray=info.split(", ")
                print(infoArray)
                if(input("¿La información es correcta?, (Y/n): ").lower()=="y"):
                    correcto=True
            try:
                cur.execute("INSERT INTO Redes (Tipo_R, Usuario, IDPrensa) VALUES (?, ?, ?)",(infoArray[0],infoArray[1],IDPrensa))
                print("Datos Insertados correctamente")
                if (input("¿Desea insertar otra red? Y/n: ").lower()=="n"):
                    sigue=False
            except mariadb.Error as e: 
                print(f"Error: {e}")
                sigue=False
    #Tabla Fundadores
        sigue=True
        VarConsulta = ""
        FundadoresID=[]
        while(sigue):
            correcto=False
            while not(correcto):
                info=input("Ahora ingrese el nombre de un fundador: ")
                print(info)
                if(input("¿La información es correcta?, (Y/n): ").lower()=="y"):
                    correcto=True
            try:
                cur.execute("INSERT INTO Fundadores (Nombre) VALUES (?)",(info,))
                conn.commit()
                print("Datos Insertados correctamente")
                FundadoresID.append(cur.lastrowid)
                print(IDPrensa)
                if (input("¿Desea insertar otro fundador? Y/n: ").lower()=="n"):
                    sigue=False
            except mariadb.Error as e:
                print(f"Error: {e}")
                sigue=False
            
    #Tabla Ejemplo_N
        sigue=True
        VarConsulta = ""
        while(VarConsulta != "y" and VarConsulta != "n"):
            VarConsulta = input("¿Tiene un ejemplo web de una noticia? Y/n: ").lower()
            if (VarConsulta=="n"):  
                sigue=False
        while(sigue):
            correcto=False
            while not(correcto):
                info=input("Por favor, ingrese la url de ejemplo, una expresión XPATH para leer el titulo de la noticia, una expresión XPATH para leer el contenido de la noticia y una expresión XPATH para leer la fecha de la noticia. separe los datos con ', ': ")
                infoArray=info.split(", ")
                while (len(infoArray)!= 4):
                    info=input("Por favor, siga el formato establecido. ")
                    infoArray=info.split(", ")
                print(infoArray)
                if(input("¿La información es correcta?, (Y/n): ").lower()=="y"):
                    correcto=True
            try:
                cur.execute("INSERT INTO Ejemplo_N (XPATH_T, XPATH_C, XPATH_F, URL, IDPrensa) VALUES (?, ?, ?, ?, ?)",(infoArray[1],infoArray[2],infoArray[3],infoArray[0],IDPrensa))
                print("Datos Insertados correctamente")
                sigue=False
            except mariadb.Error as e:
                print(f"Error: {e}")
                sigue=False
    #Tabla Crear
        for i in range(0, len(FundadoresID)):
            cur.execute("INSERT INTO Crear (IDPrensa, IDFundadores) VALUES (?, ?)",(IDPrensa, FundadoresID[i]))
    #Tabla Tener
        sigue=True
        while(sigue):
            print("Debe asignarle una categoria al medio de prensa, en la base de datos se encuentran los siguientes: ")
            info=[]
            cur.execute("SELECT Tipo FROM Categoria")
            for row in cur:
                for field in row:
                    info.append(field)
            IDs = []
            cur.execute("SELECT IdCategoria FROM Categoria")
            for row in cur:
                for field in row:
                    IDs.append(field)
            if(len(info)==0):
                print("no hay categorias, crea una")
                CrearCategoria()
                info=[]
                cur.execute("SELECT Tipo FROM Categoria")
                for row in cur:
                    for field in row:
                        info.append(field)
                IDs = []
                cur.execute("SELECT IdCategoria FROM Categoria")
                for row in cur:
                    for field in row:
                        IDs.append(field)
            for i in range(0,len(info)): 
                print(f"Tipo {i}: {info[i]}")
            Categoria=input("Por favor ingrese el numero correspondiente a la categoria deseada (No puede ingresar una categoría que el medio ya posea.), si desea ingresar una nueva categoria ingrese '+': ")
            actuales=[]
            cur.execute("SELECT IDCategoria FROM Tener WHERE IDPrensa=?",(IDPrensa,))
            for row in cur:
                    for field in row:
                        actuales.append(field)
            valido = False
            while not(valido):
                try:
                    while((Categoria!="+") and ((int(Categoria)>=len(info)) or (int(Categoria)<0) or (IDs[int(Categoria)] in actuales))):
                        Categoria=input("Por favor ingrese un numero valido o un +: ")
                    valido=True
                except:
                    Categoria=input("Por favor ingrese un numero valido o un +: ")
            if (Categoria=="+"):
                CrearCategoria()
                IdCategoria=cur.lastrowid
                cur.execute("INSERT INTO Tener(IDPrensa,IDCategoria) VALUES (?, ?)", (IDPrensa,IdCategoria))
            else:
                cur.execute("INSERT INTO Tener (IDPrensa, IDCategoria) VALUES (?, ?)",(IDPrensa, IDs[int(Categoria)]))
            if (input("¿Desea insertar otra categoría? Y/n: ").lower()=="n"):
                sigue=False

    conn.commit()

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
        conn.close()

        funcionando=False