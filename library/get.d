/*
 * This module for get method.
 * 
 * */

module library.get;

import std.process; //  getenv
import std.string;
import library.convertToUTF8;

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

string[string] fixedString(string get)
{
    get= replace(get, "+", " ");
    string[string] endGet;

    string[] fixedGet1=split(get, "&"); //

    string[][] fixedGet2;

    foreach(fixedGet;fixedGet1) {

        fixedGet2~=split(fixedGet,"=");        
        
    }
    
    for(int a=0;a<fixedGet1.length;++a) {
        for(int b=1;b<fixedGet2[a].length;++b) {
            //endGet[fixedGet2[a][0]]~=fixedGet2[a][b+1];
            endGet[fixedGet2[a][0]]~=fixedGet2[a][b];
        }                
    }
    
    return endGet;
}
unittest
{
    string[string] deneme;
    
    deneme=fixedString("hayvan=at&derece=Orta&sevilen+hayvan=ğüsçü&ikinci+d%C3%BC%C4%9Fme=Ba%C5%9Fka+D%C3%BC%C4%9Fme");
    assert(deneme["hayvan"]=="at");
    assert(deneme["sevilen hayvan"]=="ğüşçü");

}
