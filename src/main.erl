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
-export([f/1]).

f(M) -> M.

simple_test() ->
  [?assert(f([[1, 0], [0, 1]]) == [[1, 0], [0, 1]])].
