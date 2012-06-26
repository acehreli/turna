/*
 * This module is for the Environment Variables.
 *
 * */
module library.envVar;

import library.fixedString;
import std.process;
import std.cstream;
import std.conv;
import std.uri;
import library.fixedString;

/*
 * This module is for the get method.
 *
 * */

string[string] get()
{
    string[string] resultGet;
    string get = getenv("QUERY_STRING");

    resultGet = forGetAndPost(get); //fixedString.forGetAndPost

    return resultGet;
}


string[string] post()
{
    string[string] resultPost;
    int lengthOfPost = to!int(contentLength);
    char[] firstPost;
	firstPost.length = lengthOfPost;
	int counter;
    while (counter < lengthOfPost) {
        firstPost[counter] = din.getc;
		++counter;
    }

    resultPost = forGetAndPost(to!(string)(firstPost));

    return resultPost;
}

string serverSoftware()
{
    return decode(getenv("SERVER_SOFTWARE"));
}

string serverName()
{
    return decode(getenv("SERVER_NAME"));
}

string gatewayInterface()
{
    return decode(getenv("GATEWAY_INTERFACE"));
}

string serverProtocol()
{
    return decode(getenv("SERVER_PROTOCOL"));
}

string serverPort()
{
    return decode(getenv("SERVER_PORT"));
}

string requestMethod()
{
    return decode(getenv("REQUEST_METHOD"));
}

string pathInfo()
{
    return decode(getenv("PATH_INFO"));
}

string pathTranslated()
{
    return decode(getenv("PATH_TRANSLATED"));
}

string scriptName()
{
    return decode(getenv("SCRIPT_NAME"));
}

string remoteHost()
{
    return decode(getenv("REMOTE_HOST"));
}

string remoteAddr()
{
    return decode(getenv("REMOTE_ADDR"));
}

string authType()
{
    return decode(getenv("AUTH_TYPE"));
}

string remoteUser()
{
    return decode(getenv("REMOTE_USER"));
}

string remoteIdent()
{
    return decode(getenv("REMOTE_IDENT"));
}

string contentType()
{
    return decode(getenv("CONTENT_TYPE"));
}

string contentLength()
{
    return decode(getenv("CONTENT_LENGTH"));
}

string httpAccept()
{
    return decode(getenv("HTTP_ACCEPT"));
}

string httpUserAgent()
{
    return decode(getenv("HTTP_USER_AGENT"));
}
