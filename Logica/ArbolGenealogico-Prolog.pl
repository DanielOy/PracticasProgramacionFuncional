/*En base al libro de practicas de la Universidad de Alicante*/
/* ÁRBOL GENEALÓGICO                                      */
mensaje :- nl,write('Ejemplo "Árbol Genealógico" cargado.'),
           nl,nl.

/*----             PROGRAMA PRINCIPAL                 ----*/

/*------ Hechos ------*/

/* padres(H,P,M,A) <- H tiene como padre a P y como madre
                      a M, y nació el año A */
padres('Don Jose',p1,m1,1893).
padres('Doña Maria',p2,m2,1904).
padres('Jose','Don Jose','Doña Maria',1925).
padres('Maria','Don Jose','Doña Maria',1928).
padres('Antonia',p3,m3,1929).
padres('Maria Jose','Don Jose','Doña Maria',1931).
padres('Luis',p4,m4,1931).
padres('Jose Antonio','Jose','Antonia',1949).
padres('Pepe','Jose','Antonia',1953).
padres('Rosa',p5,m5,1955).
padres('Jose Luis','Luis','Maria Jose',1961).
padres('Maria Luisa','Luis','Maria Jose',1966).
padres('Pepito','Pepe','Rosa',1985).

/* casados(H,M) <- El hombre H está casado con la mujer M */
casados('Don Jose','Doña Maria').
casados('Jose','Antonia').
casados('Luis','Maria Jose').
casados('Pepe','Rosa').

/* hombre(P) <- la persona P es del género masculino */
hombre('Don Jose').
hombre('Jose').
hombre('Luis').
hombre('Jose Antonio').
hombre('Pepe').
hombre('Jose Luis').
hombre('Pepito').

/* mujer(P) <- la persona P es del género femenino */
mujer('Doña Maria').
mujer('Antonia').
mujer('Maria').
mujer('Maria Jose').
mujer('Rosa').
mujer('Maria Luisa').

/*------ Reglas ------*/

/* edad(P,E) <- la persona P tiene E años */
edad(P,E) :- padres(P,_,_,A),
             E is 1998-A.

/* mayor(P1,P2) <- la persona P1 es mayor que P2 */
mayor(P1,P2) :- padres(P1,_,_,A1),
                padres(P2,_,_,A2),
                A1<A2.

/* niño(P1) <- P1 es un niño (menos de 14 años) */
ninyo(P) :- edad(P,E),
            E=<14.

/* joven(P1) <- P1 es una persona joven (entre 14 y 25 años) */
joven(P) :- edad(P,E),
            14<E,E=<25.
 /* adulto(P1) <- P1 es un adulto (entre 25 y 50 años) */
adulto(P) :- edad(P,E),
             25<E,E=<50.

/* viejo(P1) <- P1 es una persona vieja (más de 50 años) */
viejo(P) :- edad(P,E),
            E>50.

/* hermanos(H1,H2) <- H1 es hermano/a de H2 */
hermanos(H1,H2) :- padres(H1,P,M,_),
                   padres(H2,P,M,_),
                   H1\=H2.

/* tio(T,S) <- T es el tio de S */
tio(T,S) :- hombre(T),
            padres(S,P,_,_),
            hermanos(T,P).
tio(T,S) :- hombre(T),
            padres(S,_,M,_),
            hermanos(T,M).
tio(T,S) :- hombre(T),
            padres(S,P,_,_),
            hermanos(T1,P),
            casados(T,T1).
tio(T,S) :- hombre(T),
            padres(S,_,M,_),
            hermanos(T1,M),
            casados(T,T1).

/* tia(T,S) <- T es la tia de S */
tia(T,S) :- mujer(T),
            padres(S,P,_,_),
            hermanos(T,P).
tia(T,S) :- mujer(T),
            padres(S,_,M,_),
            hermanos(T,M).
tia(T,S) :- mujer(T),
            padres(S,P,_,_),
            hermanos(T1,P),
            casados(T1,T).
tia(T,S) :- mujer(T),
            padres(S,_,M,_),
            hermanos(T1,M),
            casados(T1,T).

/* primos(P1,P2) <- P1 es primo/a de P2 */
primos(P1,P2) :- padres(P1,PA1,MA1,_),
                 padres(P2,PA2,MA2,_),
                 (hermanos(PA1,PA2);
                  hermanos(PA1,MA2);
                  hermanos(MA1,PA2);
                  hermanos(MA1,MA2)).

/* abuelo(A,N) <- A es el abuelo de N */
abuelo(A,N) :- padres(N,P,M,_),
               (padres(P,A,_,_);
                padres(M,A,_,_)).

/* abuela(A,N) <- A es la abuela de N */
abuela(A,N) :- padres(N,P,M,_),
               (padres(P,_,A,_);
                padres(M,_,A,_)).

/* antepasado(A,P) <- A es antepasado de P */
antepasado(A,P) :- padres(P,A,_,_).
antepasado(A,P) :- padres(P,_,A,_).
antepasado(A,P) :- padres(P,PA,_,_),
                   antepasado(A,PA).
antepasado(A,P) :- padres(P,_,MA,_),
                   antepasado(A,MA).

:- mensaje.
