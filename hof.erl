-module(hof).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) ->
  X() + Y().

increment([]) -> [];
increment([H|T]) -> [H + 1 | increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H - 1 | decrement(T)].

map(_, []) -> [];
map(F, [H|T]) ->
  [F(H) | map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

even(L) -> lists:reverse(even(L, [])).
even([], Acc) -> Acc;
even([Head | Tail], Acc) when Head rem 2 == 0 ->
  even(Tail, [Head | Acc]);
even([_ | Tail], Acc) ->
  even(Tail, Acc).

old_men(L) -> lists:reverse(old_men(L,[])).
 
old_men([], Acc) -> Acc;
old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
  old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
  old_men(People, Acc).
