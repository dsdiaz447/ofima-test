SET TALK OFF
SET ECHO OFF
CLEAR
SET LIBRARY TO "c:\project_test_1\ofima-test\project_system_facturing\prgs\tools.prg"
SET CLASSLIB TO "c:\project_test_1\ofima-test\project_system_facturing\class\dashboard_clss.vcx"
*List_menu()
_screen.AddProperty("conn",Crear_Estruc_Conexion("SYS_TEST-PRACTICE"))
MESSAGEBOX("Configuration succefull!!!",64,"Aviso del sistema")







