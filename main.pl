
%--------------------------------------------------------------------
%                  MAIN - SISTEMA EXPERTO(Brinda Respuesta)
%--------------------------------------------------------------------
 
 
%----------------------------------------------
%     import archivos/libreria
%     variables dinamicas
%----------------------------------------------
 :- [basedatos,sistemaexperto,reader,bnf,funciones].
 :- use_module(library(random)).
 :- dynamic dispositivo/1,
            solicitud/1.

%-----------------------------------------------------------
%             Estructura Principal
%-----------------------------------------------------------

%----------------------------------------------
%             consultar/0
%----------------------------------------------
% Permite iniciar una conversacion con CallCenterLog

consultar:-
  saludar,
  conversacion.


%----------------------------------------------
%             saludar/0
%----------------------------------------------
% Permite iniciar el saludo al usuario

saludar:-
  respuestas(saludo, D),
  respuesta_aleatoria(D, W),
  imprimir_usuario(bot),
  mostrar_lista(W),
  imprimir_usuario(usuario),
  readin(_),
  ofrecer_ayuda.


%----------------------------------------------
%             conversacion/0
%----------------------------------------------
% Inicia la conversación donde busca la solucion/consulta/referencia que el usuario solicita.

conversacion:-
  repeat,
  imprimir_usuario(usuario),
  readin(S),
  append(S,[' n'],M),
  generar_respuesta(M,R),
  imprimir_usuario(bot),
  mostrar_lista(R),
    salir(S),!.

%-----------------------------------------------------------
%             Seccion Respuestas
%-----------------------------------------------------------

%--------------------------
%    generar_respuesta
%--------------------------
% Donde el usuario indica el dispositivo en la oracion
generar_respuesta(S,R):-
  modeloConsulta(S,_),
  verificar_dispositivo(S),!,
  assert(solicitud(consulta)),
  resolver_consulta,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%--------------------------
%    generar_respuesta
%--------------------------
% Donde el usuario no indica el dispositivo en la oracion
generar_respuesta(S,R):-
  modeloConsulta(S,_),!,
  assert(solicitud(consulta)),
  obtener_dispositivo,
  resolver_consulta,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).


%-----------------------------------------------------------
%             Seccion Referencias
%-----------------------------------------------------------

%--------------------------
%    generar_respuesta
%--------------------------
% Donde el usuario indica el dispositivo en la oracion y menciona el problema
generar_respuesta(S,R):-
  modeloReferencia(S,_), verificar_dispositivo(S),
  es_causa(S,N),!,
  assert(solicitud(referencia)),
  imprimir_usuario(bot),write('Esta referencia puede ayudarte a resolver el problema: '),
  brindar_referencia(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%--------------------------
%    generar_respuesta
%--------------------------
% Donde el usuario indica el dispositivo en la oracion y menciona el problema
generar_respuesta(S,R):-
  modeloReferencia(S,_),
  verificar_dispositivo(S),
  es_caso_especial(S,N),!,
  assert(solicitud(referencia)),
  imprimir_usuario(bot),write('Estas referencias te pueden ser utiles: \n'),
  brindar_referencia(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%--------------------------
%    generar_respuesta
%--------------------------
% Donde el usuario indica solamente el dispositivo
generar_respuesta(S,R):-
  modeloReferencia(S,_),
  verificar_dispositivo(S),!,
  assert(solicitud(referencia)),
  brindar_referencias,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%--------------------------
%    generar_respuesta
%--------------------------
% Donde el usuario no indica el dispositivo, tampoco menciona el problema
generar_respuesta(S,R):-
  modeloReferencia(S,_),!,
  assert(solicitud(referencia)),
  obtener_dispositivo,
  brindar_referencias,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%-----------------------------------------------------------
%             Seccion Respuesta a Problemas
%-----------------------------------------------------------
% El usuario indica que tiene un problema, el dispositivo y dice cual
% es la causa (sea especifica o general).
generar_respuesta(S,R):-
  modeloProblema(S,_), verificar_dispositivo(S),
  es_causa(S,N),!,
  assert(solicitud(problema)),
  brindar_solucion(N,R).

generar_respuesta(S,R):-
  modeloProblema(S,_), verificar_dispositivo(S),
  es_caso_especial(S,N),!,
  assert(solicitud(problema)),
  brindar_solucion(N),
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%--------------------------
%    generar_respuesta
%--------------------------
% El usuario indica que tiene un problema y el dispositivo.
generar_respuesta(S,R):-
  modeloProblema(S,_), verificar_dispositivo(S),!,
  assert(solicitud(problema)),
  conoce_el_problema,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%--------------------------
%    generar_respuesta
%--------------------------
% El usuario solo indica que tiene un problema.
generar_respuesta(S,R):-
  modeloProblema(S,_), !,
  assert(solicitud(problema)),
  obtener_dispositivo,
  conoce_el_problema,
  respuestas(fin_oracion,LR),
  respuesta_aleatoria(LR,R).

%------------------------------------------------
%               CASOS ESPECIFICOS
%------------------------------------------------

%--------------------------
%    generar_respuesta
%--------------------------
% buscar despedida "adios"
generar_respuesta(S, R):-
  salir(S), !,
	respuestas(despedida, Res),
	respuesta_aleatoria(Res, R).

%--------------------------
%    generar_respuesta
%--------------------------
% Buscar frase de saludo
generar_respuesta(S, R):-
  buscar_saludo(S), !,
	respuestas(saludo, Res),
	respuesta_aleatoria(Res, R).

%--------------------------
%    generar_respuesta
%--------------------------
% Buscar frase de agradecimiento
generar_respuesta(S, R):-
  buscar_gracias(S), !,
  respuestas(agradecido, Res),
  respuesta_aleatoria(Res, R).

%--------------------------
%    generar_respuesta
%--------------------------
% Detectar pregunta con por qué
generar_respuesta(S, R):-
	oracion(S,_), buscar_pregunta(S), !,
  respuestas(preguntas_aleatorias,PA),
  respuesta_aleatoria(PA,R).

%--------------------------
%    generar_respuesta
%--------------------------
% Si el usuario ingresa una incoherencia
generar_respuesta(_,R):-
  respuestas(incompresion,RL),
  respuesta_aleatoria(RL,R).

%---------------------------------------------------------
%--------------------------
%   respuesta_aleatoria/2
%--------------------------
% Escoge una respuesta aleatoria de una lista de respuestas.
respuesta_aleatoria(Res, R):-
    length(Res, Longitud),
    Mayor is Longitud + 1,
    random(1, Mayor, Rand),
    n_elemento(Res, Rand, R).

%----------------------- OBTENER -------------------------
%--------------------------
%   ofrecer_ayuda/0
%--------------------------
% Funciona como un paso para entrar a la conversaciÃ³n.
ofrecer_ayuda:-
  respuestas(listo,RL),
  respuesta_aleatoria(RL,R),
  imprimir_usuario(bot),
  mostrar_lista(R).

%--------------------------
%   obtener_dispositivo/0
%--------------------------
% Le pide al usuario un dispositivo vÃ¡lido.
obtener_dispositivo:-
  preguntas_base(dispositivo,LP),
  respuesta_aleatoria(LP,P),
  imprimir_usuario(bot),mostrar_lista(P),
  imprimir_usuario(usuario),readin(S),
  obtener_dispositivo(S).

% permite salir del bucle de preguntas realizadas al usuario
obtener_dispositivo(D):-
  member('salir',D), !,fail.

obtener_dispositivo(D):-
  verificar_dispositivo(D),!.

obtener_dispositivo(_):-
  respuestas(obtener_dispositivo,LR),
  respuesta_aleatoria(LR,RA),
  imprimir_usuario(bot),mostrar_lista(RA),
  imprimir_usuario(usuario),readin(D),
  obtener_dispositivo(D).

%--------------------------
%   conoce_el_problema/0
%--------------------------
% Realiza preguntas al usuario para determinar si conoce el problema
conoce_el_problema:-
  imprimir_usuario(bot),write('Por favor, responde a la siguiente pregunta con "si" o "no" \n'),
  write('Tiene una idea de cual es su problema?\n'),
  readin(S),
  conoce_el_problema(S),!.

%--------------------------
%   conoce_el_problema/0
%--------------------------
% Si se conoce el problema, solicita la causa y luego lo soluciona
conoce_el_problema(S):-
  afirmativo(S), !,
  imprimir_usuario(bot),
  write('Si conoce el problema, escribalo a continuacion: \n'),
  imprimir_usuario(usuario),readin(M),append(M,[' n'],P),
  verificar_problema(P).

%--------------------------
%   conoce_el_problema/0
%--------------------------
% Si no lo conoce, se procede a realizar obtener_problema
conoce_el_problema(S):-
  negativo(S), !,
  imprimir_usuario(bot),
  write(' No hay problema,le ayudare a encontrarlo\n'),
  obtener_problema.

%--------------------------
%   conoce_el_problema/0
%--------------------------
% Salida del bucle de deteccion de problemas
conoce_el_problema(S):-
  member('salir',S), !.

%--------------------------
%   conoce_el_problema/0
%--------------------------
% Si el usuario no ingresa si o no, le pide que ingrese una
conoce_el_problema(_):-
  imprimir_usuario(bot),
  write('Es necesario que responda las preguntas con "si" o "no". Intente nuevamente'),
  readin(S), conoce_el_problema(S).
%--------------------------
%   obtener_problema/0
%--------------------------
obtener_problema:-
  imprimir_usuario(bot),
  write('Por favor, responde a la siguiente pregunta con "si" o "no" \n'),
  dispositivo(D),n_elemento(D,1,Disp),
  preguntas_base(Disp,PP),
  length(PP,N),obtener_problema(N).

%--------------------------
%   obtener_problema/1
%--------------------------

obtener_problema(0):-
  imprimir_usuario(bot),
  write('Lo sentimos, no puedo encontrar su problema en mi base de datosLo lamento\n'),!.

%--------------------------
%   obtener_problema/1
%--------------------------

obtener_problema(N):-
  integer(N),!,
  dispositivo(D),n_elemento(D,1,Disp),
  preguntas_base(Disp,PP),
  n_elemento(PP,N,PG),
  imprimir_usuario(bot),
  mostrar_lista(PG),
  readin(S),obtener_problema(S,N).

% obtener_problema/2
obtener_problema(S,N):-
  negativo(S),!,
  brindar_solucion(N,R),
  mostrar_lista(R).

obtener_problema(S,N):-
  afirmativo(S),!,
  M is N-1, obtener_problema(M).

obtener_problema(S,_):-
  member('salir',S), !.

obtener_problema(_,_):-
  imprimir_usuario(bot),
  write('Es necesario que responda las preguntas con "si" o "no". Intente nuevamente'),
  readin(S), obtener_problema(S).

%----------------------- Q/A FX --------------------------

% resolver_consulta/0
% Muestra al usuario las causas de un problema con su dispositivo
resolver_consulta:-
  imprimir_usuario(bot),
  write('Es posible que su problema se deba a las siguientes causas:\n'),
  dispositivo(D),n_elemento(D,1,Disp),
  causas_base(Disp,LS),
  length(LS,N),
  mostrar_listacero(N,LS),!.

% brindar_referencias/0
% Brinda al usuario todas las referencias de un dispositivo.
brindar_referencias:-
  imprimir_usuario(bot),write('Esta referencia podria ayudarle con su problema: \n'),
  dispositivo(D),n_elemento(D,1,Disp),
  referencias(Disp,LR),
  length(LR,N),mostrar_listacero(N,LR),!.

% brindar_referencia/1
% Brinda una o varias referencias asociadas a un problema.
brindar_referencia(N):-
  integer(N),!,
  dispositivo(D),n_elemento(D,1,Disp),
  referencias(Disp,LRF),
  n_elemento(LRF,N,RF),
  mostrar_lista(RF).

brindar_referencia(N):-
  dispositivo(D),n_elemento(D,1,Disp),
  referencias(Disp,LRF),
  mostrar_seleccion(LRF,N),!.

% brindar_solucion/2
% Brinda una o varias referencias asociadas a un problema.
brindar_solucion(N,S):-
  integer(N),!,
  dispositivo(D),n_elemento(D,1,Disp),
  respuestas(Disp,LRF),
  n_elemento(LRF,N,S).

% brindar_solucion/1
brindar_solucion(N):-
  imprimir_usuario(bot),write('\n'),
  dispositivo(D),n_elemento(D,1,Disp),
  respuestas(Disp,LRF),
  mostrar_seleccion(LRF,N),!.

%----------------------- AUX FX --------------------------
% Nota: en un predicado se usa la notaciÃ³n:
% nombre/(numero de args)

% imprimir_usuario/1
% Escribe en la consola el nombre del usuario que habla
imprimir_usuario(bot):-
    nombre_bot(X), write(X), write(': '), flush_output.
imprimir_usuario(usuario):-
    n_usuario(X), write(X), write(': '), flush_output.
nombre_bot('CallCenterLog').
n_usuario('Usuario').

% buscar_saludo/1
% Verifica si la oraciÃ³n es un saludo en la DB
buscar_saludo(S):-
  saludos(D),
  intersecar(S, D, A),
  A \== [].

% buscar_pregunta/1
% Verifica si la entrada es una pregunta en la DB
buscar_pregunta(S):-
  member('?',S).

% buscar_gracias/1
% Verifica si la oraciÃ³n es de agradecimiento en la DB
buscar_gracias(S):-
  gracias(D),
  intersecar(S, D, A),
  A \== [].

% afirmativo/1
% Retorna verdadero si el usuario responde SI
afirmativo(S):-
  member('si',S).

% afirmativo/1
% Retorna verdadero si el usuario responde SI
negativo(S):-
  member('no',S).

% salir/1
% Verifica si la entrada contiene la frase de despedida
salir(S):-
    sub_conjunto([adios], S).

%modificado-se quitó nombre

% verificar_dispositivo/1
% Verifica si el dispositivo es valido, y lo agrega a la base de datos actual.
verificar_dispositivo(S):-
  dispositivos(D),
  intersecar(S, D, A),
  A \== [],
  assert(dispositivo(A)).

% verificar_problema/1
% Verifica que el usuario este ingresando un problema.
verificar_problema(S):-
  es_causa(S,N),!,
  brindar_solucion(N,R),
  mostrar_lista(R).

verificar_problema(S):-
  es_caso_especial(S,N),!,
  brindar_solucion(N).

verificar_problema(_):-
  respuestas(problema,LP),
  respuesta_aleatoria(LP,RA),
  imprimir_usuario(bot),
  mostrar_lista(RA),fail.

% es_causa/2
% Indica si en una oraciÃ³n se da una causa principal
es_causa(S,N):-
  dispositivo(D),n_elemento(D,1,Disp),
  modeloCausa(Disp,S,_,N).

% es_caso_especial/?
% Indica si se hace request de un problema especÃ­fico
es_caso_especial(S,N):-
  dispositivo(D),n_elemento(D,1,Disp),
  modeloProbRef(Disp,S,_,N).

:- consultar. %Cierre del programa
