
%---------------------------------------
%                BNF
%---------------------------------------

% La notacion Backus-Naur es un metalenguaje usado para expresar
% gramaticas libres de contexto, describiendo lenguajes formales.
% Mediante el BNF se estableceran las estructuras o sintagmas para
%la creacion de oraciones en CallCenterLog.

%-----------------------------------
%    ESTRUCTURA DE ORACIONES
%-----------------------------------

oracion(S0, S) :-
    sintagma_nominal(Num, _, Pers, S0, S1),
    sintagma_verbal(Num, _, Pers, S1, S).

oracion(S0, S) :-
    pronombre(Num, Gen, Pers, S0, S1),
    sintagma_verbal(Num, Gen, Pers, S1, S).

oracion(S0, S) :-
    pregunta(S0, S1),
    pronombre(S1, S2),
    sintagma_verbal(_, _, _, S2, S).

oracion(S0, S) :-
    pregunta(S0, S1),
    adverbio(S1, S).

oracion(S0, S) :-
    pregunta(S0, S1),
    determinante(_, _, _, S1, S).

oracion(S0, S) :-
    sintagma_verbal(_, _, _, S0, S1),
    adjetivo(S1, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    sintagma_verbal(Num, Gen, Pers, S1, S2),
    adjetivo(S2, S).

oracion(S0, S) :-
    adjetivo(S0, S1),
    sintagma_nominal(_, _, _, S1, S2),
    sintagma_verbal(_, _, _, S2, S3),
    adjetivo(S3, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    adverbio(S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    adjetivo(S0, S1),
    sintagma_nominal(_, _, _, S1, S2),
    sintagma_verbal(_, _, _, S2, S3),
    sintagma_verbal(_, _, _, S3, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    adverbio(S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    sintagma_verbal(Num, Gen, Pers, S0, S1),
    sintagma_nominal(Num, Gen, Pers, S1, S2),
    adverbio(S2, S).

oracion(S0, S) :-
    sintagma_verbal(Num, Gen, Pers, S0, S1),
    sintagma_nominal(Num, Gen, Pers, S1, S).

oracion(S0, S) :-
    sintagma_nominal(Num, Gen, Pers, S0, S1),
    pronombre(S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    adverbio(S0, S1),
    determinante(Num, Gen, Pers, S1, S2),
    sintagma_verbal(Num, Gen, Pers, S2, S).

oracion(S0, S) :-
    adverbio(S0, S1),
    sintagma_verbal(_, _, _, S1, S).

% Sintagma Nominal %
sintagma_nominal(Num, Gen, Pers, S0, S) :-
    determinante(Num, Gen, Pers, S0, S1),
    sustantivo(Num, Gen, S1, S).

% Sintagma Verbal %
sintagma_verbal(Num, _, Pers, S0, S) :-
    verbo(Num, Pers, S0, S1),
    sintagma_nominal(_, _, _, S1, S).

sintagma_verbal(Num, _, Pers, S0, S) :-
    verbo(Num, Pers, S0, S).


%-------------------------------
%        ADJETIVOS
%-------------------------------
%% Un adjetivo es aquel que describe al sustantivo, aqui se van a colocar
% aquellos adjetivos usados en la base de datos

%Calificativos
adjetivo([correcta|S], S).
adjetivo([conectada|S], S).
adjetivo([conectado|S], S).
adjetivo([configurados|S], S).
adjetivo([dañado|S], S).
adjetivo([dañada|S], S).
adjetivo([dañado|S], S).
adjetivo([disfuncional|S], S).
adjetivo([electrico|S], S).
adjetivo([funcional|S], S).
adjetivo([grande|S], S).
adjetivo([instalados|S], S).
adjetivo([inservible|S], S).
adjetivo([mal|S], S).
adjetivo([malo|S], S).
adjetivo([mal|S], S).
adjetivo([predeterminado|S], S).
adjetivo([rota|S], S).
adjetivo([roto|S], S).
adjetivo([sucia|S], S).
adjetivo([sucio|S], S).
adjetivo([sirve|S], S).

%Posesivos
adjetivo([mi|S], S).
adjetivo([mio|S], S).
adjetivo([mia|S], S).
adjetivo([suya|S], S).
adjetivo([suyo|S], S).
adjetivo([su|S], S).
adjetivo([tuyo|S], S).
adjetivo([tuya|S], S).
adjetivo([tu|S], S).


%-----------------------------
%        ADVERBIOS
%-----------------------------
% Los adverbios son una parte de la oración que complementa a un verbo,
% adjetivo, u otros adverbios e incluso oraciones.Se
% necesitaran los siguientes:

adverbio([aqui|S], S).
adverbio([bien|S], S).
adverbio([entonces|S], S).
adverbio([mal|S], S).
adverbio([mucho|S], S).
adverbio([muy|S], S).
adverbio([no|S], S).
adverbio([nunca|S], S).
adverbio([nada|S], S).
adverbio([poco|S], S).
adverbio([si|S], S).
adverbio([tambien|S], S).

%-----------------------------
%        DETERMINANTES
%-----------------------------
%Los artículos introducen a los sustantivos a los que acompañan y preceden
% indicando su género (masculino, femenino), persona y número (singular,
% plural).
% %Articulos usados en la base de datos

determinante(sing, _, _, [como|S], S).
determinante(sing, _, _, [cuanto|S], S).
determinante(plu, _, _, [cuantos|S], S).
determinante(sing, _, _, [cuanta|S], S).
determinante(plu, _, _, [cuantas|S], S).
determinante(sing, masc, tercera, [el|S], S).
determinante(sing, masc, _, [este|S], S).
determinante(plu, masc, _, [estos|S], S).
determinante(sing, fem, _, [esta|S], S).
determinante(plu, masc, _, [estas|S], S).
determinante(plu, masc, tercera, [los|S], S).
determinante(sing, fem, tercera, [la|S], S).
determinante(plu, fem, tercera, [las|S], S).
determinante(sing, _, _, [mi|S], S).
determinante(plu, _, _, [mis|S], S).
determinante(sing, _, _, [que|S], S).
determinante(sing, _, _, [su|S], S).
determinante(plu, _, _, [sus|S], S).
determinante(sing, masc, tercera, [un|S], S).
determinante(plu, masc, tercera, [unos|S], S).
determinante(sing, fem, tercera, [una|S], S).
determinante(plu, fem, tercera, [unas|S], S).
determinante(plu, masc, _, [varios|S], S).
determinante(plu, fem, _, [varias|S], S).


%--------------------------------
%    INTERROGANTES/PREGUNTAS
%--------------------------------
%Aqui se colocan las preguntas que seran utilizadas:

pregunta([a, donde|S], S).
pregunta([cuanto|S], S).
pregunta([cual|S], S).
pregunta([cuales|S], S).
pregunta([cuando|S], S).
pregunta([como|S], S).
pregunta([donde|S], S).
pregunta([porque|S], S).
pregunta([por, que|S], S).
pregunta([por|S], S).
pregunta([que|S], S).
pregunta([quien|S], S).


%------------------------------
%         PRONOMBRES
%------------------------------
% Los pronombres son palabras que reemplazan al sustantivo en
% una oración y evitan tener que mencionarlo directamente.
%Los Pronombres personales que seran usados en la base de datos son:

pronombre(sing,masc, tercera, [el|S], S).
pronombre(sing,fem,tercera,[ella|S],S).
pronombre(plu, masc,tercera, [ellos|S], S).
pronombre(plu,fem,tercera,[ellas|S],S).
pronombre(plu,fem,primera,[nosotras|S],S).
pronombre(plu,masc, primera, [nosotros|S], S).
pronombre(sing,_,segunda,[tu|S],S).
pronombre(sing,_,segunda,[usted|S],S).
pronombre(plu,_,segunda,[ustedes|S],S).
pronombre(sing, _, primera, [yo|S], S).


pronombre([le|S], S).
pronombre([lo|S], S).
pronombre([la|S], S).
pronombre([les|S], S).
pronombre([me|S], S).
pronombre([nos|S], S).
pronombre([os|S], S).
pronombre([que|S], S).
pronombre([se|S], S).
pronombre([te|S], S).


%--------------------------------
%          SUSTANTIVOS
%--------------------------------
% Un sustantivo se utiliza para nombrar cosas, personas o animales,
% ej:perro,lapiz, juan
% Aqui se encuentran los sustantivos incluidos en callcenterlog

sustantivo(sing,masc,[adaptador|S],S).
sustantivo(sing,masc,[antivirus|S],S).
sustantivo(sing,masc,[callcenterlog|S],S).
sustantivo(sing,fem,[causa|S],S).
sustantivo(sing,masc,[cable|S],S).
sustantivo(sing,fem,[computadora|S],S).
sustantivo(plu,masc,[cortes|S],S).
sustantivo(sing,fem,[compañía|S],S).
sustantivo(sing,fem,[configuración|S],S).
sustantivo(sing,fem,[direccion|S],S).
sustantivo(sing,masc,[dns|S],S).
sustantivo(plu,masc,[drivers|S],S).
sustantivo(sing,masc,[error|S],S).
sustantivo(sing,fem,[electricidad|S],S).
sustantivo(sing,masc,[fluido|S],S).
sustantivo(sing,masc,[interrupcion|S],S).
sustantivo(plu,fem,[interrupciones|S],S).
sustantivo(sing,fem,[ip|S],S).
sustantivo(sing,masc,[internet|S],S).
sustantivo(sing,fem,[luz|S],S).
sustantivo(sing,fem,[manera|S],S).
sustantivo(sing,masc,[modem|S],S).
sustantivo(sing,fem,[pregunta|S],S).
sustantivo(sing,masc,[problema|S],S).
sustantivo(sing,masc,[puerto|S],S).
sustantivo(sing,fem,[referencia|S],S).
sustantivo(plu,fem,[referencias|S],S).
sustantivo(sing,fem,[respuesta|S],S).
sustantivo(sing,fem,[red|S],S).
sustantivo(sing,masc,[servicio|S],S).
sustantivo(sing,masc,[sistema|S],S).
sustantivo(sing, fem, [situacion|S], S).
sustantivo(sing,fem,[solucion|S],S).
sustantivo(sing,fem,[tarjeta|S],S).
sustantivo(sing,masc,[wifi|S],S).
sustantivo(sing,fem,[zona|S],S).


%-----------------------------------
%          VERBOS
%-----------------------------------
% Un verbo es una palabra con la que se pueden expresar acciones, procesos, estados, tiene tiempo, numero y persona, aqui se definen
%los verbos que se emplearan para la base de datos

%Para mayor facilidad se van a colocar los verbos en orden alfabetico

%A
verbo(sing, primera, [ayudar|S], S).
verbo(plu,tercera,[alumbrando|S], S).


%B
verbo(sing,_,[bloqueando|S], S).

%C
verbo(sing,tercera,[conectada|S], S).
verbo(sing,tercera,[conectado|S], S).
verbo(sing,tercera,[cae|S], S).
verbo(plu,tercera,[conectando|S], S).
verbo(sing,tsegunda,[conectarse|S], S).
verbo(sing,tercera,[cambiado|S], S).
verbo(sing,segunda,[conecte|S], S).
verbo(sing,primera,[cambio|S], S).
verbo(sing,tercera,[cambio|S], S).
verbo(sing,tercera,[cambien|S], S).
verbo(sing,segunda,[cambien|S], S).
verbo(sing,tercera,[conecta|S], S).
verbo(plu,tercera,[conectan|S], S).
verbo(sing,primera,[conectar|S], S).
verbo(sing,segunda,[conecte|S], S).
verbo(sing,segunda,[contacte|S], S).


%D
verbo(sing, segunda, [debera|S], S).
verbo(sing, segunda, [debe|S], S).
verbo(sing,segunda,[debe|S], S).
verbo(sing, segunda, [dicen|S], S).
verbo(sing, segunda, [descargue|S], S).
verbo(sing, segunda, [descargo|S] ,S).


%E
verbo(sing,tercera,[encuentra|S], S).
verbo(sing,tercera,[esta|S], S).
verbo(sing, segunda, [esta|S], S).
verbo(sing,primera,[estar|S], S).
verbo(sing,tercera,[es|S], S).
verbo(sing,primera,[este|S], S).
verbo(sing,segunda,[espere|S], S).
verbo(sing, segunda, [encienda|S], S).
verbo(sing, primera, [entiendo|S], S).
verbo(sing, segunda, [empiece|S], S).


%F
verbo(sing, tercera, [funciona|S], S).
verbo(plu, tercera, [funcionan|S], S).
verbo(sing, segunda, [facilitar|S], S).

%G
%H
verbo(sing,tercera,[ha|S], S).
verbo(sing,segunda,[ha|S], S).
verbo(plu,tercera,[han|S], S).
verbo(plu,segunda,[han|S], S).
verbo(sing, segunda, [haga|S], S).


%I
verbo(plu,tercera,[instalados|S], S).
verbo(sing,primera,[instalar|S], S).
verbo(sing, segunda, [instale|S], S).
verbo(sing, segunda, [instalo|S], S).
verbo(sing,_,[interrupcion|S], S).
verbo(sing,primera,[intentar|S], S).
verbo(sing, segunda, [intente|S], S).
verbo(sing, segunda, [intento|S], S).


%J
%K
%L
verbo(sing,primera,[llevar|S], S).
verbo(sing,primera,[limpiar|S], S).
verbo(sing, segunda, [llame|S], S).


%M

%N
verbo(sing,segunda,[notificado|S], S).
verbo(sing,tercera,[notificado|S], S).
verbo(sing, primera, [necesito|S], S).
verbo(sing, tercera, [necesita|S], S).
verbo(sing, segunda, [necesita|S], S).


%Ñ

%O
verbo(sing,segunda,[ocurrido|S], S).
verbo(sing,tercera,[ocurrido|S], S).

%P
verbo(sing,tercera,[puede|S], S).
verbo(plu,tercera,[pueden|S], S).
verbo(plu,segunda,[pueden|S], S).
verbo(sing,segunda,[proceda|S], S).
verbo(sing, primera, [parece|S], S).
verbo(sing, primera, [puedo|S], S).
verbo(sing, segunda, [pueda|S], S).
verbo(sing, segunda, [puede|S], S).
verbo(sing, segunda, [podria|S], S).
verbo(sing, segunda, [pruebe|S], S).

%Q

%R
verbo(sing,primera,[reviso|S], S).
verbo(sing,segunda,[reviso|S], S).
verbo(sing,segunda,[reestablezca|S], S).
verbo(sing,tercera,[reestablezca|S], S).
verbo(sing,segunda,[reinstale|S], S).
verbo(sing,tercera,[reconoce|S], S).
verbo(sing,segunda,[reconoce|S], S).
verbo(plu,tercera,[reestablezcan|S], S).
verbo(plu,segunda,[reestablezcan|S], S).
verbo(sing, primera, [realice|S], S).
verbo(sing, segunda, [revise|S], S).


%S
verbo(plu,primera,[sentimos|S], S).
verbo(sing,tercera,[se|S], S).
verbo(sing, tercera, [sirve|S], S).
verbo(plu, tercera, [sirven|S], S).
verbo(sing, tercera, [es|S], S).
verbo(sing, segunda, [es|S], S).
verbo(plu, tercera, [son|S], S).


%T
verbo(sing,tercera,[tiene|S], S).
verbo(sing,segunda,[tenga|S], S).
verbo(sing,tercera,[tenga|S], S).
verbo(sing, primera, [tengo|S], S).
verbo(plu, tercera, [tienen|S], S).
verbo(sing, segunda, [tendra|S], S).
verbo(sing, segunda, [tendran|S], S).


%U
verbo(sing, tercera, [usa|S], S).
verbo(plu, tercera, [usan|S], S).
verbo(sing, tercera, [utiliza|S], S).
verbo(plu, tercera, [utilizan|S], S).

%V
verbo(sing,segunda,[verifique|S], S).

%W
%X
%Y
























