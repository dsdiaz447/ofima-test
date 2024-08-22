*==================================================================================================================================================================
*  Nombre del autor: Walter R. Ojeda Valiente
* Fecha de creación: 03/ABR/2022
*   Tarea realizada: Ejemplos prácticos del uso de la biblioteca de clases W_MENU_LATERAL.VCX
*                  : En este programa MAIN.PRG se declara e inicializa todo lo relacionado en forma general a la aplicación
*==================================================================================================================================================================
  
  CLOSE ALL
  CLEAR ALL
  
  *--- Muestra una ventanita con los datos del error que ocurrió
  
  ON ERROR MessageBox("Error N°: " + Transform(Error()) + CHR(13) + CHR(13) ;
                    + Message() + CHR(13) + CHR(13) ;
                    + Program() + CHR(13) + CHR(13) ;
                    + "Línea N°: " + Transform(Lineno(1)) + Chr(13) + Chr(13) ;
                    + "Alias: " + Alias())
   
  *--- Se establecen los SET que se usarán inicialmente en esta aplicación
  
  DO SETS_INICIALES
  
  SET PATH TO IMÁGENES
  
  SET CLASSLIB TO W_MENU_LATERAL
  
  WITH _Screen
    .AddObject("oColeccionForms", "COLLECTION")
    .AddProperty("oFormMain")     && El formulario MAIN, para que sea muy fácil acceder a sus propiedades, métodos, y controles
  ENDWITH
  
  DO FORM MAIN
  READ EVENTS
  
  CLOSE ALL
  CLEAR ALL 
  
RETURN
*
*
FUNCTION CURSOR_SOBRE
LPARAMETERS tcControles
LOCAL lnNum, lcObjeto, llResultado
  
  llResultado = .F.
  
  lnNum = AMouseObj(VEC)
  
  IF lnNum > 0 THEN
    lcObjeto = VEC(1)
    lcObjeto = Upper(lcObjeto.Name)
    IF lcObjeto $ tcControles THEN
      llResultado = .T.
    ENDIF
  ENDIF
  
  RETURN (llResultado)
  
ENDFUNC
*
*
PROCEDURE MOVER_FORMULARIO
LPARAMETERS toForm, tnXCoord, tnYCoord
  
  WITH toForm.oFormPadre
    DO WHILE MDown()
      .Move(.Left + MCol(.Name, 3) - tnXCoord, .Top + MRow(.Name, 3) - tnYCoord)
    ENDDO
  ENDWITH
  
RETURN
*
*
PROCEDURE SETS_INICIALES
  
  SET BELL           OFF           && OFF = No suenda la campanilla cuando se llega al final de un campo de un formulario o se escribe un dato erróneo
  SET CENTURY        ON            && ON = Los años son mostrados con 4 dígitos (antes del año 2000 se acostumbraba mostrarlos con 2 dígitos)
  SET COLLATE TO     "GENERAL"     && 
  SET CONFIRM        ON            && ON = Aunque un campo en un formulario esté completamente lleno se debe presionar [ENTER] para pasar al siguiente campo
  SET DATE           DMY           && El formato de las fechas será: DD/MM/AAAA
  SET DECIMALS       TO 4          && Cantidad de decimales mostrados 
  SET DELETED        ON            && ON = ignorar los registros borrados. OFF = usar los registros borrados
  SET DOHISTORY      OFF           && OFF = no pone los comandos de un programa en la ventana "Debug Output"
  SET EXACT          ON            && ON = dos strings son iguales si tienen la misma longitud y los mismos caracteres
  SET EXCLUSIVE      OFF           && OFF = El acceso a todas las tablas se hace de forma compartida, para que puedan ser abiertas en varios formularios a la vez
  SET HOURS          TO 24         && 24 = Las horas son mostradas con el formato de 24 horas (desde 00:00:00 hasta 23:59:59)
  SET MULTILOCKS     OFF           && OFF = No se pueden bloquear varios registros con las funciones LOCK() y RLOCK()
  SET POINT          TO ","        && Separador de la parte entera de la parte decimal de un número
  SET REPORTBEHAVIOR 80            && El comportamiento en los informes es el usado por Visual FoxPro 8
  SET RESOURCE       ON            && ON = Los cambios realizados al entorno del Visual FoxPro son grabados en el archivo de recursos
  SET SAFETY         OFF           && OFF = No muestra una caja de diálogo antes de sobre-escribir un archivo
  SET SEPARATOR      TO "."        && El carácter usado para separar a los miles en los números
  SET STRICTDATE     TO 1          && 1 = si la fecha o la fechahora evalúan a un valor inválido, genera un error
  SET TALK           OFF           && OFF = No envía mensajes a la ventana principal del Visual FoxPro ni a los formularios
  SET TEXTMERGE      ON            && Permite poner nombres de variables dentro de la construcción TEXT...ENDTEXT
  
ENDPROC
*
*
