
matoA(Persona,Victima) :-
    odiaA(Persona,Victima),
    not(esMasRicoQue(Persona,Victima)).

viveEnLaMansion(tiaAgatha).
viveEnLaMansion(mayordomo).
viveEnLaMansion(charles).

odiaA(charles, Persona) :-
    viveEnLaMansion(Persona),
    not(odiaA(tiaAgatha, Persona)).

odiaA(tiaAgatha, charles).

odiaA(mayordomo, Persona) :-
    viveEnLaMansion(Persona),
    odiaA(tiaAgatha, Persona).

esMasRicoQue(Persona, tiaAgatha) :-
    viveEnLaMansion(Persona),
    not(odiaA(mayordomo,Persona)),
    Persona \= tiaAgatha.

/* PUNTO 1
?- matoA(Alguien, tiaAgatha).
Alguien = charles ;
false.
*/

/* PUNTO 2

- Si existe alguien que odie a milhouse.
?- odiaA(_, milhouse).
false.

- A quién odia charles.
?- odiaA(charles, Odiado).
Odiado = tiaAgatha ;
Odiado = mayordomo ;
false.

- El nombre de quien odia a tía Ágatha.
?- odiaA(Odiador, tiaAgatha).
Odiador = charles ;
false.

- Todos los odiadores y sus odiados.
odiaA(Odiador, Odiado).
Odiador = charles,
Odiado = tiaAgatha ;
Odiador = charles,
Odiado = mayordomo ;
Odiador = tiaAgatha,
Odiado = charles ;
Odiador = mayordomo,
Odiado = charles.

- Si es cierto que el mayordomo odia a alguien.
?- odiaA(mayordomo, _).
true.

*/
