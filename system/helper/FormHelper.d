module system.helper.formhelper;
import htmlhelper;
enum formMethod{ get, post };
enum inputType{ textField, passwordField, radioButton, checkBox, submitButton };	

class Input : XmlElement
{
    inputType _type;
    
    this(inputType type, string name)
    in
    {
	assert(name.length > 0);
    }
    body
    {
	super("input");
	_type = type;
	final switch( type) {
	    case inputType.textField: setAttributes(["type":"text"]); break;
	    case inputType.passwordField: setAttributes([ "type":"password"]); break;
	    case inputType.radioButton: setAttributes(["type":"radio"]); break;
	    case inputType.checkBox: setAttributes(["type":"checkbox"]); break;
	    case inputType.submitButton: setAttributes(["type":"submit"]); break;
	}
	setAttributes(["name":name]);
	if( type == inputType.submitButton ) {
	    setAttributes(["value":"submit"]);
	}
    }
    
    @property void setValue( string value )
    in
    {
	assert( (_type == inputType.radioButton) || (_type == inputType.checkBox) );
    }
    body
    {
	setAttributes(["value":value]);
    }
    
    @property void check( )
     in
    {
	assert( (_type == inputType.radioButton) || (_type == inputType.checkBox) );
    }
    body
    {
	setAttributes(["checked":"on"]);
    }
}

class HtmlForm : XmlElement
{
    this( formMethod method )
    {
        super("form");
        final switch( method )
        {
            case formMethod.get: setAttributes(["method":"GET"]); break;
            case formMethod.post: setAttributes(["method":"POST"]); break;
	}
    }
    
    @property setAction( string page )
    {
	setAttributes( ["action":page] );
    }
}