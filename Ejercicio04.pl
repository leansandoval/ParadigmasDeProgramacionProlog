% Ejercicio 04
% Una agencia de viajes propone a sus clientes viajes de una o varias semanas a Roma, Londres o Túnez. 
% El catálogo de la agencia contiene, para cada destino, el precio del transporte (con independencia 
% de la duración) y el precio de una semana de estancia que varía según el destino y el nivel de 
% comodidad elegidos: hotel, hostal o camping.

% Escribir el conjunto de declaraciones que describen este catálogo (se muestra a continuación).

transporte(roma,20).
transporte(londres,30).
transporte(tunez,10).

alojamiento(roma,hotel,50).
alojamiento(roma,hostal,30).
alojamiento(roma,camping,10).
alojamiento(londres,hotel,60).
alojamiento(londres,hostal,40).
alojamiento(londres,camping,20).
alojamiento(tunez,hotel,40).
alojamiento(tunez,hostal,20).
alojamiento(tunez,camping,5).

% Expresar la relación viaje(C,S,H,P) que se interpreta por: "el viaje a la ciudad C durante S semanas 
% con estancia en H cuesta P pesos"

% Tengo que definir la cantidad de semanas

viaje(Ciudad, Semanas, Estancia, Pesos) :-
    transporte(Ciudad, PrecioTransporte),
    alojamiento(Ciudad, Estancia, PrecioAlojamientoPorSemana),
    Pesos is PrecioTransporte + (Semanas * PrecioAlojamientoPorSemana).

% Completar con viajeeconomico(C,S,H,P,Pmax) que expresa que el costo P es menor que Pmax pesos.

viajeEconomico(C,S,H,P,Pmax):-
	viaje(C, S, H, P),
    P < Pmax.