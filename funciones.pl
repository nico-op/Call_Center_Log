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
    sub_lista(B, A),
    B \= [].

% mostrar_lista/1
% Tiene como funcion imprimer unalista que seria la oracion pero eliminando de ella las comas o corchetes
mostrar_lista([]):- nl.
mostrar_lista([H|T]):-
    write(H),
    write(' '),
    mostrar_lista(T).

% mostrar_listacero/2
% Tiene como funcion el imprimer el contenido de una lista como una unsorted
mostrar_listacero(0,_).
mostrar_listacero(N,L):-
  n_elemento(L, N, R),
  write('\t* '), mostrar_lista(R),
  M is N - 1,
  mostrar_listacero(M,L).

% mostrar_seleccion/2
% Tiene como funcion imprimir el contenido de los indices 
mostrar_seleccion(_,[]).
mostrar_seleccion(L,[N1|NX]):-
  n_elemento(L, N1, R),
  write('\t* '), mostrar_lista(R),
  mostrar_seleccion(L,NX).

% intersecar(Set1, Set2, sub_conjunto)
% Tiene como funcion examinar si sub_conjunto se une con set1 y set2 
intersecar([], _, []).
intersecar([H|T1], L2, [H|T3]):-
        member(H, L2), !,
        intersecar(T1, L2, T3).
intersecar([_|T1], L2, L3):-
        intersecar(T1, L2, L3).

% n_elemento(List, N, Elemento)
% Tiene como funcion detectar si el enesimo elemento de la lista es un elemento, en caso de que si
% devuelve true 
n_elemento([H|_], 1, H).
n_elemento([_|T], N, X):-
    n_elemento(T, N1, X),
    N is N1 + 1.

% sub_lista(sub_lista, Lista)
% Se hace la definicion de que es una sub_lista
sub_lista(S, L) :-
    append(_, L2, L),
    append(S, _, L2).

% sub_conjunto(sub_conjunto, Set)
% Si sub_conjunto forma parte de set devuelve true 
sub_conjunto([], _).
sub_conjunto([H|T], L2):-
    member(H, L2),
    sub_conjunto(T, L2).
