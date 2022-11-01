<%-- 
    Document   : viewListSessionGroup
    Created on : Nov 1, 2022, 9:05:24 PM
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
        <form action="viewListSessionGroup" method="GET">
            <input type="hidden" name="gid" value="${param.gid}">
        </form>
        <table border="1px">
            <tr>
                <td>NO</td>
                <td>SLOT</td>
                <td>DATE</td>
                <td>Group</td>
                <td>Status</td>

            </tr>

            <c:forEach items="${requestScope.sessions}" var="ses">
                <tr> 
                    <td> ${ses.index}</td>
                    <td> ${ses.timeslot.time_range}</td>
                    <td> ${ses.date}</td>
                    <td> ${ses.group.gname}</td>
                    <td> 
                        <c:if test="${ses.attanded}">
                            Taken  &nbsp;<a href="takeattend?sesid=${ses.sesid}">Edit</a><br>
                        </c:if>
                        <c:if test="${!ses.attanded}">
                           &nbsp;&nbsp;&nbsp; <a href="takeattend?sesid=${ses.sesid}">Take</a><br>
                        </c:if>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </body>
</html>
