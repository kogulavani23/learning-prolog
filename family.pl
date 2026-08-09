% --- FACTS ---

% Parent relationships
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Females
female(pam).
female(liz).
female(ann).
female(pat).

% Males
male(tom).
male(bob).
male(jim).


% --- RULES ---

% Mother & Father
mother(X, Y) :- 
    parent(X, Y), 
    female(X).

father(X, Y) :- 
    parent(X, Y), 
    male(X).

% Grandparent
grandparent(X, Z) :- 
    parent(X, Y), 
    parent(Y, Z).

% Sister & Brother
sister(X, Y) :- 
    parent(Z, X), 
    parent(Z, Y), 
    female(X), 
    X \= Y.

brother(X, Y) :- 
    parent(Z, X), 
    parent(Z, Y), 
    male(X), 
    X \= Y.

% Ancestor
ancestor(X, Z) :- 
    parent(X, Z).

ancestor(X, Z) :- 
    parent(X, Y), 
    ancestor(Y, Z).