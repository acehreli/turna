/*
 * Written by Ali Çehreli
 * 
 * Look: http://ddili.org/forum/post/1462
 * 
 * This module is convert to UTF-8;
 * */
module library.convertToUTF8;

import std.cstream;
import std.process;
import std.conv;
 
int hexadecimalCode(in char character)
in
{
    assert(((character >= '0') && (character <= '9'))
           ||
           ((character >= 'A') && (character <= 'F')));
}
out(result)
{
    assert((result >= 0) && (result <= 15));
}
body
{
    const int code = (character >= '0' && character <= '9')
                    ? character - '0'
                    : 10 + character - 'A';
    return code;
}
unittest
{
    assert(hexadecimalCode('1') == 1);
    assert(hexadecimalCode('C') == 12);
}
 
char errorChar(string input)
in
{
    assert(input.length == 3);
    assert(input[0] == '%');
}
body
{
    const int code = hexadecimalCode(input[1]) * 16 +
                     hexadecimalCode(input[2]);
    return cast(char)code;
}
unittest
{
    assert(errorChar("%8A") == '\x8a');
    assert(errorChar("%20") == ' ');
}
 
string convertToUTF8(string input)
{
    string result;
 
    int i;
 
    while (i < input.length) {
        if (input[i] == '%') {
            // Sonunda yer olmalı //Should be free at the end
            assert(input.length - i >= 3);
 
            result ~= errorChar(input[i .. i + 3]);
            i += 3;
        } else {
            result ~= input[i];
            ++i;
        }
    }
 
    return result;
}
unittest
{
    assert(convertToUTF8("a%20b%DDc") == "a\x20b\xddc");
    assert(convertToUTF8("%25") == "%");
}
 
