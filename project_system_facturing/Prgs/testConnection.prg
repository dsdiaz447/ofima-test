* Configura la cadena de conexión
_screen.AddProperty("cn1", Crear_Estruc_Conexion("SYS_TEST-PRACTICE"))

* Intenta conectarte a la base de datos
cn = SQLCONNECT(_screen.cn1)
IF cn <= 0    
	? "Error en la conexión a la base de datos. Código de error: " + STRCONVERT(SQLGETPROP(cn, 'ERRORMESSAGE'), 'C')    
	RETURN
ENDIF
	
WAIT WINDOW "Conexión establecida correctamente."

* Ejecutar una consulta
nResult = SQLEXEC(cn, "SELECT * FROM TB_DOCUMENT;", "cur_document")
IF nResult <= 0    
	? "Error al ejecutar la consulta. Código de error: " + STRCONVERT(SQLGETPROP(cn, 'ERRORMESSAGE'), 'C')
ELSE    
	WAIT WINDOW "Consulta ejecutada correctamente."
ENDIF
* Desconectar la conexiónSQLDISCONNECT(cn)