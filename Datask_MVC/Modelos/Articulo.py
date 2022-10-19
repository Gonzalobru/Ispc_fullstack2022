
class Articulo:
    def __Init__(self,id_articulo,titulo,texto,fechacreacion):
        self.__id_articulo=id_articulo
        self.__Titulo=titulo
        self.__Texto=texto
        self.__FechaCreacion=fechacreacion
        

        #Get
    @property
    def Titulo(self):
        return self.__Titulo

#Set
    @Titulo.setter
    def Titulo(self,valor):
        self.__Titulo=valor

    #Get
    @property
    def Texto(self):
        return self.__Texto

#Set
    @Texto.setter
    def Texto(self,valor):
        self.__Texto=valor

   #Get
    @property
    def FechaCreacion(self):
        return self.__FechaCreacion

#Set
    @FechaCreacion.setter
    def FechaCreacion(self,valor):
         self.__FechaCreacion=valor

    def Crear(self):
        pass
    def Modificar(self):
        pass
    def Eliminar(self):
        pass
    def Listar(self):
        pass