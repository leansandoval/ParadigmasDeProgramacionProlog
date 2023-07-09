% Ejercicio 10: Dado el listado de vendedores y ventas semestrales se desea obtener el 
% listado anual de comisiones. Las comisiones se liquidan de la siguiente manera:

% 20% del total vendido en el año para aquellos vendedores que hayan tenido ventas en ambos 
% semestres y cada una de ellas supera los $ 20000.

% 10% del total vendido en el año para aquellos vendedores que hayan tenido ventas en ambos 
% semestres, pero no superan los $ 20000 en alguno de estos.

% 5% del total vendido para los vendedores que no registran ventas en algún semestre

% Se dispone de los siguientes datos:

% Reglas de ejemplo para las ventas en el primer semestre
ventas1erSem(vendedor1, 25000).		% 20%
ventas1erSem(vendedor2, 15000).		% 5%
ventas1erSem(vendedor3, 30000).		% 10%

% Reglas de ejemplo para las ventas en el segundo semestre
ventas2doSem(vendedor1, 22000).		% 20%
ventas2doSem(vendedor3, 18000).		% 10%
ventas2doSem(vendedor4, 5000).		% 5%

% Nota: No todos los vendedores venden en ambos semestres, todos los importes son mayores 
% que cero. En caso de no registrarse ventas en algún semestre, no figura la regla 
% correspondiente para ese vendedor.

ambasVentasMayoresA20000(Vendedor, VentaAnual, Comision):-
    ventas1erSem(Vendedor, VentaPrimerSemestre),
    ventas2doSem(Vendedor, VentaSegundoSemestre),
    (VentaPrimerSemestre > 20000 , VentaSegundoSemestre > 20000),
    VentaAnual is VentaPrimerSemestre + VentaSegundoSemestre,
    Comision is VentaAnual * 0.2.

algunaVentaMenorA20000(Vendedor, VentaAnual, Comision):-
    ventas1erSem(Vendedor, VentaPrimerSemestre),
    ventas2doSem(Vendedor, VentaSegundoSemestre),
    (VentaPrimerSemestre < 20000 ; VentaSegundoSemestre < 20000),
    VentaAnual is VentaPrimerSemestre + VentaSegundoSemestre,
    Comision is VentaAnual * 0.1.

vendedoresSoloPrimerSemestre(Vendedor):-
	ventas1erSem(Vendedor, _),
    \+ ventas2doSem(Vendedor, _).

ventaSoloEnElPrimerSemestre(Vendedor, VentaAnual, Comision):-
    vendedoresSoloPrimerSemestre(Vendedor),
    ventas1erSem(Vendedor, Venta),
    VentaAnual is Venta,
    Comision is VentaAnual * 0.05.

vendedoresSoloSegundoSemestre(Vendedor):-
	ventas2doSem(Vendedor, _),
    \+ ventas1erSem(Vendedor, _).

ventaSoloEnElSegundoSemestre(Vendedor, VentaAnual, Comision):-
    vendedoresSoloSegundoSemestre(Vendedor),
    ventas2doSem(Vendedor, Venta),
    VentaAnual is Venta,
    Comision is VentaAnual * 0.05.

listadoAnualDeComisiones(Vendedor, VentaAnual, Comision):-
    ambasVentasMayoresA20000(Vendedor, VentaAnual, Comision);
    algunaVentaMenorA20000(Vendedor, VentaAnual, Comision);
    ventaSoloEnElPrimerSemestre(Vendedor, VentaAnual, Comision);
    ventaSoloEnElSegundoSemestre(Vendedor, VentaAnual, Comision).