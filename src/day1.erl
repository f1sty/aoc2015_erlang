-module(day1).

-export([part1/0, part2/0]).

-import(aoc2015_erlang, [input_filename/1]).

part1() ->
    FileName = input_filename(?MODULE_STRING),
    {ok, Binary} = file:read_file(FileName),
    lists:foldl(fun ($), Acc) ->
                        Acc - 1;
                    ($(, Acc) ->
                        Acc + 1
                end,
                0,
                binary_to_list(Binary)).

part2() ->
    FileName = input_filename(?MODULE_STRING),
    {ok, Binary} = file:read_file(FileName),
    try
        lists:foldl(fun ($), {0, Idx}) ->
                            throw(Idx);
                        ($), {Floor, Idx}) ->
                            {Floor - 1, Idx + 1};
                        ($(, {Floor, Idx}) ->
                            {Floor + 1, Idx + 1}
                    end,
                    {0, 1},
                    binary_to_list(Binary))
    catch
        Idx ->
            Idx
    end.
