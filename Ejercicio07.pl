% Ejercicio 07: Con el programa 'menú', dado en clase, describir la semántica de las siguientes tres consultas 
% Prolog y decir cuál es el resultado de la ejecución:

% menu(E,PP,P), !.                  
% Devuelve paella, fileteDeCerdo, flan

% menu(E,PP,P), pescado(PP), !.     
% Devuelve paella, trucha, flan. En otras palabras, el primero que tenga pescado

% menu(E,PP,P), !, pescado(PP).     
% No devuelve nada, antes de la operacion de corte devolveria como el primer ejemplo, pero 
% luego fileteDeCero no es un pescado, asi que la ejecucion va a dar falso
% Si era de carne, si hubiera funcionado

% Analizar el comportamiento del operador ! (operador de corte o " cut").

% Operador de corte !
% No es un operador unario, es un operador que no tiene ningun termino
% Corta con la ejecucion cuando termina de devolver el primer resultado

% Con el caso de recursividad

multiplicar(_, 0, 0):-!.
multiplicar(A, 1, A):-!.
multiplicar(X, N, Resultado):-
    % N > 1                     % Esta linea se puede borrar con el operador de corte, ya que la regla de arriba corta con el hecho
    N1 is N - 1,
    multiplicar(X, N1, Acumulado),
    Resultado is X + Acumulado.

% Hay que tener en cuenta que el orden es importante, los operadores de corte deben estar primero