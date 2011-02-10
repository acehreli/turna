module library.fixedString;

import std.string;

/*
 * BUG: 
 * 
 * fixedString is very slow. Because we used "~=" operator in fixedString function.
 * 
 */


string[string] fixedString(string input)
{
    input= replace(input, "+", " ");
    string[string] endInput;

    string[] fixedInput1=split(input, "&"); //

    string[][] fixedInput2;

    foreach(fixedInput;fixedInput1) {

        fixedInput2~=split(fixedInput,"=");        
        
    }
    
    for(int a=0;a<fixedInput1.length;++a) {
        for(int b=1;b<fixedInput2[a].length;++b) {
            //endInput[fixedInput2[a][0]]~=fixedInput2[a][b+1];
            endInput[fixedInput2[a][0]]~=fixedInput2[a][b];
        }                
    }
    
    return endInput;
}
unittest
{
    string[string] deneme;
    
    deneme=fixedString("hayvan=at&derece=Orta&sevilen+hayvan=ğüşçü&ikinci+d%C3%BC%C4%9Fme=Ba%C5%9Fka+D%C3%BC%C4%9Fme");
    assert(deneme["hayvan"]=="at");
    assert(deneme["sevilen hayvan"]=="ğüşçü");

}
