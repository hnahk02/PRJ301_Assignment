<%-- 
    Document   : viewattendreport
    Created on : Oct 28, 2022, 10:13:55 PM
    Author     : Acer
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </table><br>

        <c:if test="${sessionScope.account ne null}">

            <span><a href="../home">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span><br>
            <div  style="float: right; margin-right: 16px;">
                <a href="#"> 
                    <span class="label label-success">${sessionScope.account.displayname}</span></a> | <a href="../logout" class="label label-success">logout</a> |
                <span class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
            </div>
        </c:if>
        <form method="POST" action="viewattendreport">

            <input type="hidden" name="username" value="${requestScope.username}">
            <input type="hidden" name="lid" value="${requestScope.lid}">
            <input type="hidden" name="term_id" value="${param.term_id}"/>
            <input type="hidden" name="gid" value="${param.gid}">


        </form><br>
        View attendance report for group <span style="color: red;"> ${requestScope.g.gname} </span> of lecturer <span style="color: blue;"> ${requestScope.lecturer.lname} </span> in term <span style="color: green;"> ${requestScope.t.tname} </span>
        <br>
        <table class="table" border="1px" > 
            <tr class="table-row">

                <td>TERM</td>
                <td>COURSE</td>
                <td>NO.</td>
                <td>STUDENT ID</td>
                <td>STUDENT NAME</td>
                <td>IMAGE</td>
                <td>ABSENT PERCENT</td>
                <td>FINAL EXAM</td>

            </tr>

            <tr>
                <td>
                    <c:forEach items = "${requestScope.term}" var="te">
                        <a href="viewattendreport?username=${sessionScope.account.username}&term_id=${te.term_id}&gid=${param.gid}" value="${te.term_id}" >${te.tname}</a><br>
                    </c:forEach>
                </td>

                <td>
                    <c:forEach items = "${requestScope.groups}" var="g">
                        <a href="viewattendreport?username=${sessionScope.account.username}&term_id=${param.term_id}&gid=${g.gid}" value="${g.gid}"> ${g.gname}</a><br>
                    </c:forEach>
                </td>


                <c:forEach items = "${requestScope.stds}" var="s" varStatus="loop" >

                <tr>

                    <td></td>
                    <td></td>
                    <td>${loop.index+1}</td>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td><img src="../img/student.png" alt="Student image" style="width:150px;height:150px";/></td>
                    <td>${aDB.getAbsentSession(param.gid, s.id)/gDB.getTotalSessionsofGroup(param.gid)*100.0}%</td>
                    <td>

                        <c:if test="${(aDB.getAbsentSession(param.gid, s.id)/gDB.getTotalSessionsofGroup(param.gid))*100.0 gt 20 }" >
                            <span style="color: red">NOT ALLOWED</span>
                        </c:if>
                        <c:if test="${(aDB.getAbsentSession(param.gid, s.id)/gDB.getTotalSessionsofGroup(param.gid))*100.0 le 20 }" >
                            <span style="color: green">ALLOWED</span>
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
        
        .table{
            justify-content: center;
            text-align: center;
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
