%----------------------------------------------------------------------
%               SISTEMA EXPERTO (Detecta Patrones en las oraciones)
%----------------------------------------------------------------------


%----------------------------------------------------
%          modeloConsulta/2
%----------------------------------------------------
% Busca modelos de oraciones que indican que sea una consulta a resolver lo que el usuario solicita

%----------------------------------------------------
%          CONSULTA
%----------------------------------------------------

modeloConsulta([tengo, una, consulta, X|_],X):-!.
modeloConsulta([necesito, consultar, X|_],X):-!.
modeloConsulta([realizar, una, consulta, X|_],X):-!.
modeloConsulta([hacer, una, consulta, X|_],X):-!.
modeloConsulta([necesito, conocer, X|_],X):-!.
modeloConsulta([consulta, X|_],X):-!.
modeloConsulta([consultar, X|_],X):-!.

%----------------------------------------------------
%          CAUSAS
%----------------------------------------------------
modeloConsulta([cuales, son, las, causas, X|_],X):-!.
modeloConsulta([quiero, saber, las, causas, X|_],X):-!.
modeloConsulta([cual, es, la, causa, X|_],X):-!.
modeloConsulta([causas, X|_],X):-!.
modeloConsulta([causa, X|_],X):-!.
modeloConsulta([que, puede, causar, X|_],X):-!.
%----------------------------------------------------
%          POR QUÉ
%----------------------------------------------------
modeloConsulta([por, que, X|_],X):-!.
modeloConsulta([_|T],X):-
  modeloConsulta(T,X).


%----------------------------------------------------
%          modeloReferencia/2
%----------------------------------------------------
% Busca modelos de oraciones que indican que sea una referencia lo que el usuario solicita

% Referencia
modeloReferencia([tienes, una, referencia, X|_],X):-!.
modeloReferencia([tendras, referencias, X|_],X):-!.
modeloReferencia([puedo, conseguir, informacion, X|_],X):-!.
modeloReferencia([tienes, informacion, acerca, de, X|_],X):-!.
modeloReferencia([necesito, conocer,cuando, X|_],X):-!.
modeloReferencia([necesito, informacion, cuando, X|_],X):-!.
modeloReferencia([tienes, alguna, referencia, X|_],X):-!.
modeloReferencia([necesito, saber, porque, X|_],X):-!.
modeloReferencia([referencia, X|_],X):-!.
modeloReferencia([referencias, X|_],X):-!.

modeloReferencia([_|T],X):-
  modeloReferencia(T,X).


%----------------------------------------------------
%          modeloProblema/2
%----------------------------------------------------
% Busca modelos de oraciones que indican que sea una problema a resolver lo que el usuario solicita
modeloProblema([tengo, un, problema, X |_], X):- !.
modeloProblema([presentan, un, problema, X |_], X):-!.
modeloProblema([presenta, un, problema, X |_], X):-!.
modeloProblema([tiene, un, problema, X |_], X):-!.
modeloProblema([tienen, un, problema, X |_], X):-!.
modeloProblema([problema, X |_], X):-!.

%----------------------------------------------------
%          verbo funcionar
%----------------------------------------------------
modeloProblema([no, funciona, X |_], X):-!.
modeloProblema([no, funcionan, X |_], X):-!.
modeloProblema([no, esta, funcionando, X |_], X):- !.
modeloProblema([no, estan, funcionando, X |_], X):- !.
modeloProblema([mal, funcionamiento, X |_], X):-!.
modeloProblema([funciona, mal, X |_], X):- !.
modeloProblema([funcionan, mal, X |_], X):- !.
modeloProblema([funcionar, X |_], X):- !.

%----------------------------------------------------
%          verbo danar
%----------------------------------------------------
modeloProblema([esta, danado, X|_], X):- !.
modeloProblema([estan, danados, X|_], X):- !.
modeloProblema([esta, danada, X|_], X):- !.
modeloProblema([se,dano, X|_], X):-!.
modeloProblema([se,danaron, X|_], X):-!.
modeloProblema([un,dano, X|_], X):-!.

%----------------------------------------------------
%          verbo/adjetivos sin calificar
%----------------------------------------------------
modeloProblema([no, corre, X |_], X):-!.
modeloProblema([algo, anda, mal, X |_], X):-!.
modeloProblema([presenta, un, error, X |_], X):-!.
modeloProblema([esta, malo, X |_], X):-!.
modeloProblema([estan, malos, X |_], X):-!.
modeloProblema([no, sirve, X |_], X):-!.
modeloProblema([tengo, un, inconveniente, X |_], X):-!.
modeloProblema([tengo, inconvenientes, X |_], X):-!.
modeloProblema([presento, un, inconveniente, X |_], X):-!.
modeloProblema([presenta, un, inconveniente, X |_], X):-!.
modeloProblema([se, me, presenta, un, inconveniente, X |_], X):-!.
modeloProblema([tengo, dificultades, X |_], X):-!.
modeloProblema([tengo, una, dificultad, X |_], X):-!.
modeloProblema([dificultades, X |_], X):-!.
modeloProblema([dificultad, X |_], X):-!.

modeloProblema([_|T], X):-
  modeloProblema(T, X).


%----------------------------------------------------
%          modeloProbRef/4
%----------------------------------------------------
% Problema-Referencia de computadora
% modeloCausa(dispositivo,lista,compara,numero referencia(base de datos)).

modeloProbRef(computadora,[y,sus, problemas, mas, comunes, X|_],X, [11,10,9,8,7,6,5,4,3,2,1]):-!.
modeloProbRef(computadora,[la, tarjeta, de, red, mala, X|_],X,[11]):- !.
modeloProbRef(computadora,[el, adaptador, de, red, no, funciona, X|_],X, [10]):- !.
modeloProbRef(computadora,[no, tiene, instalados, los, drivers, wifi, X|_],X, [9]):- !.
modeloProbRef(computadora,[la,direccion, ip, o, dns, mal, configurados, X|_],X, [8]):- !.
modeloProbRef(computadora,[el, antivirus, puede, estar, bloqueando, el, acceso, a, internet, X|_],X, [7]):- !.
modeloProbRef(computadora,[cuando,hay,interrupcion, de, servicio, en, la, zona,X|_],X, [6]):- !.
modeloProbRef(computadora,[hay, cortes, de, electricidad, en, la, zona,y,se, cae,el,internet, X|_],X, [5]):- !.
modeloProbRef(computadora,[el, cable, de, red, esta, malo, X|_],X,[4]):- !.
modeloProbRef(computadora,[el, cable, de, internet, no, esta, conectado, a, la, computadora, X|_],X, [3]):- !.
modeloProbRef(computadora,[el, modem, no, funciona, X|_],X, 2):- !.
modeloProbRef(computadora,[no, esta, conectada, al, wifi, X|_],X,1):- !.

modeloProbRef(D,[_|T],X,N):-
  modeloProbRef(D,T,X,N).


%----------------------------------------------------
%          modeloCausa/4
%----------------------------------------------------
% Causas computadora.
% Busca modelo de oraciones que coincidan en las causas de un problema.
% modeloCausa(dispositivo,lista,compara,numero solucion(base de datos)).

modeloCausa(computadora, [una,tarjeta,  de,  red, mala,  X |_], X, NS):-!, NS is 1.
modeloCausa(computadora, [cuando, el, adaptador, de, red, no, funciona, X |_], X, NS):-!, NS is 2.
modeloCausa(computadora, [cuando, no,  tiene,  instalados, los, drivers,  wifi, X |_], X, NS):-!, NS is 3.
modeloCausa(computadora, [la,  direccion,  ip , o,  dns, mal, configurados, X |_], X, NS):-!, NS is 4.
modeloCausa(computadora, [el, antivirus, puede,  estar , bloqueando, el, acceso, a , internet,  X |_], X, NS):-!, NS is 5.
modeloCausa(computadora, [interrupcion, de,  servicio, en, la,  zona,  X |_], X, NS):-!, NS is 6.
modeloCausa(computadora,[cuando,hay, cortes, de, electricidad, en, la, zona,y, se, cae, el, internet, X |_], X, NS):-!, NS is 7.
modeloCausa(computadora, [el, cable, de, red, es, disfuncional, X |_], X, NS):-!, NS is 8.
modeloCausa(computadora, [no, esta, conectado, cable, ethernet, X |_], X, NS):-!, NS is 9.
modeloCausa(computadora, [no, funciona, el,wifi, X |_], X, NS):-!, NS is 10.
modeloCausa(computadora, [no, esta, conectada, al, wifi, X |_], X, NS):-!, NS is 11.

modeloCausa(D, [_|T], X, NS):-
  modeloCausa(D, T, X, NS).
