/*Evalua si un regalo seria el correcto para un animal*/
/*Probado con el compilador SWI-Prolog 64 bits, version 8.1.1-20-g576555c*/
/* animal(Anim) <- Anim es un animal */
animal(mono).
animal(gallina).
animal(ara�a).
animal(mosca).
animal(cocodrilo).

/* gusta(X,Y) <- a X le gusta Y */
gusta(mono,banana).
gusta(ara�a,mosca).
gusta(alumno,logica).
gusta(ara�a,hormiga).
gusta(cocodrilo,X) :- animal(X).
gusta(mosca,espejo).

/* regalo(X,Y) <- Y es un buen regalo para X */
regalo(X,Y) :- animal(X), gusta(X,Y).
