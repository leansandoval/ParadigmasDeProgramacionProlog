% Ejercicio 11: Recursividad

% a - Codifique en prolog las reglas necesarias para obtener el término N en la serie de Gauss

% Sin recursividad

serieDeGauss(Numero, Resultado) :-
    Resultado is (Numero * (Numero + 1)) // 2.

% El operador // representa una división entera

% Con recursividad

serieDeGaussRecursiva(0, 0):-!.  % Caso base: el término 0 es igual a 0
serieDeGaussRecursiva(Numero, Resultado) :-
    NumeroAnterior is Numero - 1,
    serieDeGaussRecursiva(NumeroAnterior, ResultadoAnterior),
    Resultado is ResultadoAnterior + Numero.

% b - Codifique en prolog las reglas necesarias para obtener el término N en la serie de Fibonacci (sin, y con mejora)

fibonacci(0, 0):-!.
fibonacci(1, 1):-!.
fibonacci(Numero, Resultado):-
  Numero1 is Numero - 1,
  Numero2 is Numero - 2,
  fibonacci(Numero1, Resultado1),
  fibonacci(Numero2, Resultado2),
  Resultado is Resultado1 + Resultado2.

% Version mejorada

fibonacciMejorado(0, 0, 0):-!.
fibonacciMejorado(1, 1, 0):-!.
fibonacciMejorado(Numero, Resultado, ResultadoAnterior):-
  NumeroAnterior is Numero - 1,
  fibonacciMejorado(NumeroAnterior, ResultadoAnterior, ResultandoAnteriorAlAnterior),
  Resultado is ResultadoAnterior + ResultandoAnteriorAlAnterior.

fibonacciMejorado(Numero, Resultado):-
    fibonacciMejorado(Numero, Resultado, _).

% c - Codifique en prolog las reglas necesarias para obtener el factorial de un número natural N.

factorial(0, 1):-!.
factorial(N, Resultado):-
  N1 is N - 1,
  factorial(N1, Acumulado),
  Resultado is N * Acumulado.

% d - Codifique en prolog las reglas necesarias para obtener el producto de dos numeros X e Y, aplicando sumas sucesivas.

multiplicar(_, 0, 0):-!.
multiplicar(X, 1, X):-!.
multiplicar(1, X, X):-!.
multiplicar(PrimerFactor, SegundoFactor, Resultado):-
    NumeroAnteriorSegundoFactor is SegundoFactor - 1,
    multiplicar(PrimerFactor, NumeroAnteriorSegundoFactor, Acumulado),
    Resultado is PrimerFactor + Acumulado.

% e - Codifique en prolog las reglas necesarias para obtener la potencia N de un numero X aplicando multiplicaciones sucesivas.

potencia(_, 0, 1):-!.
potencia(X, 1, X):-!.
potencia(Numero, Exponente, Resultado):-
    ExponenteAnterior is Exponente - 1,
    potencia(Numero, ExponenteAnterior, Acumulado),
    multiplicar(Numero, Acumulado, Resultado).

% f - Codifique en prolog las reglas necesarias para obtener la el cociente entre dos números a partir de restas sucesivas.

cociente(X, 1, X):-!.
cociente(X, X, 1):-!.

cociente(Dividendo, Divisor, 0) :-
  Divisor \== 0,
  Dividendo < Divisor.

cociente(Dividendo, Divisor, Resultado):-
    Divisor \== 0,
    Dividendo >= Divisor,
    Resto is Dividendo - Divisor,
    cociente(Resto, Divisor, CocienteResto),
    Resultado is CocienteResto + 1,
    !.

% g - Idem f, pero que permita obtener el cociente y el resto.

division(0, _, 0 , 0):-!.
division(X, 1, X, 0):-!.
division(X, X, 1, 0):-!.

division(Dividendo, Divisor, Cociente, Resto):-
    Divisor \== 0,
	Dividendo < Divisor,
	Cociente is 0,
    Resto is Dividendo,
    !.
    
division(Dividendo, Divisor, Cociente, Resto):-
    Divisor \== 0,
    Dividendo >= Divisor,
    Diferencia is Dividendo - Divisor,
    division(Diferencia, Divisor, ResultadoAnterior, Resto),
    Cociente is ResultadoAnterior + 1,
    !.

% h - Definir la relación mcd(X,Y,Z) que se verifique si Z es el maximo común divisor entre X e Y. 

% Por ejemplo:
% mcd(10,15,X).
% > X = 5

mcd(X, 0, Z):-
    Z is X, !.

mcd(X, Y, Z):- 
    Y \== 0,
    R is X mod Y,
    mcd(Y, R, Z).

% i - Define un predicado mcm(X,Y,M) que signifique "M es el mínimo común múltiplo de X e Y"

mcm(X, Y, M):-
    mcd(X, Y, M1),
    M is (X * Y) / M1.