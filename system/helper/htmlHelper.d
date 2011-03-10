module system.helper.htmlHelper;

import std.stdio;
import std.conv;

enum Direction { right, left }

enum Link { inPage, newPage }

enum Lists { ordered, unOrdered }

string createXml(string name , string value)
{
    return "<" ~ name ~ ">" ~ value ~ "</" ~ name ~ ">\n";
}

string createTitle(const char[] title)
{
    return createXml("title", to!string(title));
}

string downLine()
{
    return "<br />\n";
}

string paragraph(string text)
{
    return createXml("p", text);
}

string bolder(string text)
{
    return createXml("b", text);
}

string createLink(Link link, string address, string name)
{
    final switch (link) {

    case link.inPage:

        return "<a name=" ~ address ~ ">" ~ name ~ "</a>";

    case link.newPage:

        return "<a href=" ~ address ~ ">" ~ name ~ "</a>";
    }
}

string createComment(string comment)
{
    return "<!--" ~ comment ~ "--!";
}

string bigger(string text)
{
    return createXml("big", text);
}

string emphasized(string text)
{
    return createXml("em", text);
}

string italic(string text)
{
    return createXml("i", text);
}

string smaller(string text)
{
    return createXml("small", text);
}

string stronger(string text)
{
    return createXml("strong", text);
}

string subscripted(string text)
{
    return createXml("sub", text);
}

string superscripted(string text)
{
    return createXml("sup", text);
}

string inserted(string text)
{
    return createXml("ins", text);
}

string deleted(string text)
{
    return createXml("del", text);
}

string definitionTerm(string text)
{
    return createXml("dfn", text);
}

string codeStyle(string text)
{
    return createXml("code", text);
}

string keyboardText(string text)
{
    return createXml("kbd", text);
}

string sample(string text)
{
    return "<samp>" ~ text ~ "</samp>\n";
}

string teleType(string text)
{
    return createXml("tt", text);
}

string variable(string text)
{
    return createXml("var", text);
}

string preformatted(string text)
{
    return createXml("pre", text);
}

string abbreviated(string text, string longer)
{
    return "<abbr title=" ~ longer ~ ">" ~ text ~ "</abbr>\n";
}

string acronym(string headCharacters, string text)
{
    return "<acronym title=" ~ text ~ ">" ~ headCharacters ~ "</acronym>\n";
}

string bidirectional(Direction direction, string text)
{
    final switch (direction) {
    case Direction.left:
        return "<bdo dir=\"ltr\">" ~ text ~ "</bdo>\n";

    case Direction.right:
        return "<bdo dir=\"rtl\">" ~ text ~ "</bdo>\n";
    }
}

string longQuote(string text)
{
    return createXml("blockquote", text);
}

string shortQuote(string text)
{
    return createXml("q", text);
}

string citation(string text)
{
    return createXml("cite", text);
}

string createList(Lists type, string[] matter ...)
{
    char[] listCode;
    string returnCode;

    foreach (i; matter) {
        listCode ~= createXml("li", to!string(i));
    }

    final switch (type) {
    case Lists.ordered:
        returnCode = createXml("ol", to!string(listCode));
        break;

    case Lists.unOrdered:
        returnCode = createXml("ul", to!string(listCode));
        break;
    }

    return returnCode;
}

class HtmlHelper
{
    char[] bodyPiece;
    char[] head;
    char[] code;
    char[] i;

    this()
    {
        this.bodyPiece = [];
        this.head = [];
        this.code = [];
        this.i=[];
    }

    // Warning: If file exists, this function removes the file
    void saveInFile(string fileName)
    {
        File saved = File(fileName, "w");
        saved.write(code);
    }

    void createBody(string[] pieces ...)
    {
        foreach (i; pieces) {
            bodyPiece ~= i;
        }

        bodyPiece = "<body>" ~ bodyPiece ~ "</body>";
    }

    void createHead(string[] pieces ...)
    {
        foreach (i; pieces) {
            head ~= i;
        }

        head = "<head>" ~ head ~ "</head>";
    }

    void finishCode()
    {
        code = "<html>\n" ~ head ~ bodyPiece ~ "</html>\n";
    }
}

unittest
{
    assert(downLine() == "<br />\n");
    assert(createLink(Link.inPage, "forum", "ddili" )
           =="<a name=forum>ddili</a>");
    assert(createLink(Link.newPage, "forum", "ddili" )
           =="<a href=forum>ddili</a>");
    assert(paragraph("Merhaba") == "<p>Merhaba</p>\n");
    assert(bolder("Merhaba") == "<b>Merhaba</b>\n");
    assert(bigger("Merhaba") == "<big>Merhaba</big>\n");
    assert(emphasized("Merhaba") == "<em>Merhaba</em>\n");
    assert(italic("Merhaba") == "<i>Merhaba</i>\n");
    assert(smaller("Merhaba") == "<small>Merhaba</small>\n");
    assert(stronger("Merhaba") == "<strong>Merhaba</strong>\n");
    assert(subscripted("Merhaba") == "<sub>Merhaba</sub>\n");
    assert(superscripted("Merhaba") == "<sup>Merhaba</sup>\n");
    assert(inserted("Merhaba") == "<ins>Merhaba</ins>\n");
    assert(deleted("Merhaba") == "<del>Merhaba</del>\n");
    assert(keyboardText("Merhaba") == "<kbd>Merhaba</kbd>\n");
    assert(sample("Merhaba") == "<samp>Merhaba</samp>\n");
    assert(teleType("Merhaba") == "<tt>Merhaba</tt>\n");
    assert(variable("Merhaba") == "<var>Merhaba</var>\n");
    assert(preformatted("Merhaba") == "<pre>Merhaba</pre>\n");
    assert(abbreviated("Mrb", "Merhaba")
           == "<abbr title=Merhaba>Mrb</abbr>\n");
    assert(acronym("MD", "Merhaba D")
           == "<acronym title=Merhaba D>MD</acronym>\n");
    assert(bidirectional(Direction.right, "Merhaba")
           == "<bdo dir=\"rtl\">Merhaba</bdo>\n");
    assert(longQuote("Merhaba") == "<blockquote>Merhaba</blockquote>\n");
    assert(shortQuote("Merhaba") == "<q>Merhaba</q>\n");
    assert(citation("Merhaba") == "<cite>Merhaba</cite>\n");
    assert(createList(Lists.ordered, "Merhaba" )
           == "<ol><li>Merhaba</li>\n</ol>\n");
}
