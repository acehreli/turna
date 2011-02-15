module helper;
import std.stdio;

void htmlStart(){
  
    writeln("<html>");

}

void htmlFinish(){
    
    writeln("</html>");

}

void createTitle(string title){
  
    writeln("<title>",title,"</title>");

}

void bodyStart(){
    
    writeln("<body>");

}

void bodyFinish(){

    writeln("</body>");

}

void header(int level,string text){

    switch(level){
	case 1: writeln("<h1>",text,"</h1>"); break;
	case 2: writeln("<h2>",text,"</h2>"); break;
	case 3: writeln("<h3>",text,"</h3>"); break;
	case 4: writeln("<h4>",text,"</h4>"); break;
	case 5: writeln("<h5>",text,"</h5>"); break;
	case 6: writeln("<h1>",text,"</h6>"); break;
	default: writeln("ERROR");
    }

}

void downLine(){

    writeln("<br />");

    }

void paragraph(string metin){

    writeln("<p>",metin,"</p>");

}

void bolder(string metin){
  
    writeln("<b>",metin,"</b>");

}

void createTable(int kalınlık,int){

    writeln("<table>");

}



void main()
{
    htmlStart();
    createTitle("MERHABA");
    bodyStart();
    downLine();
    paragraph("Merhaba");
    bolder("Merhaba");
    header(1,"Merhaba");
    bodyFinish();
    htmlFinish();
}
 

    
