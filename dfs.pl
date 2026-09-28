% Program to represent a connected graph and perform DFS

connected(p,q).
connected(p,v).
connected(q,s).
connected(q,t).
connected(t,u).
connected(t,v).
connected(s,w).
connected(s,r).
connected(r,w).
connected(r,x).
connected(x,r).
connected(x,z).

% DFS predicate

dfs(Start, Goal, Path) :-
    search(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

% If goal is reached, return the path

search(Goal, Goal, Path, Path).

% Continue the search

search(Node, Goal, Visited, Path) :-
    connected(Node, Next),
    \+ member(Next, Visited),
    search(Next, Goal, [Next|Visited], Path).