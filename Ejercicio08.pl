% Ejercicio 08: Modificar el programa del Ejercicio 01 (menú) para poder consultar cual es 
% el menú completo que tiene menor cantidad de calorías (agregando las calorias como parte 
% de la información de los hechos)

% Entradas
entrada(paella, 500).
entrada(gazpacho, 200).
entrada(consomé, 150).

% Platos principales (carne)
carne(filete_de_cerdo, 800).
carne(pollo_asado, 600).

% Platos principales (pescado)
pescado(trucha, 400).
pescado(bacalao, 500).

% Postres
postre(flan, 300).
postre(helado, 250).
postre(pastel, 400).

% Menú completo
menu(Entrada, PlatoPrincipal, Postre, CaloriasTotal) :-
    entrada(Entrada, CaloriasEntrada),
    (carne(PlatoPrincipal, CaloriasPlatoPrincipal); 
    pescado(PlatoPrincipal, CaloriasPlatoPrincipal)),
    postre(Postre, CaloriasPostre),
    CaloriasTotal is CaloriasEntrada + CaloriasPlatoPrincipal + CaloriasPostre.

todosLosMenusMenosElDeMenorCalorias(CaloriasTotal2):-
    menu(_,_,_,CaloriasTotal1), 
    menu(_,_,_,CaloriasTotal2),
    CaloriasTotal1 < CaloriasTotal2.

menuConMenorCantidadDeCalorias(Entrada, PlatoPrincipal, Postre, Calorias):-
    menu(Entrada, PlatoPrincipal, Postre, Calorias),
    \+ todosLosMenusMenosElDeMenorCalorias(Calorias).