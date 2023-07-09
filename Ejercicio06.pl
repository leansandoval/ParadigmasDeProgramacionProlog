% Ejercicio 06: Una agencia matrimonial de los años '80 tiene un fichero de candidatos al matrimonio 
% organizado según las declaraciones siguientes:

hombre(juan, baja, castaño, joven).
hombre(pedro, baja, pelirrojo, adulta).
hombre(carlos, media, rubio, adulta).
hombre(miguel, alta, castaño, adulta).
hombre(luis, baja, rubio, joven).
hombre(raul, media, pelirrojo, adulta).
hombre(fernando, alta, castaño, joven).

mujer(maria, baja, rubio, adulta).
mujer(laura, alta, castaño, joven).
mujer(ana, alta, castaño, joven).
mujer(susana, media, pelirrojo, adulta).
mujer(rosa, baja, rubio, adulta).
mujer(isabel, alta, castaño, adulta).
mujer(teresa, media, rubio, joven).

% Donde N es el nombre de un hombre o una mujer, A su altura (alta, media, baja), C el color de su 
% cabello (rubio, castaño, pelirrojo, negro) y E su edad (joven,adulta,vieja).

gusta(juan, pop, aventura, tenis).
gusta(pedro, pop, aventura, tenis).
gusta(carlos, pop, aventura, tenis).
gusta(miguel, pop, aventura, tenis).
gusta(luis, clasica, aventura, tenis).
gusta(raul, pop, cienciaFiccion, natacion).
gusta(fernando, pop, aventura, tenis).

gusta(maria, pop, aventura, tenis).
gusta(laura, clasica, cienciaFiccion, natacion).
gusta(ana, clasica, cienciaFiccion, jogging).
gusta(susana, clasica, aventura, jogging).
gusta(rosa, pop, aventura, natacion).
gusta(isabel, clasica, cienciaFiccion, jogging).
gusta(teresa, pop, aventura, tenis).

% Que indica que a la persona N le gusta el género de música M (clásica, pop, jazz), el género de 
% literatura L (aventura, ciencia-ficción, policíaca), y practica el deporte S (tenis, natación, jogging).

busca(juan, baja, rubio, adulta).
busca(pedro, alta, castaño, joven).
busca(carlos, baja, rubio, joven).
busca(miguel, alta, rubio, adulta).
busca(luis, media, castaño, joven).
busca(raul, baja, pelirrojo, adulta).
busca(fernando, media, rubio, joven).

busca(maria, alta, castaño, joven).
busca(laura, baja, pelirrojo, adulta).
busca(ana, alta, castaño, adulta).
busca(susana, alta, pelirrojo, adulta).
busca(rosa, baja, castaño, adulta).
busca(isabel, alta, rubio, joven).
busca(teresa, alta, castaño, joven).

% Que expresa que la persona N busca una pareja de altura A, con cabello color C y edad E.

% Se considera que dos personas X e Y de sexos diferentes son adecuadas si X conviene a Y e Y conviene a X. 
% Se dice que X conviene a Y si X conviene físicamente a Y (la altura, edad y color de cabello de 
% y son los que busca X) y si, además, los gustos de X e Y en música, literatura y deporte coinciden.

adecuado(X, Y):-
	hombre(X, _, _, _), 
    mujer(Y, Altura, Cabello, Edad),
    busca(X, Altura, Cabello, Edad),
    gusta(X, Musica, Literatura, Deporte),
    gusta(Y, Musica, Literatura, Deporte).

adecuado(X, Y):-
  mujer(X, Altura, Cabello, Edad),
  hombre(Y, _, _, _),
  busca(X, Altura, Cabello, Edad),
  gusta(X, Musica, Literatura, Deporte),
  gusta(Y, Musica, Literatura, Deporte).