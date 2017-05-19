<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
        <c:when test="${username != null}">
           welcome &nbsp; ${username} 
        </c:when>
        <c:otherwise>
           wrong !! username and password
        </c:otherwise>
       </c:choose>
    </body>
</html>
