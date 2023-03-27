%----------------------------------------------------------------------
%               SISTEMA EXPERTO (Detecta Patrones en las oraciones)
%----------------------------------------------------------------------

% patronConsulta/2
% Busca patrones que indican que el usuario esta realizando
% una consulta.

% Consulta
patronConsulta([tengo, una, consulta, X|_],X):-!.
patronConsulta([necesito, consultar, X|_],X):-!.
patronConsulta([realizar, una, consulta, X|_],X):-!.
patronConsulta([hacer, una, consulta, X|_],X):-!.
patronConsulta([necesito, conocer, X|_],X):-!.
patronConsulta([consulta, X|_],X):-!.
patronConsulta([consultar, X|_],X):-!.

% Causas
patronConsulta([cuales, son, las, causas, X|_],X):-!.
patronConsulta([quiero, saber, las, causas, X|_],X):-!.
patronConsulta([cual, es, la, causa, X|_],X):-!.
patronConsulta([causas, X|_],X):-!.
patronConsulta([causa, X|_],X):-!.
patronConsulta([que, puede, causar, X|_],X):-!.

% Why?
patronConsulta([por, que, X|_],X):-!.

patronConsulta([_|T],X):-
  patronConsulta(T,X).

% patronReferencia/2
% Busca patrones que indican que el usuario estÃ¡ solicitando
% una Referencia.

% Referencia
patronReferencia([tienes, una, referencia, X|_],X):-!.
patronReferencia([tendras, referencias, X|_],X):-!.
patronReferencia([puedo, conseguir, informacion, X|_],X):-!.
patronReferencia([tienes, informacion, acerca, de, X|_],X):-!.
patronReferencia([necesito, conocer, X|_],X):-!.
patronReferencia([necesito, informacion, X|_],X):-!.
patronReferencia([tienes, alguna, referencia, X|_],X):-!.
patronReferencia([referencia, X|_],X):-!.
patronReferencia([referencias, X|_],X):-!.

patronReferencia([_|T],X):-
  patronReferencia(T,X).

% patronProblema/2
% Busca patrones que indican un problema del usuario.

%~ problema
patronProblema([tengo, un, problema, X |_], X):- !.
patronProblema([presentan, un, problema, X |_], X):-!.
patronProblema([presenta, un, problema, X |_], X):-!.
patronProblema([tiene, un, problema, X |_], X):-!.
patronProblema([tienen, un, problema, X |_], X):-!.
patronProblema([problema, X |_], X):-!.

%~ funciona
patronProblema([no, funciona, X |_], X):-!.
patronProblema([no, funcionan, X |_], X):-!.
patronProblema([no, esta, funcionando, X |_], X):- !.
patronProblema([no, estan, funcionando, X |_], X):- !.
patronProblema([mal, funcionamiento, X |_], X):-!.
patronProblema([funciona, mal, X |_], X):- !.
patronProblema([funcionan, mal, X |_], X):- !.
patronProblema([funcionar, X |_], X):- !.

% danos
patronProblema([esta, danado, X|_], X):- !.
patronProblema([estan, danados, X|_], X):- !.
patronProblema([esta, danada, X|_], X):- !.
patronProblema([se,dano, X|_], X):-!.
patronProblema([se,danaron, X|_], X):-!.
patronProblema([un,dano, X|_], X):-!.

% Expresiones varias
patronProblema([no, corre, X |_], X):-!.
patronProblema([algo, anda, mal, X |_], X):-!.
patronProblema([presenta, un, error, X |_], X):-!.
patronProblema([esta, malo, X |_], X):-!.
patronProblema([estan, malos, X |_], X):-!.
patronProblema([no, sirve, X |_], X):-!.
patronProblema([tengo, un, inconveniente, X |_], X):-!.
patronProblema([tengo, inconvenientes, X |_], X):-!.
patronProblema([presento, un, inconveniente, X |_], X):-!.
patronProblema([presenta, un, inconveniente, X |_], X):-!.
patronProblema([se, me, presenta, un, inconveniente, X |_], X):-!.
patronProblema([tengo, dificultades, X |_], X):-!.
patronProblema([tengo, una, dificultad, X |_], X):-!.
patronProblema([dificultades, X |_], X):-!.
patronProblema([dificultad, X |_], X):-!.

patronProblema([_|T], X):-
  patronProblema(T, X).

% patronProbRef/4
%
% Problema-Referencia de computadora
patronProbRef(computadora,[no, esta, conectada, al, wifi, X|_],X, [1]):- !.

patronProbRef(computadora,[el, modem, no, funciona, X|_],X, [2]):- !.

patronProbRef(computadora,[el, cable, de, internet, no, esta, conectado, a, la, computadora, X|_],X, [3]):- !.

patronProbRef(computadora,[el, cable, de, red, esta, malo, X|_],X,[4]):- !.

patronProbRef(computadora,[cortes, de, electricidad, en, la, zona, cae, internet, X|_],X, [5]):- !.

patronProbRef(computadora,[interrupcion, de, servicio, en, la, zona,X|_],X, [6]):- !.

patronProbRef(computadora,[el, antivirus, puede, estar, bloqueando, el, acceso, a, internet, X|_],X, [7]):- !.

patronProbRef(computadora,[direccion, ip, o, dns, mal, configurados, X|_],X, [8]):- !.

patronProbRef(computadora,[no, tiene, instalado, los, drivers, wifi, X|_],X, [9]):- !.

patronProbRef(computadora,[el, adaptador, de, red, de, la, computadora, no, funciona, X|_],X, [10]):- !.

patronProbRef(computadora,[la, tarjeta, de, red, esta, mala, X|_],X,[11]):- !.

patronProbRef(computadora,[enviarme, referencias, de, los, problemas, mas, comunes, en, una, computadora, X|_],X, [11,10,9,8,7,6,5,4,3,2,1]):-!.

patronProbRef(D,[_|T],X,N):-
  patronProbRef(D,T,X,N).

% patronCausa/4
% para que estos patrones funcionen, se necesita un punto al final
% Busca patrones en las causas de un problemas

% Causas computadora
patronCausa(computadora, [no, esta, conectada, al, wifi, X |_], X, NS):-!, NS is 1.
patronCausa(computadora, [no, funciona, wifi, X |_], X, NS):-!, NS is 2.
patronCausa(computadora, [no, esta, conectado, cable, ethernet, X |_], X, NS):-!, NS is 3.
patronCausa(computadora, [el, cable, de, red, es, disfuncional, X |_], X, NS):-!, NS is 4.
patronCausa(computadora, [cortes, de, electricidad, en, la, zona, se, cae, el, internet, X |_], X, NS):-!, NS is 5.
patronCausa(computadora, [interrupcion, de,  servicio, en, la,  zona,  X |_], X, NS):-!, NS is 6.
patronCausa(computadora, [el, antivirus, puede,  estar , bloqueando, el, acceso, a , internet,  X |_], X, NS):-!, NS is 7.
patronCausa(computadora, [la,  direccion,  ip , o,  dns, puede, estar, mal, configurados, X |_], X, NS):-!, NS is 8.
patronCausa(computadora, [no,  tiene,  instalados, drivers,  wifi, X |_], X, NS):-!, NS is 9.
patronCausa(computadora, [el, adaptador, de, red, de, la , computadora, no, funciona, X |_], X, NS):-!, NS is 10.
patronCausa(computadora, [tarjeta,  de,  red, mala,  X |_], X, NS):-!, NS is 11.



% patronCausa( Dispositivo, Lista, Comparador, Numero de Solucion).
patronCausa(D, [_|T], X, NS):-
  patronCausa(D, T, X, NS).
