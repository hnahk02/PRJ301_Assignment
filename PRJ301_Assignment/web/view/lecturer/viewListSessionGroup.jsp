<%-- 
    Document   : viewListSessionGroup
    Created on : Nov 1, 2022, 9:05:24 PM
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
        <form action="viewListSessionGroup" method="GET">
            <input type="hidden" name="gid" value="${param.gid}">
        </form>
        <br>
        <table border="1px">
            <tr class="table-row">
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
                        <c:if test="${utility.compareCurrentDate(ses.date) ne 0}">
                            &nbsp;&nbsp;<span style="color: red">Close</span>
                            
                        </c:if>
                        <c:if test="${utility.compareCurrentDate(ses.date) eq 0}">
                            <c:if test="${!ses.attanded}">
                                &nbsp;&nbsp; <a href="takeattend?sesid=${ses.sesid}">Take</a><br>
                            </c:if>
                            <c:if test="${ses.attanded}">
                                Taken &nbsp; <a href="takeattend?sesid=${ses.sesid}">Edit</a><br>
                            </c:if>
                                
                        </c:if>
                       
                    </td>

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
