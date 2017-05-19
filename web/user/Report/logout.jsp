<%-- 
    Document   : logout
    Created on : May 2, 2017, 8:29:40 PM
    Author     : PEEPO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Logout</h1>
        <% 
            request.removeAttribute("username");
        %>
    </body>
</html>
