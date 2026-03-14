move(e, e, 0).
move(e, s1e, 1).
move(e, s3e, 2).

move(s1e, e , 0).
move(s1e, s11 , 1).
move(s1e, s21 , 2).

move(s11, e , 0).
move(s11, s1f , 1).
move(s11, s21 , 2).

move(s1f, e , 0).
move(s1f, s1f , 1).
move(s1f, s21 , 2).

move(s21, e , 0).
move(s21, s31 , 1).
move(s21, s2f , 2).

move(s2f, e , 0).
move(s2f, s31 , 1).
move(s2f, s3e , 2).

move(s3e, e , 0).
move(s3e, s31 , 1).
move(s3e, s2e , 2).

move(s31, e , 0).
move(s31, s3f , 1).
move(s31, s21 , 2).

move(s3f, s3f , 0).
move(s3f, s3f , 1).
move(s3f, s3f , 2).

accepting_state(s1f).
accepting_state(s2f).

parseDFA(InputList) :-
    parseDFAHelper(InputList, e).
parseDFAHelper([], CurrentState) :-
    accepting_state(CurrentState),
    write('Accepted'), nl;
    write('Rejected'), nl.
parseDFAHelper([Symbol|Rest], CurrentState) :-
    move(CurrentState, NextState, Symbol),
    parseDFAHelper(Rest, NextState).

% Testing
execPositiveTests() :-
    parseDFA([1,1,1]),
    parseDFA([1,2,2]),
    parseDFA([1,1,2,2]),
    parseDFA([0,0,1,2,0,1,2,2]),
    parseDFA([1,1,1,1,1,1,1,2,2]),
    parseDFA([0,1,2,0,1,2,0,1,1,1,1]),
    parseDFA([1,1,2,1,2,2]).

execNegativeTests() :-
    parseDFA([2,1,1]),
    parseDFA([1,1,1,2]),
    parseDFA([0,0,1,2,1,2,2,2]),
    parseDFA([0,0,1,2,1,1,2,2,2]),
    parseDFA([1,1,1,1,2,1,1,0,1,1,1]),
    parseDFA([0,1,2,0,1,2,0,2,1,1,1]),
    parseDFA([2,1,1,0,1,0,2,0,0,1,2,2,1,2,0,0,1,2,2]).