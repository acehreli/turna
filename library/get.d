/*
 * This module is for the get method.
 * 
 * */

module library.get;

import std.process; //  getenv
import std.string;
//import library.convertToUTF8;
import library.fixedString;



string[string] get()
{
    string[string] resultGet;
    string get = getenv("QUERY_STRING");
  
    
    resultGet=forGetAndPost(get); //fixedString.forGetAndPost
 
    
    
    return resultGet;
}
