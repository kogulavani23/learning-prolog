:- dynamic found_item/5.

% =========================================================
% KNOWLEDGE BASE (Sample Pre-Loaded Found Items)
% Format: found_item(ID, Category, Color, Location, ClaimSpot)
% =========================================================
found_item(f101, laptop, silver, library, 'Library Main Security Desk - Room 101').
found_item(f102, phone, black, student_center, 'Student Union Desk').
found_item(f103, wallet, brown, gym, 'Sports Complex Reception').

% Adjacent Campus Locations
adjacent(cafeteria, student_center).
adjacent(student_center, cafeteria).
adjacent(library, student_center).
adjacent(student_center, library).

% =========================================================
% MENU SYSTEM
% =========================================================
start :-
    nl, write('==========================================='), nl,
    write('   CAMPUS LOST & FOUND MATCHER SYSTEM     '), nl,
    write('==========================================='), nl,
    write('1. Search My Lost Item (Find & Claim)'), nl,
    write('2. Report a Found Item (Add to Database)'), nl,
    write('3. Exit'), nl,
    write('Enter choice (1-3 followed by dot .): '), read(Choice),
    handle(Choice).

% ---------------------------------------------------------
% OPTION 1: SEARCH FOR LOST ITEM
% ---------------------------------------------------------
handle(1) :-
    nl, write('--- SEARCH FOR YOUR LOST ITEM ---'), nl,
    write('Enter Category (e.g. laptop. or phone.): '), read(Cat),
    write('Enter Color (e.g. silver. or black.): '), read(Col),
    write('Where did you lose it? (e.g. cafeteria. or library.): '), read(LostLoc),
    nl, write('Searching database...'), nl,
    find_matches(Cat, Col, LostLoc),
    start.

% ---------------------------------------------------------
% OPTION 2: REPORT A FOUND ITEM
% ---------------------------------------------------------
handle(2) :-
    nl, write('--- REPORT A FOUND ITEM ---'), nl,
    write('Enter ID (e.g. f104.): '), read(ID),
    write('Enter Category (e.g. watch.): '), read(Cat),
    write('Enter Color (e.g. gold.): '), read(Col),
    write('Found Location (e.g. library.): '), read(Loc),
    write('Claim Spot / Contact Details: '), read(Claim),
    assertz(found_item(ID, Cat, Col, Loc, Claim)),
    nl, write('--> SUCCESS: Found item added to Database!'), nl,
    start.

handle(3) :- write('Thank you! Goodbye.'), nl.
handle(_) :- write('Invalid Choice! Try again.'), nl, start.

% =========================================================
% MATCHING ENGINE LOGIC (WITH STATUS MESSAGES)
% =========================================================

find_matches(Cat, Col, LostLoc) :-
    % Collect all matching items into a list
    findall(
        (Type, FID, FoundLoc, Claim),
        (
            found_item(FID, Cat, Col, FoundLoc, Claim),
            (FoundLoc == LostLoc -> Type = 'EXACT MATCH' ; (adjacent(LostLoc, FoundLoc) -> Type = 'NEARBY MATCH' ; fail))
        ),
        MatchList
    ),
    display_results(MatchList).

% CASE A: Matches Found! (YES STATUS)
display_results(MatchList) :-
    MatchList \== [],
    nl, write('--> STATUS: YES! YOUR ITEM IS AVAILABLE TO CLAIM!'), nl,
    write('-------------------------------------------'), nl,
    print_list(MatchList).

% CASE B: No Matches Found (TRY AGAIN LATER STATUS)
display_results([]) :-
    nl, write('--> STATUS: NOT YET REPORTED!'), nl,
    write('--> Result: No matching item found in database right now.'), nl,
    write('--> Advice: Please try searching again later or check with campus security.'), nl,
    write('-------------------------------------------'), nl.

% Helper rule to print list of matches
print_list([]).
print_list([(Type, FID, FoundLoc, Claim)|Rest]) :-
    format('  [~w] Item ID : ~w~n', [Type, FID]),
    format('  - Found At    : ~w~n', [FoundLoc]),
    format('  - CLAIM HERE  : ~w~n', [Claim]),
    write('-------------------------------------------'), nl,
    print_list(Rest).