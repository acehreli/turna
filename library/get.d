/*
 * This module for get method.
 * 
 * */

module library.get;

import std.process; //  getenv
import std.string;
//import library.convertToUTF8;
import std.uri;
import library.fixedString;



string[string] get()
{
    string[string] endGet;
    string get = getenv("QUERY_STRING");
  
    
    endGet=forGetAndPost(decode(get)); //fixedString.forGetAndPost
 
    
    
    return endGet;
}
