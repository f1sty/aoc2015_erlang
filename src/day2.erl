-module(day2).

-export([part1/0, part2/0]).

-import(aoc2015_erlang, [input_filename/1]).

part1() ->
    FileName = input_filename(?MODULE_STRING),
    {ok, Binary} = file:read_file(FileName),
    SizesRaw = binary:split(Binary, <<"\n">>, [trim_all, global]),
    Sizes =
        [lists:map(fun binary_to_integer/1, binary:split(S, <<"x">>, [trim_all, global]))
         || S <- SizesRaw],
    lists:sum(
        lists:map(fun([Length, Width, Height] = Dimentions) ->
                     Area = 2 * Length * Width + 2 * Width * Height + 2 * Height * Length,
                     [A, B | _] = lists:sort(Dimentions),
                     Area + A * B
                  end,
                  Sizes)).

part2() ->
    FileName = input_filename(?MODULE_STRING),
    {ok, Binary} = file:read_file(FileName),
    SizesRaw = binary:split(Binary, <<"\n">>, [trim_all, global]),
    Sizes =
        [lists:map(fun binary_to_integer/1, binary:split(S, <<"x">>, [trim_all, global]))
         || S <- SizesRaw],
    lists:sum(
        lists:map(fun([Length, Width, Height] = Dimentions) ->
                     Volume = Length * Width * Height,
                     [A, B | _] = lists:sort(Dimentions),
                     Volume + 2 * A + 2 * B
                  end,
                  Sizes)).
