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

det([[A11, A12], [A21, A22]]) -> A11 * A22 - A12 * A21.

simple_test() ->
  [?assert(det([[1, 0], [0, 1]]) == 1),
   ?assert(det([[1, 1], [0, 1]]) == 1),
   ?assert(det([[1, 1], [1, 1]]) == 0)].
