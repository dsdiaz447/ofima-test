FUNCTION Crear_Estruc_Conexion(cIdSistema as String) as String
  LOCAL xDriver, xServidor, xBasedeDatos, xId, xClave, xEstructura

  && Verificamos a qu� Servidor nos Conectamos
  xServidor = ALLTRIM(LeerIni("SERVIDOR", "SERVER", "c:\project_test_1\ofima-test\project_system_facturing\testSystem.INI"))  
  xDriver = ALLTRIM(LeerIni("SERVIDOR", "DRIVER_ODBC", "c:\project_test_1\ofima-test\project_system_facturing\testSystem.INI"))

  && Establecemos par�metros de conexi�n hacia la base de datos  
  xBasedeDatos = ALLTRIM(LeerIni(cIdSistema, "BASEDEDATOS", "c:\project_test_1\ofima-test\project_system_facturing\testSystem.INI"))
  xId = ALLTRIM(LeerIni(cIdSistema, "USUARIO", "c:\project_test_1\ofima-test\project_system_facturing\testSystem.INI"))
  xClave = ALLTRIM(LeerIni(cIdSistema, "CLAVE", "c:\project_test_1\ofima-test\project_system_facturing\testSystem.INI"))

  xEstructura = "Driver=" + xDriver + ";Server=" + xServidor + ";Database=" + xBasedeDatos + ";Uid=" + xId + ";Pwd=" + xClave + ";"
  
  && Verifica la cadena de conexi�n construida
  ? "Cadena de conexi�n construida: " + xEstructura
 
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