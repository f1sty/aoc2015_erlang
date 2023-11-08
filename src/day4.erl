-module(day4).

-export([part1/0, part2/0]).

part1() ->
    SecretKey = "ckczppom",
    Suffix = 0,
    calculate(SecretKey, Suffix, ?FUNCTION_NAME).

part2() ->
    SecretKey = "ckczppom",
    Suffix = 0,
    calculate(SecretKey, Suffix, ?FUNCTION_NAME).

calculate(SecretKey, Suffix, Part) ->
    case check(SecretKey, Suffix, Part) of
        true ->
            Suffix;
        false ->
            calculate(SecretKey, Suffix + 1, Part)
    end.

check(SecretKey, Suffix, Part) ->
    MD5 = binary_to_list(crypto:hash(md5, [SecretKey, integer_to_list(Suffix)])),
    FormattedMD5 =
        lists:flatten([string:pad(integer_to_list(X, 16), 2, leading, $0) || X <- MD5]),
    validate(FormattedMD5, Part).

validate([$0, $0, $0, $0, $0 | _], part1) ->
    true;
validate([$0, $0, $0, $0, $0, $0 | _], part2) ->
    true;
validate(_, _) ->
    false.
