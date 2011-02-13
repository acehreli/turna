/*
 * This module is for the post method.
 * 
 * */

module library.post;

//import library.convertToUTF8;
import library.fixedString;
import std.process;
import std.cstream;
import std.conv;

/*
 * BUG:
 * 
 * post is very slow. Because we used the "~=" operator for the firstPost
 * variable.
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
    
    
    endPost=forGetAndPost(to!(string)(firstPost));//fixedString.forGetAndPost
    
    
    return endPost;    
    
}
