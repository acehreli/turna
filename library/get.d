/*
 * This module for get method.
 * 
 * */

module library.get;

import std.process; //  getenv
import std.string;
import library.convertToUTF8;
import library.fixedString;

/*
 * BUG: 
 * 
 * get is very slow. Because we used "~=" operator in fixedString function.
 * 
 */

string[string] get()
{
    string[string] endGet;
    string get = getenv("QUERY_STRING");
    string fixedStr=convertToUTF8(get);
    
    endGet=fixedString(fixedStr);
 
    
    
    return endGet;
}

