-module(recursive).
-export([fac/1,len/1,tail_fac/1, tail_len/1, duplicate/2, reverse/1, tail_rev/1, tail_sublist/2, zip/2, lenient_zip/2, quicksort/1, partition/4]).

fac(0) -> 1;
fac(N) when N > 0 ->
  N*fac(N-1).

len([]) -> 0;
len([_|Tail]) ->
  1 + len(Tail).

tail_fac(N) -> tail_fac(N,1).
tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

tail_len(N) -> tail_len(N,0).
tail_len([], Acc) -> Acc;
tail_len([_|Tail],Acc) -> tail_len(Tail, Acc + 1).

duplicate(0,_) -> [];
duplicate(N, Term) ->
  [Term | duplicate(N-1,Term)].

reverse([]) -> [];
reverse([Head|Tail]) ->
  reverse(Tail) ++ [Head].

tail_rev(List) -> tail_rev(List, []).
tail_rev([], Acc) -> Acc;
tail_rev([Head | Tail], Acc) ->
  tail_rev(Tail, [Head | Acc]).

sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([Head|Tail],N) when N > 0 -> 
  [Head | sublist(Tail, N-1)].

tail_sublist(List, N) -> reverse(tail_sublist(List, N, [])).
tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([Head|Tail],N,SubList) when N > 0 ->
  tail_sublist(Tail, N-1, [Head | SubList]).

zip([], []) -> [];
zip([H1 | T1], [H2 | T2]) ->
  [{H1,H2} | zip(T1, T2)].

lenient_zip(_, []) -> [];
lenient_zip([], _) -> [];
lenient_zip([H1 | T1], [H2 | T2]) ->
  [{H1, H2} | lenient_zip(T1, T2)].

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(Pivot,Rest,[],[]),
  quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
    H >  Pivot -> partition(Pivot, T, Smaller, [H|Larger])
  end.

lc_quicksort([]) -> [];
lc_quicksort([Pivot | Rest]) ->
  lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot]),
  ++ [Pivot] ++
  lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).
