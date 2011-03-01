module system.helper.htmlHelper;
import std.stdio;
import std.conv;
class HtmlHelper
{

    char[] bodyPiece;
    char[] head;
    char[] code;   


    this(){

        this.bodyPiece=[]; 
        this.head=[];
        this.code=[];

    }

    void saveInFile(string fileName){

        File saved=File(fileName,"a");

        saved.write(code);

    }

    void createBody(string[] functions ... ){

        foreach(i;functions){

            bodyPiece~=i;

        }

        bodyPiece="<body>\n"~bodyPiece~"</body>\n";

    }

    void createHead(string[] functions ... ){

        foreach(i;functions){

            head~=i;

        }

        head="<head>"~head~"</head\n";

    }

    void finishCode(){

        code="<html>\n"~head~bodyPiece~"</html>";

    }

        

    string createTitle(const char[] title){
  
        return "<title>"~to!string(title)~"</title>\n";

    }


    string header(int level,string text){

        switch(level){
        case 1: return "<h1>"~text~"</h1>\n";
        case 2: return "<h2>"~text~"</h2>\n";
        case 3: return "<h3>"~text~"</h3>\n";
        case 4: return "<h4>"~text~"</h4>\n";
        case 5: return "<h5>"~text~"</h5>\n";
        case 6: return "<h6>"~text~"</h6>\n";
        default:return "ERROR" ; //It is not a solving.It must change.
    
        }

    }

    string downLine(){

        return "<br />\n";

    }

    string paragraph(string text){

        return "<p>"~text~"</p>\n";

    }

    string bolder(string text){
  
        return "<b>"~text~"</b>\n";

    }

    string createLink(string address,string name){
    
        return "<a href=\""~address~"\">"~name~"</a>\n";

    }

    string createComment(string comment){

        return "<!--"~comment~"-->\n";

    }

    string bigger(string text){
    
        return "<big>"~text~"</big>\n";

    }

    string emphasized(string text){

        return "<em>"~text~"</em>\n";

    }

    string italic(string text){

        return "<i>"~text~"</i>\n";

    }

    string smaller(string text){

        return "<small>"~text~"</small>\n";

    }

    string stronger(string text){

        return "<strong>"~text~"</strong>\n";

    }

    string subscripted(string text){

        return "<sub>"~text~"</sub>\n";

    }

    string superscripted(string text){
 
        return "<sup>"~text~"</sup>\n";

    }

    string inserted(string text){

        return "<ins>"~text~"</ins>\n";

    }

    string deleted(string text){

        return "<del>"~text~"</del>\n";

    }

    string definitionTerm(string text){

        return "<dfn>"~text~"</dfn>\n";

    }

    string codeStyle(string text){

        return "<code>"~text~"</code>\n";

    }

    string keyboardText(string text){

        return "<kbd>"~text~"</kbd>\n";

    }

    string sample(string text){
  
        return "<samp>"~text~"</samp>\n";

    }

    string teleType(string text){

        return "<tt>"~text~"</tt>\n";
 
    }

    string variable(string text){

        return "<var>"~text~"</var>\n";

    }

    string preformatted(string text){

        return "<pre>"~text~"</pre>\n";

    }

    string abbreviated(string text,string longer){

        return "<abbr title="~longer~">"~text~"</abbr>\n";

    }

    string acronym(string headCharacters,string text){

        return "<acronym title="~text~">"~headCharacters~"</acronym>\n";

    }

    string bidirectional(int direction,string text){

        if(direction==0){
 
            return "<bdo dir=\"rtl\">"~text~"</bdo>\n";

        }else{

            return "<bo dir=\"ltr\">"~text~"</bdo>\n";

        }
    }

    string longQuote(string text){

        return "<blockquote>"~text~"</blockquote>\n";

    }

    string shortQuote(string text){

        return "<q>"~text~"</q>\n";

    }

    string citation(string text){

        return "<cite>"~text~"</cite>\n";

    }

}

unittest
{
    HtmlHelper help=new HtmlHelper();
    help.createBody(
        help.downLine(),
        help.header(1,"Merhaba"),
        help.paragraph("Merhaba"),
        help.bolder("Merhaba"),
        help.bigger("Merhaba"),
        help.emphasized("Merhaba"),
        help.italic("Merhaba"),
        help.smaller("Merhaba"),
        help.stronger("Merhaba"),
        help.subscripted("Merhaba"),
        help.superscripted("Merhaba"),
        help.inserted("Merhaba"),
        help.deleted("Merhaba"),
        help.keyboardText("Merhaba"),
        help.sample("Merhaba"),
        help.teleType("Merhaba"),
        help.variable("Merhaba"),
        help.preformatted("Merhaba"),
        help.abbreviated("Mrb","Merhaba"),
        help.acronym("MD","Merhaba D"),
        help.bidirectional(0,"Merhaba"),
        help.longQuote("Merhaba"),
        help.shortQuote("Merhaba"),
        help.citation("Merhaba"),
    );
    help.createHead(
        help.createTitle("Merhaba"),
    );
    help.finishCode();
    write(help.code);
    help.saveInFile("merhaba.html");
}