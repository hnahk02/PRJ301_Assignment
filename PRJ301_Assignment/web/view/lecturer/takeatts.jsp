<%-- 
    Document   : takeatts
    Created on : Oct 27, 2022, 11:11:36 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        Take attendance for Group: <span style="color: red">${requestScope.ses.group.gname}</span> <br/>
        Subject: <span style="color: blue">${requestScope.ses.group.subject.subname}</span> <br/>
        Room: <span style="text-decoration: underline">${requestScope.ses.room.rname}</span> <br/>
        Date: <span style="text-decoration: underline">${requestScope.ses.date} - ${requestScope.ses.timeslot.time_range}</span><br/>
        Attended: <span style="color: red;"> ${requestScope.ses.attanded?"Yes":"No"} </span>
        <br><br>
        <form action="takeattend" method ="POST">
            <input type="hidden" name="sesid" value="${param.sesid}">
            <table border="1px">
                  <tr class="table-row">
                    <td>No.</td>
                    <td>STUDENT ID</td>
                    <td>FULL NAME</td>
                    <td>TAKE ATTENDANCE</td>
                    <td>COMMENT</td>
                    <td>IMAGE</td>
                </tr>
                <c:forEach items="${requestScope.ses.attendances}" var="a" varStatus="loop">
                 <tr>
                    <td>${loop.index+1}</td>
                    <td>${a.student.id}
                    <input type="hidden" name="stdid" value="${a.student.id}"/>
                    </td>
                    <td>${a.student.name}</td>
                    <td>
                        <span style="color: red">Absent</span><input type="radio"
                               <c:if test="${!a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="absent" />
                       <span style="color: green">Present</span><input type="radio"
                               <c:if test="${a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="present" />
                    </td>
                    <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                    <td><img src="../img/student.png" alt="alt" style="width:150px;height:150px" /></td>
                </tr>   
                    
                </c:forEach>
                
                
            </table>
            <input class="btn" type="submit" value="Save"/>
            
        </form>
    </body>
    <style>
        .table-row{
             border-right: 1px solid #fff;
            text-align: center;
            padding: 2px;
            text-transform: uppercase;
            height: 23px;
            background-color: #6b90da;
            font-weight: normal;
            
        }
        
        .btn{
            text-align: center;
            background-color: blueviolet;
            color: white;
           align-self: center;
        }
        
    </style>
</html>
