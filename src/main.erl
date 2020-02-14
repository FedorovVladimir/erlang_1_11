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

det([[A11, A12], [A21, A22]]) -> A11 * A22 - A12 * A21.

mul(A, Det) -> lists:map(
  fun(R) -> lists:map(
    fun(X) -> X * Det
    end, R)
  end, A).

rmRow([], _) -> [];
rmRow([_|T], 0) -> T;
rmRow(A, I) -> rmRow(A, I-1).

rmCol(A, I) -> lists:map(fun(X) -> rmRow(X, I) end, A).

det_test() ->
  [?assertEqual(det([[1, 0], [0, 1]]), 1),
   ?assertEqual(det([[1, 1], [0, 1]]), 1),
   ?assertEqual(det([[1, 1], [1, 1]]), 0),

   ?assertEqual(mul([[1, 0], [0, 1]], 2), [[2, 0], [0, 2]]),

   ?assertEqual(rmRow([[1, 2], [3, 4]], 0), [[3, 4]]),
   ?assertEqual(rmRow([1, 2, 3], 0), [2, 3]),

   ?assertEqual(rmCol([[1, 2], [3, 4]], 0), [[2], [4]])].
