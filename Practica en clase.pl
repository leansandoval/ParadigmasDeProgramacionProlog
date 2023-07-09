% ======= Hechos =======

% Predicados de animal

animal(perro).	% perro -> atom (Parecido a un string, no puede llevar espacios, empieza en minuscula)
animal(gato).
animal(elefante).

% Cualquier nombre que empieza con mayusculas (o todo mayuscylas), es una variable lo que hace es que un hecho de verdadero. 
% Por lo tanto, busca un valor posible para almacenar.
% animal(Animales)
% animal(X)

% Ademas del atom, vamos a trabajar con estos tipos de datos:
% 1 --> Numeros
% 3/5 --> Double

% Ejercicios de paises

% El punto es el fin de linea, si no lo pongo lo interpreta como si siguieta en una misma.
limita(argentina, brasil). 
limita(argentina, bolivia).
limita(argentina, chile).
limita(argentina, paraguay).
limita(argentina, uruguay).
limita(bolivia, peru).
limita(bolivia, brasil).
limita(bolivia, paraguay).
limita(brasil, colombia).
limita(brasil, guyana).
limita(brasil, peru).
limita(brasil, uruguay).
limita(brasil, venezuela).
limita(chile, peru).
limita(paraguay, brasil).

% Reglas

limitaCon(Pais1, Pais2):-
    limita(Pais1, Pais2);
    limita(Pais2, Pais1).

translimitaCon(Pais1, Pais2):-
    limitaCon(Pais1, PaisIntermedio),
    limitaCon(PaisIntermedio, Pais2),
    \+ limitaCon(Pais1, Pais2),         % Le resto el par de paises que limitan entre si ya que no es valido
    Pais1 \== Pais2.                    % Verdadero en el caso de que Pais1 sea distinto de Pais2
% El orden de los predicados es importante: no puedo hacer la resta sin antes realizar la interseccion.

% Si se usa desde consola usar
% translimitaCon(X, Y) write (X - Y), nl, fail.

% Ejercicio de DBZ

% Hechos

% parent(Parent, Child)

parent(bardock, radditz).
parent(bardock, goku).
parent(goku, gohan).
parent(goku, goten).
parent(chichi, gohan).
parent(chichi, goten).
parent(mrsatan, videl).
parent(gohan, pan).
parent(videl, pan).
parent(vegeta, trunks).
parent(bulma, trunks).
parent(vegeta, bra).
parent(bulma, bra).

rival(piccolo, goku).
rival(goku, piccolo).
rival(vegeta, goku).
rival(goku, vegeta).

male(bardock).
male(radditz).
male(goku).
male(gohan).
male(goten).
male(vegeta).
male(trunks).
male(piccolo).
male(mrsatan).

female(chichi).
female(bulma).
female(videl).
female(pan).
female(bra).

% Reglas 

father(Father, Child):-
    parent(Father, Child),
    male(Father).

mother(Mother, Child):-
    parent(Mother, Child),
    female(Mother).

mother2(Mother, Child):-
    parent(Mother, Child),
    \+ father(Mother, Child).

grandParent(GrandParent, Child):-
    parent(GrandParent, Parent),
    parent(Parent, Child).

sibling(Sibling, Child):-
    parent(Parent, Sibling),
    parent(Parent, Child).
    Sibling \== Child.

uncle(Uncle, Nephew):-
    sibling(Father, Uncle),
    parent(Father, Nephew),
    male(Uncle).

parent(Parent):-
    parent(Parent, _).  % El _ reconoce que hay una variable pero que no esta realacionada con nada