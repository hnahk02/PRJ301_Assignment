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
        </table><br>

        <c:if test="${sessionScope.account ne null}">

            <span><a href="../home">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span><br>
            <div  style="float: right; margin-right: 16px;">
                <a href="#"> 
                    <span class="label label-success">${sessionScope.account.displayname}</span></a> | <a href="../logout" class="label label-success">logout</a> |
                <span class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
            </div><br>
        </c:if>
        <div class="form">
            Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.lname}"/>
            <form action="lecturertimetable" method="POST">
                <input type="hidden" name="username" value="${requestScope.username}">
                <input type="hidden" name="lid" value="${requestScope.lid}"/>

                <tr>
                    <td>
                        From: <input class ="date" type="date" name="from" value="${requestScope.from}"/>
                        To: <input class ="date" type="date" name="to" value="${requestScope.to}"/>
                    </td>
                </tr>
                <input class="btn" type="submit" value="View"/>
            </form>
        </div>
        <table border="1px" class="timetable">
            <tr>
                <td class="day"> YEAR:<select><option value="value">2022</option></select></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td class="day">${d}<br/>${utility.getDayNameofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.time_range}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${utility.compare(ses.date,d) eq 0 and (ses.timeslot.tid eq slot.tid)}">
                                    <a href="takeattend?sesid=${ses.sesid}">${ses.group.gname}</a>
                                    <br/>
                                    at ${ses.room.rname}
                                    <c:if test="${ses.attanded}">
                                        <span style="color: green">(Attended)</span>
                                    </c:if>
                                    <c:if test="${!ses.attanded}">
                                        <span style="color: red">(Not yet)</span>
                                    </c:if>
                                </c:if>

                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>


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

        .form{
            text-align: center;
        }
        .date{
            color: blue;
        }
        .btn{
            background-color: #f0ad4e;
        }

        .day{
            border-right: 1px solid #fff;
            text-align: center;
            padding: 2px;
            text-transform: uppercase;
            height: 23px;
            background-color: #6b90da;
            font-weight: normal;
        }
        
        .timetable{
            position: absolute;
            left:10%;
            
        }

    </style>
</html>
