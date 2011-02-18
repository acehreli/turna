module helper;
import std.stdio;
import std.conv;
class HtmlHelper
{

    char[] content;
    char[] head;    

    this(){

        this.content=[]; 
        this.head=[];

    }

    void createCode(){

        writeln(content);

    }
  
    void htmlTags(){
  
        content="<html>\n"~content~"</html>\n";

    }

    void headTags(){
        
        content="<head>\n"~head~"</head>\n"~content;

    }

    void createTitle(const char[] title){
  
        head~="<title>"~to!string(title)~"</title>\n";

    }

    void bodyPiece(){
    
        content="<body>\n"~content~"</body>\n";

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

    void paragraph(string text){

        content~="<p>"~text~"</p>\n";

    }

    void bolder(string text){
  
        content~="<b>"~text~"</b>\n";

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

    void bigger(string text){
    
        content~="<big>"~text~"</big>\n";

    }

    void emphasized(string text){

        content~="<em>"~text~"</em>\n";

    }

    void italic(string text){

        content~="<i>"~text~"</i>\n";

    }

    void smaller(string text){

        content~="<small>"~text~"</small>\n";

    }

    void stronger(string text){

        content~="<strong>"~text~"</strong>\n";

    }

    void subscripted(string text){

        content~="<sub>"~text~"</sub>\n";

    }

    void superscripted(string text){
 
        content~="<sup>"~text~"</sup>\n";

    }

    void inserted(string text){

        content~="<ins>"~text~"</ins>\n";

    }

    void deleted(string text){

        content~="<del>"~text~"</del>\n";

    }

    void definitionTerm(string text){

        content~="<dfn>"~text~"</dfn>\n";

    }

    void codeStyle(string text){

        content~="<code>"~text~"</code>\n";

    }

}

unittest
{
    HtmlHelper help=new HtmlHelper();
    help.downLine();
    help.header(1,"Merhaba");
    help.paragraph("Merhaba");
    help.bolder("Merhaba");
    help.bigger("Merhaba");
    help.emphasized("Merhaba");
    help.italic("Merhaba");
    help.smaller("Merhaba");
    help.stronger("Merhaba");
    help.subscripted("Merhaba");
    help.superscripted("Merhaba");
    help.inserted("Merhaba");
    help.deleted("Merhaba");
    help.bodyPiece();
    help.createTitle("Merhaba");
    help.headTags();
    help.htmlTags();
    help.createCode();
}