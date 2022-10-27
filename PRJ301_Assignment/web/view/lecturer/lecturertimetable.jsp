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

       
            Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.lname}"/>
         <form action="lecturertimetable" method="GET">
            <input type="hidden" name="lid" value="${param.lid}"/>

            <tr>
                <td>
                    From: <input type="date" name="from" value="${requestScope.from}"/>
                    To: <input type="date" name="to" value="${requestScope.to}"/>
                </td>
            </tr>
            <input type="submit" value="View"/>
        </form>
        
        <table border="1px">
            <tr>
                <td> </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}<br/>${utility.getDayNameofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.time_range}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${utility.compare(ses.date,d) eq 0 and (ses.timeslot.tid eq slot.tid)}">
                                    <a href="att?id=${ses.sesid}">${ses.group.gname}</a>
                                    <br/>
                                    at ${ses.room.rname}
                                    <c:if test="${ses.attanded}">
                                        (Attended)
                                    </c:if>
                                    <c:if test="${!ses.attanded}">
                                        (Not yet)
                                    </c:if>
                                </c:if>

                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>


    </body>
</html>
