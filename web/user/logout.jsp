<%-- 
    Document   : logout
    Created on : Apr 21, 2017, 10:58:42 PM
    Author     : DellKaLu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            session.removeAttribute("username");
        %>
        <jsp:forward page="../login.jsp"/> 
    </body>
</html>
