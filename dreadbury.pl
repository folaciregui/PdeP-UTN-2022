
mataA(Persona,Victima) :-
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