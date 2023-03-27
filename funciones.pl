%---------------------------------------
%            FUNCIONES 
%---------------------------------------

% Aqui se colocan funciones basicas en Prolog, por ejemplo definicion de sublistas 
% imprimir listas, declaracion de elementos y atomos

% Tiene la funcion de que si el substring se encuentra en el string principal retorna true
% contiene(String, SubString)
contiene(A, B) :-
    atom(A),
    atom(B),
    name(A, AA),
    name(B, BB),
    contiene(AA, BB).
contiene(A, B) :-
    atom(A),
    name(A, AA),
    contiene(AA, B).
contiene(A, B) :-
    sublista(B, A),
    B \= [].

% imprimir_lista/1
% Tiene como funcion imprimer unalista que seria la oracion pero eliminando de ella las comas o corchetes
imprimir_lista([]):- nl.
imprimir_lista([H|T]):-
    write(H),
    write(' '),
    imprimir_lista(T).

% imprimir_ul/2
% Tiene como funcion el imprimer el contenido de una lista como una unsorted
imprimir_ul(0,_).
imprimir_ul(N,L):-
  nElemento(L, N, R),
  write('\t* '), imprimir_lista(R),
  M is N - 1,
  imprimir_ul(M,L).

% imprimir_seleccion/2
% Tiene como funcion imprimir el contenido de los indices 
imprimir_seleccion(_,[]).
imprimir_seleccion(L,[N1|NX]):-
  nElemento(L, N1, R),
  write('\t* '), imprimir_lista(R),
  imprimir_seleccion(L,NX).

% interseca(Set1, Set2, SubSet)
% Tiene como funcion examinar si subset se une con set1 y set2 
interseca([], _, []).
interseca([H|T1], L2, [H|T3]):-
        member(H, L2), !,
        interseca(T1, L2, T3).
interseca([_|T1], L2, L3):-
        interseca(T1, L2, L3).

% nElemento(List, N, Elemento)
% Tiene como funcion detectar si el enesimo elemento de la lista es un elemento, en caso de que si
% devuelve true 
nElemento([H|_], 1, H).
nElemento([_|T], N, X):-
    nElemento(T, N1, X),
    N is N1 + 1.

% sublista(SubLista, Lista)
% Se hace la definicion de que es una sublista
sublista(S, L) :-
    append(_, L2, L),
    append(S, _, L2).

% subset(SubSet, Set)
% Si subset forma parte de set devuelve true 
subset([], _).
subset([H|T], L2):-
    member(H, L2),
    subset(T, L2).
