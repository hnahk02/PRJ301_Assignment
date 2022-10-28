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
        Take attendance for Group: ${requestScope.ses.group.gname} <br/>
        Subject: ${requestScope.ses.group.subject.subname} <br/>
        Room: ${requestScope.ses.room.rname} <br/>
        Date: ${requestScope.ses.date} - ${requestScope.ses.timeslot.time_range}<br/>
        Attended: <span style="color: red;"> ${requestScope.ses.attanded?"Yes":"No"} </span>
        <form action="takeattend" method ="POST">
            <input type="hidden" name="sesid" value="${param.sesid}">
            <table border="1px">
                  <tr>
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
                        Absent<input type="radio"
                               <c:if test="${!a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="absent" />
                        Present<input type="radio"
                               <c:if test="${a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="present" />
                    </td>
                    <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                </tr>   
                    
                </c:forEach>
                
                
            </table>
            <input type="submit" value="Save"/>
            
        </form>
    </body>
</html>
