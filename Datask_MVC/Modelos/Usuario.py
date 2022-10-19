
class Usuario:   
    def __Init__(self,idUsuario, nombre, apellido, username,descripcion,fechaAlta,ciudad,imagen):
        self.Id_Usuario=idUsuario
        self.__Nombre=nombre
        self.__Apellido=apellido
        self.__Username=username
        self.__Descripcion=descripcion
        self.__FechaAlta=fechaAlta
        self.__Ciudad=ciudad
        self.__Imagen=imagen

    @property
    def Nombre(self):
        return self.__Nombre

#Set
    @Nombre.setter
    def Nombre(self,valor):
        self.__Nombre=valor

    #Get
    @property
    def Apellido(self):
        return self.__Apellido

#Set
    @Apellido.setter
    def Apellido(self,valor):
        self.__Apellido=valor

   #Get
    @property
    def Username(self):
        return self.__Username

#Set
    @Username.setter
    def Username(self,valor):
         self.__Username=valor

    #Get
    @property
    def Descripcion(self):
        return self.__Descripcion

#Set
    @Descripcion.setter
    def Descripcion(self,valor):
         self.__Descripcion=valor

    #Get
    @property
    def FechaAlta(self):
        return self.__FechaAlta

#Set
    @FechaAlta.setter
    def FechaAlta(self,valor):
         self.__FechaAlta=valor

    
    #Get
    @property
    def Ciudad(self):
        return self.__Ciudad

#Set
    @Ciudad.setter
    def Ciudad(self,valor):
         self.__Ciudad=valor


    def Login(self):
        pass

    def Registrarse(self):
        pass

    def ActualizarPerfil(self):
        pass