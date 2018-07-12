-module(recursive).
-export([fac/1,len/1,tail_fac/1, tail_len/1, duplicate/2]).

fac(0) -> 1;
fac(N) when N > 0 ->
  N*fac(N-1).

len([]) -> 0;
len([Head|Tail]) ->
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
