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
        <c:if test="${sessionScope.account eq null}">
            You are not logged in yet!!!
            Click <a href="login">here</a> to login&nbsp;&nbsp;&nbsp;

        </c:if>


        <c:if test="${sessionScope.account ne null}">
            
            <c:if test="${sessionScope.account.classify_account eq 'lecturer'}">
                <div  style="float: right; margin-right: 16px;">
                    <a href="#"> 
                        <span class="label label-success">${sessionScope.account.displayname}</span></a> | <a href="logout" class="label label-success">logout</a> |
                    <span class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                </div><br><br><br>
                <h1> Activities</h1>
                        <a  href="lecturer/lecturertimetable?username=${sessionScope.account.username}">View Lecturer Timetable</a><br><br><br>
                        <a  href="lecturer/viewattendreport?username=${sessionScope.account.username}&term_id=0&gid=0">View attendance report of group</a><br><br><br>
                        <a  href="lecturer/viewgroup?username=${sessionScope.account.username}">View group attandance</a><br>


            </c:if> 
            <c:if test="${sessionScope.account.classify_account eq 'student'}">
                <div  style="float: right; margin-right: 16px;">
                    <a href="#"> 
                        <span class="label label-success">${sessionScope.account.displayname}</span></a> | <a href="logout" class="label label-success">logout</a> |
                    <span class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                </div><br><br><br>
                <h1> Activities</h1>
                <a  href="student/weeklytimtable?username=${sessionScope.account.username}">View Weekly Timetable</a><br><br><br>
                <a  href="report/viewAttendStudent?username=${sessionScope.account.username}&term_id=0&gid=0">View attendance report</a>

            </c:if> 

        </c:if>

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
        .link{
            
            padding-top: 100px;
        }
        
       

        a:hover {
            text-decoration: red;
        }

      
        

    </style>
</html>
