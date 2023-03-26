% Archivo:      patrones-modificado.pl
% Autor:        Kevin Lobo, Nicol Otarola, Meibel Ceciliano
%
% Descripción:  Busca patrones especiales en la comunicación con el usuario.


% patronConsulta/2
% Busca patrones que indican que el usuario está realizando
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

% ¿Por qué?
patronConsulta([por, que, X|_],X):-!.

patronConsulta([_|T],X):-
  patronConsulta(T,X).

% patronReferencia/2
% Busca patrones que indican que el usuario está solicitando
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

%~ daños
patronProblema([esta, danado, X|_], X):- !.
patronProblema([estan, danados, X|_], X):- !.
patronProblema([esta, dañnda, X|_], X):- !.
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

% Problema-Referencia de computadora
patronProbRef(computadora,[no, trabaja, X|_],X, [10,9,4]):- !.


% patronCausa/4
% para que estos patrones funcionen, se necesita un punto al final
% Busca patrones en las causas de un problemas


% Causas computadora
patronCausa(computadora, [esta, descargada, X |_], X, NS):-! ,NS is 10.
patronCausa(computadora, [no, enciende, X |_], X, NS):- !, NS is 9.
patronCausa(computadora, [no, esta, encendida, X |_], X, NS):-!, NS is 9.
patronCausa(computadora, [no, responde, X |_], X, NS):- !, NS is 8.
patronCausa(computadora, [no, esta, actualizada, X |_], X, NS):-!, NS is 7.
patronCausa(computadora, [no, esta, conectada, al, wifi, X |_], X, NS):-!, NS is 6.
patronCausa(computadora, [esta, desconectada, de, sus, datos, X |_], X, NS):-!, NS is 5.
patronCausa(computadora, [esta, llena, X |_], X, NS):-!, NS is 4.
patronCausa(computadora, [volumen, bajo, X |_], X, NS):-!, NS is 3.
patronCausa(computadora, [esta, sucia, X |_], X, NS):- !, NS is 2.
patronCausa(computadora, [esta, vieja, X |_], X, NS):- !, NS is 1.


% patronCausa( Dispositivo, Oración, Comparador, Número de Solución).
patronCausa(D, [_|T], X, NS):-
  patronCausa(D, T, X, NS).
