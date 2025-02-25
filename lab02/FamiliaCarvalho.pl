pais(pietrop, joão).
pais(pietrop, clara).
pais(pietrop, francisco).
pais(pietrop, valéria).
pais(pietrop, ana).
pais(antonila, joão).
pais(antonila, clara).
pais(antonila, francisco).
pais(antonila, valéria).
pais(antonila, ana).
pais(ana, helena).
pais(ana, joana).
pais(joão, mário).
pais(helena, carlos).
pais(mário, carlos).
pais(clara, pietro).
pais(clara, enzo).
pais(jacinto, antonia).
pais(jacinto, francisca).
pais(claudia, antonia).
pais(claudia, francisca).
pais(luzia, jacinto).
pais(pablo, jacinto).

sexo(pietrop, m).
sexo(joão, m).
sexo(francisco, m).
sexo(mário, m).
sexo(carlos, m).
sexo(pietro,m).
sexo(enzo, m).
sexo(jacinto, m).
sexo(pablo, m).
sexo(antonila, f).
sexo(clara, f).
sexo(valéria, f).
sexo(ana, f).
sexo(helena, f).
sexo(joana, f).
sexo(fabiana, f).
sexo(francisca, f).
sexo(antonia, f).
sexo(cláudia, f).
sexo(luzia, f).

avô(X,Y):- pais(X,A),
    pais(A,Y),
    sexo(X,m).

avó(X,Y):- pais(X,A),
    pais(A,Y),
    sexo(X,f).

mae(X,Y):- pais(X,Y),
    sexo(X,f).

pai(X,Y):- pais(X,Y),
    sexo(X,m).

irmao(Y,Z):- pais(X,Y),
    pais(X,Z), 
    Z\==Y,
    sexo(X,m).

irma(Y,Z):- pais(X,Y), 
    pais(X,Z),
    Y\==Z,
    sexo(X,f).

tio(X, Y) :- irmao(X, Z), 
    pais(Z, Y),
    sexo(X, m).

tia(X,Y):- irma(X,Z),
    pais(Z,Y),
    sexo(X,f).

primo(X,Y) :- pais(Z,X),
    pais(A,Y),
    irmao(Z,A),
    sexo(X,m).

prima(X,Y) :- pais(Z,X),
    pais(A,Y),
    irmao(Z,A),
    sexo(X,f).

descendente(X,Y) :- pais(Y,X),
    tio(Y,X),
	tia(Y,X),
    avô(Y,X),
    avó(Y,X).

ascendente(X, Y) :- pais(X, Y).

ascendente(X, Y) :- pais(X, Z), 
    ascendente(Z, Y).

descendente(X, Y) :- pais(Y, X).

descendente(X, Y) :- pais(Y, Z), 
    descendente(X, Z).
