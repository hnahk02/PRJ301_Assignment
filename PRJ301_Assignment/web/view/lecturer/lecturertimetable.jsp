<%-- 
    Document   : lecturertimetable.jsp
    Created on : Oct 26, 2022, 8:09:55 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="utility" class="utility.DateTimeManipulate"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
            <table  style="width:100%" border:1px solid black;>
                Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.lname}"/>
                <form action="timetable" method="GET">
                    <input type="hidden" name="lid" value="${param.lid}"/>
                    <tr>
                        <th>Year: </th>
                    </tr>
                    <tr>
                        <td>
                            From: <input type="date" name="from" value="${requestScope.from}"/>
                            To: <input type="date" name="to" value="${requestScope.to}"/>
                        </td>
                    </tr>
                    <input type="submit" value="View"/>

            </table>
           
       
    </body>
</html>
