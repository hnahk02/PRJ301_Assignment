<%-- 
    Document   : home
    Created on : Oct 30, 2022, 10:05:21 PM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:if test="${sessionScope.account eq null}">
            <a href="login">Login</a>&nbsp;&nbsp;&nbsp;
        </c:if>
        <c:if test="${sessionScope.account ne null}">
            Hello ${sessionScope.account.displayname} 
            <a href="logout">log out</a> 
        </c:if>
    </body>
</html>
