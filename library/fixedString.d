module library.fixedString;

import std.array;
import std.uri;

/*
 * BUG:
 *
 * fixedString is very slow. Because we used the "~=" operator in the
 * fixedString function.
 *
 */

string[string] forGetAndPost(string input)
{
    input = decode(input);
    input = replace(input, "+", " ");
    string[string] endInput;

    string[] fixedInput1=split(input, "&");

    string[][] fixedInput2;

    foreach (fixedInput; fixedInput1) {
        fixedInput2 ~= split(fixedInput, "=");
    }

    for (int a = 0; a < fixedInput1.length; ++a) {
        for (int b = 1; b < fixedInput2[a].length; ++b) {
            endInput[fixedInput2[a][0]] ~= fixedInput2[a][b];
        }
    }

    return endInput;
}

unittest
{
    string[string] deneme;

    deneme = forGetAndPost("hayvan=at&derece=Orta&"
                           "ikinci+d%C3%BC%C4%9Fme=Ba%C5%9Fka+D%C3%BC%C4%9Fme");
    assert(deneme["hayvan"] == "at");
    assert(deneme["ikinci düğme"] == "Başka Düğme");
}

string[string] forCookie(string input)
{
    string[string] endInput;

    string[] fixedInput1 = split(input, "; ");

    string[][] fixedInput2;

    foreach (fixedInput; fixedInput1) {
        fixedInput2 ~= split(fixedInput, "=");
    }

    for (int a = 0; a < fixedInput1.length; ++a) {
        for (int b = 1; b < fixedInput2[a].length; ++b) {
            endInput[fixedInput2[a][0]] ~= fixedInput2[a][b];
        }
    }

    return endInput;
}

unittest
{
    string[string] deneme;

    deneme = forCookie("deneme=lalala; olala olalala=passaporala ekranlarda");
    assert(deneme["deneme"] == "lalala");
    assert(deneme["olala olalala"] == "passaporala ekranlarda");
}
