% FACTS

connected(p,q,2).
connected(p,v,4).
connected(q,s,3).
connected(q,t,1).
connected(t,u,2).
connected(t,v,5).
connected(s,w,2).
connected(t,w,4).
connected(u,x,3).
connected(v,x,1).
connected(w,z,2).
connected(x,z,4).


% BFS

bfs(Start, Goal, Path) :-
    search([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

search([[Goal|Path]|_], Goal, [Goal|Path]).

search([[Node|Path]|Paths], Goal, Solution) :-
    findall(
        [Next,Node|Path],
        (connected(Node,Next,_),
         \+ member(Next,[Node|Path])),
        NewPaths
    ),
    append(Paths, NewPaths, UpdatedPaths),
    search(UpdatedPaths, Goal, Solution).