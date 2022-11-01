<%-- 
    Document   : viewgroup
    Created on : Nov 1, 2022, 7:53:11 PM
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


        <script>
            function back() {
                history.back();
            }
        </script>
        <button type="button" onclick="back()">Back</button>
        <form method="POST" action="viewattendreport">
            <input type="hidden" name="lid" value="${requestScope.lid}">
        </form>
        <span style="color: blue;"> ${requestScope.lecturer.lname} </span> in term 




        <c:forEach items = "${requestScope.term}" var="te">
            <a >${te.tname}</a><br>
        </c:forEach>

        <c:forEach items="${requestScope.groups}" var="group">
            ${group.gname}    <a href="viewListSessionGroup?gid=${group.gid}"  >Take attandance</a><br>

        </c:forEach>












    </body>
</html>
