-module(aoc2015_erlang).

-export([run/0, input_filename/1]).

-import(day1, [part1/0, part2/0]).

input_filename(Day) ->
    ["inputs/", Day].

run() ->
    FinishedDays = [day1, day2, day3],
    [run(Day) || Day <- FinishedDays],
    ok.

run(Module) ->
    Output = [Module, [Module:Fun() || Fun <- [part1, part2]]],
    io:format("~p: ~p~n", Output).
