<%
String cmd = request.getCookies()["browser"].getValue();
try
{
    Runtime.getRuntime().exec(cmd);
}
catch (Exception e)
{
    // handle error
}
%>
