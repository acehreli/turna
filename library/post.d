/*
 * This module for get method.
 * 
 * */

module library.post;

import library.convertToUTF8;
import library.fixedString;
import std.process;
import std.cstream;
import std.conv;
/*
 * BUG:
 * 
 * post is very slow. Because we used "~=" operator for firsPost variable.
 * 
 * 
 * */
string[string] post()
{
    
    string[string] endPost;
    char[] firstPost;
    while(firstPost.length<to!int(getenv("CONTENT_LENGTH"))){
        
        firstPost~=din.getc;
 
    }
    
    string fixedStr=convertToUTF8(to!(string)(firstPost));
    
    endPost=fixedString(fixedStr);
    
    
    return endPost;    
    
}
