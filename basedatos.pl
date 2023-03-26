%Base de datos sobre una computadora que no tiene acceso a internet
% ***********************************************************************************************************************
% Entradas iniciales

saludos([ hola,buenas, tardes, dias, buenos]).

gracias([gracias, muchas_gracias, okay]).

dispositivos([computadora]).

% ************************************************************************************************************************
% Causas por la que la computadora no tiene acceso a internet
causas_db(computadora, [
        ['Su computadora no se encuentra conectada a la red wifi'],%Causa1
        ['El modem no funciona'], %Causa2
        ['El cable del internet no esta conectado a su computadora'], %Causa3
        ['El cable de red esta danada'], %Causa5
        ['Cortes de electricidad en la zona por lo que se cae el internet'], %Causa6
        ['Interrupcion del servicio en la zona'], %Causa7
        ['El antivirus puede estar bloqueando el acceso a internet'], %Causa8
        ['La direccion IP o el DNS pueden estar mal configurados'], %Causa9
        ['No tiene instalados los drivers wifi'],%Causa10
        ['El adaptador de red de la computadora no funciona'],%Causa11
        ['La tarjeta de red esta danada']%Causa12
        ]).

% ************************************************************************************************************************
% Preguntas que el sistema va a realizar al usuario para determinar lo
% que ocurre.
preguntas_db(dispositivo,
             [['Cual es el dispositivo con el que tiene el problema?']]).

preguntas_db(computadora,
        [['Reviso que la computadora este conectada al wifi?'],%Pregunta1
        ['Es la primera vez que conecta la computadora a internet?'],%Pregunta2
        ['Esta conectando por wifi?'], %Pregunta4
        ['El modem esta alumbrando?'], %Pregunta5
        ['El modem esta conectado al cable de red?'], %Pregunta6
        ['El modem esta conectado a la electricidad?'], %Pregunta7
        ['Tiene instalados los drivers wifi?'], %Pregunta8
        ['Su computadora se encuentra conectada por cable?'], %Pregunta9
        ['El cable esta conectado de manera correcta al modem?'], %Pregunta10
        ['El cable esta conectado de manera correcta a la computadora?'],%Pregunta11
        ['La computadora reconoce el cable de red al conectarse??'],%Pregunta12
        ['Han ocurrido cortes en el fluido electrico?'], %Pregunta13
        ['Se han notificado interrupciones en el servicio?'],%Pregunta14
        ['Su computadora tiene antivirus?'],%Pregunta15
        ['Ha cambiado la direccion IP o el DNS?']%Pregunta16
        ]).


% ****************************************************************************************************************************
% Respuestas que brinda el sistema sobre saludos, despedidas, final de
% la oracion, respuestas aleatroias cuando no sabe la respuestas,
% respuestas cunado no entiende lo que se le indiciones.
respuestas(saludos,
        [['hola'], ['buenas,tardes'],['buenos, dias'],
        ['buenas, noches'], ['buenas'] ]).

respuestas(despedida,
        [['chao'],['pura, vida'], ['muchas, gracias'],
        ['hasta, luego'], ['adios'],['muy amable']]).

respuestas(gracias_despedida,
        [['okay'],['muchas gracias']]).

respuestas(con_gusto,
        [['con gusto'],['espero haberte ayudado']]).


respuestas(dispositivo,
        [['Con que dispositivo tiene problemas?']]).

respuestas(final_oracion,
        [['te puedo ayudar en algo mas?']]).

respuestas(respuestas_aleatorias,
        [['sinceramente no tengo la respuesta'],
        ['Lo siento, no puedo responder esa pregunta.']]).

respuestas(incompresion,
        [['disculpe, no entiendo lo que me preguntaste'],
        ['disculpe, intente de nuevo']]).

% ---------------------------------------------------------------------------------------------------------------
% Respuestas con las soluciones a los problemas encontrados.

respuestas(computadora, [
        ['Conecte la computadora a la red wifi'], %Solucion1
        ['Conecte el modem a la electricidad'], %Solucion2
        ['Proceda a instalar los drivers de wifi en su computadora'], %Solucion3
        ['Verifique que el modem tenga conectado el cable de red'], %Solucion4
        ['Proceda a conectar el cable al modem de manera correcta'], %Solucion5
        ['Proceda a conectar el cable a su computadora de manera correcta'], %Solucion6
        ['Debe llevar su computadora a que le cambien el puerto'], %Solucion7
        ['Debe llevar su computadora a que le cambien la tarjeta de red'], %Solucion8
        ['Debe limpiar el puerto y posteriormente intentar conectar el cable'], %Solucion9
        ['Espere que el servicio de luz e internet se restablezcan'], %Solucion10
        ['Contacte a su compania'], %Solucion11
        ['Restablezca la configuracion predeterminada del antivirus o reinstale el antivirus'], %Solucion12
        ['Si cambio la configuracion, restablezca la configuracion predeterminada'] %Solucion13
 ]).

respuestas(listo,
        [['En que te puedo ayudar?'],['Como te puedo ayudar?']]).

respuestas(problema,
        [['Disculpe, no tengo solucion a su problema, vuelva a intertarlo.']]).

% *********************************************************************************************************************************
% Referencias que el sistema le puede brindar al usuario para que tenga
% una idea mas clara de como solucionar el problema.

referencias(computadora, [
        ['https://eu.dlink.com/es/es/support/faq/routers/mydlink-routers/dir-880l/es_dir-880l_conectar_mi_ordenador_wi_fi_a_mi_router'], %Referencia1
        ['https://espanol.cox.com/residential/support/connecting-a-router-and-a-modem-with-an-ethernet-cable.html'], %Referencia2
        ['https://www.adslzone.net/como-se-hace/internet/descargar-controladores-drivers-red/'], %Referencia3
        ['https://www.redeszone.net/tutoriales/redes-cable/ver-detalles-tarjeta-red-windows/'], %Referencia4
        ['https://support.microsoft.com/es-es/windows/solucionar-problemas-de-conexi%C3%B3n-ethernet-en-windows-2311254e-cab8-42d6-90f3-cb0b9f63645f#:        ~:text=Abra%20Configuraci%C3%B3n%20%3E%20red%20%26%20Internet%20%3E,Ethernet%20para%20ver%20si%20funciona.'], %Referencia5
        ['https://mundowin.com/correccion-el-antivirus-esta-bloqueando-internet-o-la-red-wi-fi/'], %Referencia6
        ['https://www.xataka.com/basics/ethernet-no-tiene-configuracion-ip-valida-que-hacer-para-solucionar-error']%Referencia7
         ]).

















































