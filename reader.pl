

%---------------------------
%       READER (Lector)
%----------------------------

% La funcion que tiene el reader es devolver una lista que contiene de
% elementos las palabras de la oracion ingresada por el usuario

% read_in(P) cuando un usuario ingrese una oracion, obtendra cada una de
% las palabras de dicha oracion y las colocara en la lista P. Es
% necesario que la oracion finalice en algunos de los siguientes
% simbolos (. o ?)
% initread(L) va a leer cada caracter que entra y lo sustituye segun
% el codigo ASCCI
% (get_code) devuelve el caracter ya convertido con el valor ascii


read_in(P):-initread(L),words(P,L,[]).
initread([K1,K2|U]):-get_code(K1),get_code(K2),readrest(K2,U).


% Lee de manera recursiva el R (resto) de la oracionFunción recursiva
readrest(10,[]):-!.  %Ese numero es el referente al simbolo "\n" que seria un salto de linea
readrest(46,[]):-!.  % Ese numero es el referente al simbolo "."
readrest(63,[]):-!.  % Ese numero es el referente al simbolo "?"


% Es importante limitar en el programa cualquier caracter que indefina la
% oracion, por lo tanto si el numero de K es menor o igual a 32
% (numero en el ascii que corresponde al espacio) entonces se hara un
% cut

readrest(K,[K1|U]):- K=<32,!,get_code(K1),readrest(K1,U).
readrest(_K1,[K2|U]):-get_code(K2),readrest(K2,U).

%--------------------
%      WORDS
%--------------------
% Words transforma caracteres a simbolos
% Es de la siguiente forma words( P, L, []) esto quiere decir que recibe
% 3 parametros, L lista de caracteres, P lista de simbolos y [] una
% lista vacia.Uso de DGC

words([V|U]) --> word(V),!,blanks,words(U).
words([]) --> [].

%----------------
%    NAME
%---------------
% name(X,Y). X representa un caracter o una secuencia de caracteres, y Y
% tiene la lista con los codigos ascii de los caracteres incluidos en X

word(U1) --> [K],{lc(K,K1)},!,alphanums(U2),{name(U1,[K1|U2])}.
word(nb(N)) --> [K],{digit(K)},!,digits(U),{name(N,[K|U])}.
word(V) --> [K],{name(V,[K])}.

alphanums([K1|U]) --> [K],{alphanum(K,K1)},!,alphanums(U).
alphanums([]) --> [].

% Verifica que el codigo es compuesto por letras,numeros y otros
% caracteres (alfanumerico)
alphanum(95,95) :- !.
alphanum(K,K1):-lc(K,K1).
alphanum(K,K):-digit(K).

digits([K|U]) --> [K],{digit(K)},!,digits(U).
digits([]) --> [].

blanks--> [K],{K=<32},!,blanks.
blanks --> [].

% Esto sirve para darse cuenta si el caracter es un numero
% en ascii la numeracion inicia en 0 (48) y finaliza en 9 (57)
% por eso se define el siguiente rango:
digit(K):-K>47,K<58.


% Esto permite cambiar los caracteres que ingresan en mayuscula a
% minuscula. En codigo ascii 65-90
lc(K,K1):-K>64,K<91,!,K1 is K+32.

% Esto permite que callcenterlog detecte la "ñ" el valor en ascii es 241
lc(K,K1):-K=209,!,K1 is 241.

% Si el programa detecta que lo ingresado ya se encuentra en minuscula
% no debe hacer la conversion, solamente devolver el valor en ascii.
lc(K,K):-K>96,K<123; K=241.

% El predicado en una oracion indica la accion que realiza el sujeto o lo
% que se dice de el, el predicado readin(S) va a recibir el texto y
% retornar una lista con palabras y caracteres especiales
readin(S):- read_in(S).
