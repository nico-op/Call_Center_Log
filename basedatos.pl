% ---------------------------------------
%           BASE DE DATOS
% ---------------------------------------

respuestas(despedida, [
        ['Adios!'],
        ['Hasta pronto'],
        ['Nos vemos']
        ]).
%Se dejaron 3 despesdidas

respuestas(saludo, [
        ['Hola!'],
        ['Hola, habla con CallCenterLog'],
        ['Bienvenido a CallCenterLog!']
        ]).

respuestas(obtener_dispositivo, [
        ['Estas seguro que ese es un dispositivo?'],
        ['Espera un momento, necesito saber el dispositivo con el cual tienes problemas']
        ]).


respuestas(gracias, [
        ['Gracias por la ayuda'],
        ['Entendido, muchas gracias']
        ]).

respuestas(fin_oracion,[
        ['Espero que haya sido de mucha ayuda'],
        ['Alguna otra consulta?']
        ]).

respuestas(agradecido, [
        ['Con gusto']
        ]).


respuestas(incompresion,[
        ['No entiendo su pregunta/consulta'],
        ['Disculpe, intente de nuevo']
        ]).

% BASE DE DATOS DE RESPUESTAS
% LAS SOLUCIONES A PROBLEMAS SE NUMERAN CON S + NUMERO DE SOLUCION DE LA TABLA CSR


respuestas(computadora, [
        ['Debe llevar su computadora a que le cambien la tarjeta de red'],
        ['Debe llevar su computadora a que le cambien el puerto'],
        ['Proceda a instalar los drivers de wifi en su computadora'],
        ['Si cambio la configuracion, restablezca la configuracion predeterminada'],
        ['Restablezca la configuracion predeterminada del antivirus o reinstale el antivirus'],
        ['Contacte a su compania'],
        ['Espere que el servicio de luz e internet se restablezcan'],
        ['Proceda probando con otro cable y conectando al modem de manera correcta'],
        ['Proceda a conectar el cable a su computadora de manera correcta'],
        ['Conecte el modem a la electricidad'],
        ['Conecte la computadora a la red wifi']
        ]).

%Respuesta computadora es la unica base de datos
respuestas(listo, [
               ['En que te puedo ayudar?'],
               ['Como te puedo ayudar?']
           ]).

respuestas(problema, [
               ['Disculpe, no tengo solucion a su problema,
               vuelva a intertarlo.']
           ]).

% BASE DE DATOS DE CAUSAS

causas_base(computadora, [
        ['La tarjeta de red esta danada'],
        ['El adaptador de red de la computadora no funciona'],
        ['No tiene instalados los drivers wifi'],
        ['La direccion IP o el DNS pueden estar mal configurados'],
        ['El antivirus puede estar bloqueando el acceso a internet'],
        ['Interrupcion del servicio en la zona'],
        ['Cortes de electricidad en la zona por lo que se cae el internet'],
        ['El cable de red esta danada'],
        ['El cable del internet no esta conectado a su computadora'],
        ['El modem no funciona'],
        ['Su computadora no se encuentra conectada a la red wifi']
        ]).

% BASE DE DATOS DE PREGUNTAS.
% LAS CAUSAS DE PROBLEMAS SE NUMERAN CON C + NÃšMERO DE CAUSA DE LA TABLA CSR.

preguntas_base(dispositivo,
             [['Cual es el dispositivo con el que tiene el problema?']]).

preguntas_base(computadora,
        [ ['Le aparecen las redes disponibles?'],
        ['Le han dado mantenimiento a los adaptadores ultimamente?'],
        ['Tiene instalados los drivers wifi?'],
        ['Ha cambiado la direccion IP o el DNS?'],
        ['Su computadora tiene antivirus?'],
        ['Se han notificado interrupciones en el servicio?'],
        ['Han ocurrido cortes en el fluido electrico?'],
        ['La computadora reconoce el cable de red al conectarse??'],
        ['El cable de ethernet esta conectado de manera correcta a la computadora?'],
        ['El modem esta alumbrando?'],
        ['Reviso que la computadora este conectada al wifi?']
        ]).

% BASE DE DATOS DE REFERENCIAS
% LAS REFERENCIAS SE NUMERAN COMO R + NUMERO DE REFERENCIA EN TABLA CSR.

referencias(computadora, [
        ['https://www.redeszone.net/noticias/wifi/motivos-cambiar-tarjeta-wifi-pc/'],
        ['https://support.microsoft.com/es-es/windows/solucionar-problemas-de-conexi%C3%B3n-ethernet-en-windows-2311254e-cab8-42d6-90f3-cb0b9f63645f#:~:text=Abra%20Configuraci%C3%B3n%20%3E%20red%20%26%20Internet%20%3E,Ethernet%20para%20ver%20si%20funciona.'],
        ['https://www.redeszone.net/tutoriales/redes-wifi/reinstalar-driver-tarjeta-red-wifi-windows/'],
        ['https://www.xataka.com/basics/ethernet-no-tiene-configuracion-ip-valida-que-hacer-para-solucionar-error'],
        ['https://mundowin.com/correccion-el-antivirus-esta-bloqueando-internet-o-la-red-wi-fi/'],
        ['https://www.xataka.com/basics/como-comprobar-problemas-tu-conexion-internet-tuyos-operador'],
        ['https://universoabb.com/como-tener-internet-cuando-se-va-la-luz/'],
        ['https://es.xfinity.com/support/articles/xfinity-hook-up-to-the-web'],
        ['https://ayudaysoporte.personal.com.ar/app/answers/detail/a_id/6259/~/manual-de-autoinstalaci%C3%B3n-de-m%C3%B3dem'],
        ['https://ayudaysoporte.personal.com.ar/app/answers/detail/a_id/6259/~/manual-de-autoinstalaci%C3%B3n-de-m%C3%B3dem'],
        ['https://support.microsoft.com/es-es/windows/conectarse-a-una-red-wi-fi-en-windows-1f881677-b569-0cd5-010d-e3cd3579d263']
         ]).
% DEFINICION DE ENTRADAS

saludos([hola,buenas_tardes,buenos_dias]).

gracias([gracias,muchas_gracias,okay, entendido]).

dispositivos([computadora]).













































