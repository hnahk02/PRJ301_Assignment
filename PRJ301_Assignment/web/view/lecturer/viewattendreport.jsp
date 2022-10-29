<%-- 
    Document   : viewattendreport
    Created on : Oct 28, 2022, 10:13:55 PM
    Author     : Acer
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="GET" action="viewattendreport">
            <input type="hidden" name="lid" value="${param.lid}">
            <input type="hidden" name="term_id" value="${param.term_id}"/>
            <input type="hidden" name="gid" value="${param.gid}">


        </form>
        View attendance report for group <span style="color: red;"> ${requestScope.g.gname} </span> of lecturer <span style="color: blue;"> ${requestScope.lecturer.lname} </span> in term <span style="color: green;"> ${requestScope.t.tname} </span>

        <table border="1px" > 
            <tr>

                <td>TERM</td>
                <td>COURSE</td>
                <td>NO.</td>
                <td>STUDENT ID</td>
                <td>STUDENT NAME</td>
                <td>IMAGE</td>
                <td>Attendance Report</td>

            </tr>

            <tr>
                <td>
                    <c:forEach items = "${requestScope.term}" var="te">
                        <a href="viewattendreport?lid=${param.lid}&term_id=${te.term_id}&gid=${param.gid}" value="${te.term_id}" >${te.tname}</a><br>
                    </c:forEach>
                </td>

                <td>
                    <c:forEach items = "${requestScope.groups}" var="g">
                        <a href="viewattendreport?lid=${param.lid}&term_id=${param.term_id}&gid=${g.gid}" value="${g.gid}"> ${g.gname}</a><br>
                    </c:forEach>
                </td>


                <c:forEach items = "${requestScope.stds}" var="s" >

                <tr>

                    <td></td>
                    <td></td>
                    <td>1</td>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td> </td>
                    <td><a href="/PRJ301_Assignment/report/viewAttendStudent?stdid=${s.id}&term_id=${param.term_id}&gid=${param.gid}""> click here to see</a><br></td>



                </tr>
            </c:forEach>




        </table>


    </body>
</html>
