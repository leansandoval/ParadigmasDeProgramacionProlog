% Ejercicio 05: Se dispone de un listado con los resultados de los parciales de los alumnos del curso de 
% Paradigmas de Programación, organizado de la siguiente manera:

% Versión 1: Se dispone de las notas de ambos parciales para todos los alumnos.

parcial1(luisa, 6).
parcial1(pedro, 5).
parcial1(maria, 8).
parcial1(carlos, 1).
parcial1(laura, 3).
parcial1(agos, 8.5).
parcial1(juan, 10).
parcial1(julio, 2).
parcial1(lucas, 9).
parcial1(hernan, 10).

parcial1(miguel, 8).

parcial2(luisa, 7).
parcial2(pedro, 6).
parcial2(maria, 9).
parcial2(carlos, 8).
parcial2(laura, 4).
parcial2(agos, 8.5).
parcial2(juan, 4).
parcial2(julio, 1).
parcial2(lucas, 9).
parcial2(hernan, 10).
parcial2(carlos, 3).

parcial2(julia, 9).

% Se desea obtener:

% El listado de los alumnos que promocionan la materia, indicando el nombre y la nota 
% final (promedio de los dos parciales), para cada uno.

notaFinalPorAlumno(Alumno, NotaFinal):-
    parcial1(Alumno, NotaParcial1),
    parcial2(Alumno, NotaParcial2),
    NotaFinal is (NotaParcial1 + NotaParcial2) / 2.

promocionados(Alumno, NotaFinal):-
    notaFinalPorAlumno(Alumno, NotaFinal),
    NotaFinal >= 7.

% El listado de los alumnos que obtendrán la cursada.

cursada(Alumno, NotaFinal):-
    notaFinalPorAlumno(Alumno, NotaFinal),
    (NotaFinal >= 4, NotaFinal < 7).

% El listado de los alumnos que recursan la materia.

recursan(Alumno, NotaFinal):-
    notaFinalPorAlumno(Alumno, NotaFinal),
    NotaFinal < 4.

% A fin de entregar la medalla al merito, encontrar de aquellos que promocionan, el o los alumnos 
% con mayor nota final.

% producto_cartesiano(A, B):-
%    notaFinalPorAlumno(_, A), 
%    notaFinalPorAlumno(_, B).

% seleccion(A, B):-
%    producto_cartesiano(A, B),
%    A < B.

% proyeccion(A):-
%    seleccion(A, _).

% alias

%todos_menos_max(A):-
%    proyeccion(A).

% Junta el producto cartesiano, seleccion y proyeccion al mismo tiempo

todos_menos_max_simplificado(A):-
    notaFinalPorAlumno(_, A),
    notaFinalPorAlumno(_, B),
    A < B.

maximo(X):-
    notaFinalPorAlumno(_, X), 
    \+ todos_menos_max_simplificado(X).


% Conjunto original notas
% nota = (2 4 9 7)

% Producto cartesiano (A X B)
% ( [2 2] [2 4] [2 9] [2 7] [4 2] [4 4] [4 9] [4 7] [9 2] [9 4] [9 9] [9 7] [7 2] [7 4] [7 9] [7 7] )

% Seleccion (A < B)
% 2 4
% 2 9
% 2 7
% 4 9
% 4 7
% 7 9

% Proyección (A)
% (2 2 2 4 4 7)


% Resta de conjuntos
% (2 4 9 7) - (2 2 2 4 4 7) = (9)

alumnosConMayorNota(Alumno, Nota):-
    notaFinalPorAlumno(Alumno, Nota),
	maximo(Nota).

alumnosSinLaMayorNota(Alumno, Nota):-
    notaFinalPorAlumno(Alumno, Nota),
    \+ alumnosConMayorNota(Alumno, Nota).

todosMenosLaMayorNota(A):-
    alumnosSinLaMayorNota(_, A), alumnosSinLaMayorNota(_, B),
    A < B.

maximos2(X):-
    notaFinalPorAlumno(_, X), 
    \+ todosMenosLaMayorNota(X).

alumnosConSegundaMayorNota(Alumno, Nota):-
    notaFinalPorAlumno(Alumno, Nota),
	(maximos2(Nota),
    \+ maximo(Nota)).

% Versión 2: El listado se compone de al menos una nota para cada alumno. 
% En caso de que algún alumno adeude uno de los parciales, su condición es ausente. 
% No se toman en cuenta quienes no dieron ninguno de los parciales.

alumnosConSoloParcial1(Alumno):-
    parcial1(Alumno,_),
    \+ parcial2(Alumno,_).

alumnosConSoloParcial2(Alumno):-
    parcial2(Alumno,_),
    \+ parcial1(Alumno,_).

alumnosAusentes(Alumno, NotaFinal):-
    (alumnosConSoloParcial1(Alumno); alumnosConSoloParcial2(Alumno)),
    NotaFinal is 0.