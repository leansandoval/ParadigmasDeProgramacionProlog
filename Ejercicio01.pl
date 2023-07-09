% Ejercicio 01: Las siguientes clausulas corresponden al programa "menú" de un restaurante. 
% El restaurante ofrece menús completos compuestos por una entrada, un plato principal y un postre. 
% El plato principal puede ser carne o pescado.

entrada(paella).
entrada(gazpacho).
entrada(consomé).

carne(fileteDeCerdo).
carne(polloAsado).

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).

% Implementar las reglas necesarias para formular las siguientes consultas en Prolog:

% ¿Cuáles son los menús que ofrece el restaurante?

menu(Entrada, PlatoPrincipal, Postre) :-
    entrada(Entrada),
    (carne(PlatoPrincipal) ; pescado(PlatoPrincipal)),
    postre(Postre).

% ¿Cuáles son los menús que tienen Consomé en las entradas?

menuConsome(Entrada, PlatoPrincipal, Postre) :-
	menu(Entrada, PlatoPrincipal, Postre),
	Entrada == consomé.

% ¿Cuáles son los menús que no contienen flan como postre?

menuSinFlan(Entrada, PlatoPrincipal, Postre) :-
	menu(Entrada, PlatoPrincipal, Postre),
	Postre \== flan.