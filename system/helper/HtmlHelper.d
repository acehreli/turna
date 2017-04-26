module system.helper.htmlhelper;
import std.conv;
class XmlElement
{
    string _htmlTag;
    string[ string ] _attributes;
    string _content;
    char[] _firstPiece;
    char[] _lastPiece;
    XmlElement[] _subElements;
	
    this( string tag)
    {
        _htmlTag = tag;
	createFirstPiece();
	_lastPiece ~= to!(char[])("</" ~ tag ~ ">");
    }
	
    this(string tag, string[string] attributes, string content)
    in
    {
        assert( (tag.length > 0), "Tag can't be empty" );
    }
        
    body{
        _htmlTag = tag;
	_lastPiece ~= "</" ~ _htmlTag ~ ">";
        _attributes = attributes;
	createFirstPiece();
        _content = content;
    }
    
    void createFirstPiece()
    {
        string result ="<" ~ _htmlTag ~ " ";
        foreach( key, value; _attributes ){
            result ~= key ~ "=" ~ value ~ " ";
	}
	result ~= ">";
	_firstPiece = to!(char[])(result);
    }
    
    @property void setAttributes(string[string] attributes)
    in
    {
        assert(attributes.length > 0 );
    }
    body
    {
        foreach( key, value; attributes ) {
	    _attributes[key] = value;
	}
    }
    
    @property setContent( string content )
    {
        _content = content;
    }
    
    void addSubElement( XmlElement[] subElements ... )
    {
	foreach(element; subElements) {
            _subElements ~= element;
	}
    }
    
    override string toString()
    {
	string result;
        result ~= _firstPiece;
	if(_subElements is null) {
	    result ~= _content ~ _lastPiece;
	} else {
	    foreach(element; _subElements) {
		result ~= element.toString();
	    }
	    result ~= _lastPiece;
        }
	return result;
    }
}

unittest
{
    auto newElement = new XmlElement("a");
    assert(newElement._firstPiece == "<a >");
    assert(newElement._lastPiece == "</a>");
    newElement.setAttributes(["href"], ["www.ddili.org"]);
    assert(newElement._firstPiece == "<a href=www.ddili.org >");
    assert(newElement._lastPiece == "</a>");
    newElement.setContent("Ddili.org");
    assert(newElement._firstPiece == "<a href=www.ddili.org >");
    assert(newElement._lastPiece == "</a>");
    assert(newElement._content == "Ddili.org");
    assert(newElement.toString() == "<a href=www.ddili.org >Ddili.org</a>");
    auto anotherElement = new XmlElement("Parent");
    auto SubElement_1 = new XmlElement("FirstSubElement");
    auto SubElement_2 = new XmlElement("SecondSubElement");
    anotherElement.addSubElement(SubElement_1, SubElement_2);
    assert(anotherElement.toString() == "<Parent ><FirstSubElement ></FirstSubElement><SecondSubElement ></SecondSubElement></Parent>");
}