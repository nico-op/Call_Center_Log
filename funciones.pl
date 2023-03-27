%---------------------------------------
%            FUNCIONES 
%---------------------------------------
% Aqui se colocan funciones basicas en Prolog, por ejemplo definicion de sublistas 
% mostrar listas, declaracion de elementos y atomos

%--------------------------------------------
%           contiene
%--------------------------------------------
% Funcion que comprueba que un substring (B) se enecuente en el main string (A)

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

%--------------------------------------------
%           mostrar_lista/1
%--------------------------------------------
% Funcion imprimir la oracion sin corchetes ni comas
mostrar_lista([]):- nl.
mostrar_lista([H|T]):-
    write(H),
    write(' '),
    mostrar_lista(T).


%--------------------------------------------
%           mostrar_listacero/2
%-------------------------------------------- 
% Funcion imprimir lista sin ordenar
mostrar_listacero(0,_).
mostrar_listacero(N,L):-
  n_elemento(L, N, R),
  write('\t* '), mostrar_lista(R),
  M is N - 1,
  mostrar_listacero(M,L).

%--------------------------------------------
%           mostrar_seleccion/2
%-------------------------------------------- 
% Funcion imprimir el contenido que indica en el numero de indices
mostrar_seleccion(_,[]).
mostrar_seleccion(L,[N1|NX]):-
  n_elemento(L, N1, R),
  write('\t* '), mostrar_lista(R),
  mostrar_seleccion(L,NX).

%--------------------------------------------
%  intersecar(conjunto1, conjunto2, sub_conjunto)
%-------------------------------------------- 
% Funcion verifica que el sub_conjunto sea parte del conjunto1 y conjunto2
intersecar([], _, []).
intersecar([H|T1], L2, [H|T3]):-
        member(H, L2), !,
        intersecar(T1, L2, T3).
intersecar([_|T1], L2, L3):-
        intersecar(T1, L2, L3).

 
%--------------------------------------------
%        n_elemento(List, N, elemento)
%-------------------------------------------- 
% Funcion verifica que el enesimo elemento sea parte de la lista, por lo que retorna true
n_elemento([H|_], 1, H).
n_elemento([_|T], N, X):-
    n_elemento(T, N1, X),
    N is N1 + 1.

%--------------------------------------------
%        sub_lista(sub_lista, Lista)
%-------------------------------------------- 
% Funcion define una sub_lista
sub_lista(S, L) :-
    append(_, L2, L),
    append(S, _, L2).

%--------------------------------------------
%        sub_conjunto(sub_conjunto, Set)
%-------------------------------------------- 
% Funcion verifica que el sub_conjunto sea parte del conjunto, devuelve un true
sub_conjunto([], _).
sub_conjunto([H|T], L2):-
    member(H, L2),
    sub_conjunto(T, L2).
