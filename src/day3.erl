-module(day3).

-export([part1/0, part2/0]).

-import(aoc2015_erlang, [input_filename/1]).

part1() ->
    FileName = input_filename(?MODULE_STRING),
    {ok, Binary} = file:read_file(FileName),
    Moves = binary_to_list(Binary),
    {_, Visited} =
        lists:foldl(fun(Move, {Coords_, Visited}) ->
                       Coords = move(Coords_, Move),
                       case maps:is_key(Coords, Visited) of
                           true -> {Coords, Visited};
                           false -> {Coords, Visited#{Coords => true}}
                       end
                    end,
                    {{0, 0}, #{{0, 0} => true}},
                    Moves),
    map_size(Visited).

part2() ->
    FileName = input_filename(?MODULE_STRING),
    {ok, Binary} = file:read_file(FileName),
    Moves = binary_to_list(Binary),
    {_, _, _, Visited} =
        lists:foldl(fun(Move, {SantaToggle, Santa, RoboSanta, Visited}) ->
                       case SantaToggle of
                           true ->
                               Coords = move(Santa, Move),
                               {false, Coords, RoboSanta, visit(Visited, Coords)};
                           false ->
                               Coords = move(RoboSanta, Move),
                               {true, Santa, Coords, visit(Visited, Coords)}
                       end
                    end,
                    {true, {0, 0}, {0, 0}, #{{0, 0} => true}},
                    Moves),
    map_size(Visited).

move({X, Y}, Move) ->
    case Move of
        $< ->
            {X - 1, Y};
        $^ ->
            {X, Y - 1};
        $> ->
            {X + 1, Y};
        $v ->
            {X, Y + 1}
    end.

visit(Visited, Coords) ->
    case maps:is_key(Coords, Visited) of
        true ->
            Visited;
        false ->
            Visited#{Coords => true}
    end.
