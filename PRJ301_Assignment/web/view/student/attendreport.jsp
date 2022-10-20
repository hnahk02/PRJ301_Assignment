<%-- 
    Document   : attendreport
    Created on : Oct 18, 2022, 11:38:26 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="model" class="model.Attendance"/>
<jsp:useBean id="utility" class="utility.DateTimeManipulate"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        View attendance for ${requestScope.student.name}

        <form action="attendreport" method="GET">
            <input type="hidden" name="stdid" value="${param.stdid}"/>
            <input type="hidden" name="term_id" value="${param.term_id}"/>
            <input type="hidden" name="gid" value="${param.gid}"/>

        </form>

        <table border="1px" > 
            <tr>
                <td>TERM</td>
                <td>COURSE</td>
                <td>NO</td>
                <td>DATE</td>
                <td>SLOT</td>
                <td>ROOM</td>
                <td>LECTURER</td>
                <td>GROUP NAME</td>
                <td>ATTENDANCE STATUS</td>
                <td>LECTURER'S COMMENT</td>

            </tr>

            <tr>
                <td>
                    <c:forEach items = "${requestScope.term}" var="te">
                        <a href="viewAttendStudent?stdid=${param.stdid}&term_id=${te.term_id}&gid=${param.gid}" value="${te.term_id}" >${te.tname}</a><br>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items = "${requestScope.groups}" var="g">
                        <a href="viewAttendStudent?stdid=${param.stdid}&term_id=${param.term_id}&gid=${g.gid}" value="${g.gid}"> ${g.gname}</a><br>
                    </c:forEach>
                </td>

                <c:forEach items = "${requestScope.sessions}" var="ses">

                <tr>
                    <td></td>
                    <td></td>
                    <td>${ses.index}</td>
                    <td>${ses.date}<br/>${utility.getDayNameofWeek(ses.date)}</td>
                    <td>${ses.timeslot.time_range}</td>
                    <td>${ses.room.rname}</td>
                    <td>${ses.lecturer.lname}</td>
                    <td>${ses.group.gname}</td>
                    <c:forEach items = "${requestScope.atts}" var="atts">
                        <c:if test="${ses.sesid eq atts.session.sesid}">
                            <td>${model.getAttendanceStatus(atts.present, atts.session)}</td>
                            <td>${atts.description}</td>
                        </c:if>
                    </c:forEach>

                </tr>
            </c:forEach>
            



        </table>
                <c:forEach items="${requestScope.atts}" var="atts">
           
                <td>ABSENT: ${model.calAttendPercent(atts.present, atts.session)}% <td>
                
                </c:forEach>
                    ABSENT : 
                    

    </body>
</html>
