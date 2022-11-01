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
            You are not logged in yet!!!
            Click <a href="login">here</a> to login&nbsp;&nbsp;&nbsp;
           
        </c:if>
        <c:if test="${sessionScope.account ne null}">
            <h4>Welcome <span style="color: green">${sessionScope.account.displayname}</span> to FAP  <a href="#"><span>Campus: FPTU - Hoa Lac</span></a> | <a href="logout"> <span>Logout</span></a> </h4>
            <c:if test="${sessionScope.account.classify_account eq 'lecturer'}">
                <p> You are ${sessionScope.account.classify_account}<p><br>
                <a href="lecturer/lecturertimetable?username=${sessionScope.account.username}">Timetable</a>
                <a href="lecturer/viewgroup?username=${sessionScope.account.username}">viewgroup</a>
                

            </c:if> 
                <c:if test="${sessionScope.account.classify_account eq 'student'}">
                You are ${sessionScope.account.classify_account}
            </c:if> 
         
        </c:if>
           
    </body>
</html>
