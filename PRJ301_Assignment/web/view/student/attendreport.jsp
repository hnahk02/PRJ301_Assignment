<%-- 
    Document   : attendreport
    Created on : Oct 18, 2022, 11:38:26 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="model" class="model.Attendance"/>
<jsp:useBean id="utility" class="utility.DateTimeManipulate"/>
<jsp:useBean id="gDB" class="dal.GroupDBContext"/>
<jsp:useBean id="aDB" class="dal.AttandanceDBContext"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><span>FPT University Academic Portal</span>
        </h1>
        <table>
            <tr>
                <td><strong>FAP mobile app (myFAP) is ready at</strong></td>
            </tr>
            <tr>
                <td><a href="https://apps.apple.com/app/id1527723314">
                        <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store" /></a></td>
                <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                        <img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store" /></a></td>
            </tr>
        </table>
        <br>
        <c:if test="${sessionScope.account ne null}">

            <span><a href="../home">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span><br>
            <div  style="float: right; margin-right: 16px;">
                <a href="#"> 
                    <span class="label label-success">${sessionScope.account.displayname}</span></a> | <a href="../logout" class="label label-success">logout</a> |
                <span class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
            </div>
        </c:if>
        <br>
        View attendance for ${requestScope.student.name}

        <form action="attendreport" method="GET">
            <input type="hidden" name="username" value="${requestScope.username}">
            <input type="hidden" name="stdid" value="${requestScope.stdid}"/>
            <input type="hidden" name="term_id" value="${param.term_id}"/>
            <input type="hidden" name="gid" value="${param.gid}"/>

        </form>
            <br>
        <table  border="1px" > 
            <tr class="table-row">
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
                        <a href="viewAttendStudent?username=${sessionScope.account.username}&term_id=${te.term_id}&gid=${param.gid}" value="${te.term_id}" >${te.tname}</a><br>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items = "${requestScope.groups}" var="g">
                        <a href="viewAttendStudent?username=${sessionScope.account.username}&term_id=${param.term_id}&gid=${g.gid}" value="${g.gid}"> ${g.gname}</a><br>
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






        <h3> ABSENT : ${aDB.getAbsentSession(param.gid, requestScope.stdid)/gDB.getTotalSessionsofGroup(param.gid)*100.0}%   ABSENT SO FAR (${aDB.getAbsentSession(param.gid, requestScope.stdid)} ABSENT ON ${gDB.getTotalSessionsofGroup(param.gid)} TOTAL). </h3>


    </body>
    <style>
        .label-success {
            background-color: #5cb85c;
        }
        .label {
            display: inline;
            padding: 0.2em 0.6em 0.3em;
            font-size: 75%;
            font-weight: 700;
            line-height: 1;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: 0.25em;
        }
        
        .table-row{
            border-right: 1px solid #fff;
            text-align: center;
            padding: 2px;
            text-transform: uppercase;
            height: 23px;
            background-color: #6b90da;
            font-weight: normal;
            
        }
        
    </style>
</html>
