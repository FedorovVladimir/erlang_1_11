%%%-------------------------------------------------------------------
%%% @author vladimir
%%% @copyright (C) 2020, <3CRABS>
%%% @doc
%%% Программа вычисляющая обратную матрицу.
%%% @end
%%% Created : 14. февр. 2020 21:24
%%%-------------------------------------------------------------------
-module(main).
-author("vladimir").
-include_lib("eunit/include/eunit.hrl").
-export([det/1]).
-export([mul/2]).
-export([rmRow/2]).
-export([rmCol/2]).
-export([rm/3]).

det([[A11, A12], [A21, A22]]) -> A11 * A22 - A12 * A21.

mul(A, Det) -> lists:map(
  fun(R) -> lists:map(
    fun(X) -> X * Det
    end, R)
  end, A).

rmRow([], _) -> [];
rmRow([_|T], 0) -> T;
rmRow([H|T], I) -> [H|rmRow(T, I-1)].

rmCol(A, I) -> lists:map(fun(X) -> rmRow(X, I) end, A).

rm(A, I, J) -> rmCol(rmRow(A, I), J).

getRow([], _) -> [];
getRow([H|_], 0) -> H;
getRow([_|T], I) -> getRow(T, I-1).

get(A, I, J) -> getRow(getRow(A, I), J).

m(A, I, J) ->
 if I + J rem 2 == 0 -> det(rm(A, I, J)) * get(A, I, J);
    I + J rem 2 == 1 -> det(rm(A, I, J)) * (-1) * get(A, I, J) end.

det_test() ->
  [
   ?assertEqual(det([[1, 0], [0, 1]]), 1),
   ?assertEqual(det([[1, 1], [0, 1]]), 1),
   ?assertEqual(det([[1, 1], [1, 1]]), 0),

   ?assertEqual(mul([[1, 0], [0, 1]], 2), [[2, 0], [0, 2]]),

   ?assertEqual(rmRow([[1, 2], [3, 4]], 0), [[3, 4]]),
   ?assertEqual(rmRow([1, 2, 3], 0), [2, 3]),
   ?assertEqual(rmRow([1, 2, 3], 1), [1, 3]),

   ?assertEqual(rmCol([[1, 2], [3, 4]], 0), [[2], [4]]),
   ?assertEqual(rmCol([[1, 2], [3, 4]], 1), [[1], [3]]),

   ?assertEqual(rm([[1, 2], [3, 4]], 0, 0), [[4]]),
   ?assertEqual(rm([[1, 2], [3, 4]], 1, 1), [[1]]),
   ?assertEqual(rm([[1, 2], [3, 4]], 0, 1), [[3]]),

   ?assertEqual(getRow([[1, 2], [3, 4]], 0), [1, 2]),
   ?assertEqual(getRow([[1, 2], [3, 4]], 1), [3, 4]),
   ?assertEqual(getRow([1, 2], 0), 1),
   ?assertEqual(getRow([1, 2], 1), 2),

   ?assertEqual(get([[1, 2], [3, 4]], 0, 0), 1),
   ?assertEqual(get([[1, 2], [3, 4]], 0, 1), 2),
   ?assertEqual(get([[1, 2], [3, 4]], 1, 0), 3),

   ?assertEqual(m([[1, 2, 3], [4, 5, 6], [7, 8, 9]], 0, 0), -3),
   ?assertEqual(m([[1, 2, 3], [4, 5, 6], [7, 8, 9]], 0, 1), 12)
   ].
