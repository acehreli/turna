/*
 * This module for get method.
 * 
 * 
*/
module library.cookie;

import std.process; //  getenv
import std.string;
//import library.convertToUTF8;
import std.uri;
import library.fixedString;
import std.conv;
import std.cstream;

string cookie()
{
    string endCookie;
    string cookie = getenv("HTTP_COOKIE");
  
    
    //endCookie=fixedStringForCookie(decode(cookie));
    endCookie=decode(cookie);
    
    
    return endCookie;
}

void setCookie(string name, string data, long expiresIn = 0, string path = null, string domain = null, bool httpOnly = false)
{
    
    string[] responseCookies;

    string cookie = name ~ "=";
    cookie ~= data;
    string[] hd;
    if(path !is null)
        cookie ~= "; path=" ~ path;
    if(expiresIn != 0)
        cookie ~= "; Max-Age=" ~ to!(string)(expiresIn);
    if(domain !is null)
        cookie ~= "; domain=" ~ domain;
    if(httpOnly == true )
        cookie ~= "; HttpOnly";
    
    responseCookies ~= cookie;
    foreach(c; responseCookies)
        hd ~= "Set-Cookie: " ~ c;
    
    foreach(one;hd)
        std.stdio.writeln(one);

}

void registerCookie()
{
    std.stdio.writeln();
}




/* I don't know really necessary
 * 
void clearCookie(string name, string path = null, string domain = null) {
    string[string] test;
    test=cookie();
    if(name in test)
        setCookie(name, "", 1, path, domain);
    else
        throw new Exception("Error: Cookie don't Found");
}


*/
