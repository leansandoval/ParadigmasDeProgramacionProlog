% Ejercicio 02: Completar el programa "menú" de manera que una comida esté formada también por la elección 
% de una bebida, a elegir entre vino, cerveza o agua mineral.

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

bebida(vino).
bebida(cerveza).
bebida(aguaMineral).

menuConBebida(Entrada, PlatoPrincipal, Postre, Bebida):-
    entrada(Entrada),
    (carne(PlatoPrincipal) ; pescado(PlatoPrincipal)),
    postre(Postre),
    bebida(Bebida).