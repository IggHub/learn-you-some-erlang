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

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).
filter(_,[], Acc) -> Acc;
filter(Pred, [Head|Tail], Acc) ->
  case Pred(Head) of
    true -> filter(Pred, Tail, [Head | Acc]);
    false -> filter(Pred, Tail, Acc)
  end.

%% find the maximum of a list
max([H|T]) -> max2(T, H).
 
max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).
 
%% find the minimum of a list
min([H|T]) -> min2(T,H).
 
min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min2(T,H);
min2([_|T], Min) -> min2(T, Min).
 
%% sum of all the elements of a list
sum(L) -> sum(L,0).
 
sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, H+Sum).

fold(_, Start, []) -> Start;
fold(F, Start, [Head | Tail]) -> fold(F, F(Head, Start), Tail).
