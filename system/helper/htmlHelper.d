module helper;
import std.stdio;
import std.conv;
class HtmlHelper
{

    char[] content;
    char[] head;    

    void htmlTags(){
  
        content~="<html>\n"~content~"</html\n";

    }

    void headTags(){
        
        content~="<head>\n"~head~"</head>\n";

    }

    void createTitle(const char[] title){
  
        head~="<title>"~to!string(title)~"</title>\n";

    }

    void bodyPiece(){
    
        content~="<body>\n"~content~"</body>\n";

    }

    void header(int level,string text){

        switch(level){
        case 1: content~="<h1>"~text~"</h1>\n"; break;
        case 2: content~="<h2>"~text~"</h2>\n"; break;
        case 3: content~="<h3>"~text~"</h3>\n"; break;
        case 4: content~="<h4>"~text~"</h4>\n"; break;
        case 5: content~="<h5>"~text~"</h5>\n"; break;
        case 6: content~="<h6>"~text~"</h6>\n"; break;
        default:;
    
        }

    }

    void downLine(){

        content~="<br />\n";

    }

    void paragraph(string metin){

        content~="<p>"~metin~"</p>\n";

    }

    void bolder(string metin){
  
        content~="<b>"~metin~"</b>\n";

    }

    void createTable(){

        content~="<table>";

    }

    void createLink(string address,string name){
    
        content~="<a href=\""~address~"\">"~name~"</a>\n";

    }

    void createComment(string comment){

        content~="<!--"~comment~"-->\n";

    }

}

unittest
{
    HtmlHelper help=new HtmlHelper();
    help.downLine();
    //help.header(1,"Merhaba");
    help.paragraph("Merhaba");
    help.bolder("Merhaba");
    help.bodyPiece();
    help.createTitle("Merhaba");
    //help.head();
    help.htmlTags();
    writeln(help.content);
}
