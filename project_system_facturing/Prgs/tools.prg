FUNCTION Crear_Estruc_Conexion(cIdSistema as String) as String
  LOCAL xDriver, xServidor, xBasedeDatos, xId, xClave, xEstructura
  
  && Verificamos a qué Servidor nos Conectamos
  xServidor = ALLTRIM(LeerIni("SERVIDOR", "SERVER", "C:\Project_Test_1\ofima-test\project_system_facturing\testSystem.ini"))
  xDriver = ALLTRIM(LeerIni("SERVIDOR", "DRIVER_ODBC", "C:\Project_Test_1\ofima-test\project_system_facturing\testSystem.ini"))

  && Establecemos parámetros de conexión hacia la base de datos
  xBasedeDatos = ALLTRIM(LeerIni(cIdSistema, "BASEDEDATOS", "C:\Project_Test_1\ofima-test\project_system_facturing\testSystem.ini"))
  xId = ALLTRIM(LeerIni(cIdSistema, "USUARIO", "C:\Project_Test_1\ofima-test\project_system_facturing\testSystem.ini"))
  xClave = ALLTRIM(LeerIni(cIdSistema, "CLAVE", "C:\Project_Test_1\ofima-test\project_system_facturing\testSystem.ini"))

  && Verificar si algún valor es vacío
  IF EMPTY(xDriver) OR EMPTY(xServidor) OR EMPTY(xBasedeDatos) OR EMPTY(xId) OR EMPTY(xClave)
    ? "Error: Uno o más parámetros de conexión están vacíos."
    RETURN ""
  ENDIF

  xEstructura = "Driver=" + xDriver + ";Server=" + xServidor + ";Database=" + xBasedeDatos + ";Uid=" + xId + ";Pwd=" + xClave + ";"
  
  && Mostrar valores para depuración
  ? "Driver: " + xDriver
  ? "Server: " + xServidor
  ? "Database: " + xBasedeDatos
  ? "User: " + xId
  ? "Password: " + xClave

  RETURN xEstructura
ENDFUNC

 FUNCTION LeerIni(pSeccion as String, pClave as string, pINIFile as string) as string
  LOCAL xDefault, xRetVal, xRetLen
  xDefault = ""
  xRetVal = Space(255)
  xRetLen = LEN(xRetVal)
  
  DECLARE integer GetPrivateProfileString IN WIN32API ;
  STRING pSeccion, STRING pClave, ;
  STRING xDefault, STRING @xRetVal, ;
  INTEGER xRetLen, STRING pINIFile
  
  xRet = GetPrivateProfileString(pSeccion, pClave, xDefault, ;
          @xRetVal, xRetLen, pINIFile)
  Return Left(xRetVal, AT(CHR(0),xRetVal)-1)
 ENDFUNC
