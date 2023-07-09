% Ejercicio 09: Basado en el ejemplo de paises.pl visto en clase, complete la base de 
% conocimientos pais_superficie(P,A) con todos los países de latinoamérica y codifique 
% las reglas prolog que permitan encontrar el país de mayor superficie.

paisSuperficie(argentina, 2780400).
paisSuperficie(brasil, 8515767).
paisSuperficie(chile, 756102).
paisSuperficie(colombia, 1141748).
paisSuperficie(ecuador, 256370).
paisSuperficie(venezuela, 916445).

todosMenosLaMayorSuperficie(Superficie1):-
    paisSuperficie(_, Superficie1),
    paisSuperficie(_, Superficie2),
    Superficie1 < Superficie2.

paisConMayorSuperficie(Pais, Superficie):-
    paisSuperficie(Pais, Superficie),
    \+ todosMenosLaMayorSuperficie(Superficie).