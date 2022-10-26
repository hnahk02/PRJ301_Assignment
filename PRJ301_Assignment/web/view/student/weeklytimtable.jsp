<%-- 
    Document   : weeklytimtable
    Created on : Oct 26, 2022, 9:52:56 AM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="utility" class="utility.DateTimeManipulate"/>
<jsp:useBean id="model" class="model.Attendance"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Activities for ${requestScope.student.name}</h2>
        <p>
            <b>Note</b>: These activities do not include extra-curriculum activities, such as
            club activities ...
        </p>
        <p>
            <b>Chú thích</b>: Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa,
            ví dụ như hoạt động câu lạc bộ ...
        </p>
        <div >
            <p>
                Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br />
                Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br />
                Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br />
                Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br/>
                Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br/>
                Little UK (LUK) thuộc tầng 5 tòa nhà Delta
            </p>
        </div>
        <form action="weeklytimtable" method="GET">
            <input type="hidden" name="stdid" value="${param.stdid}"/>

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
                <td>YEAR: <select>
                        <option>2022</option>
                        <option>2023</option>
                        <option>2024</option>
                    </select> </td>
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
                                    <a href="att?id=${ses.sesid}">${ses.group.subject.subname}</a>-<a href='https://flm.fpt.edu.vn/DefaultSignin' >View Materials</a><br/> 

                                    at ${ses.room.rname}<br/>
                                    (<c:forEach items = "${requestScope.atts}" var="atts">
                                        <c:if test="${ses.sesid eq atts.session.sesid}">
                                            ${model.getAttendanceStatusWeeklyTimtable(atts.present, atts.session)}
                                        </c:if>
                                    </c:forEach>)
                                    <a href='#' >Meet URL</a>

                                </c:if>
                                    

                            </c:forEach>
                                                -
                        </td>
                    </c:forEach>
                </tr>
                
            </c:forEach>
        </table>
        <p>
            <b>More note / Chú thích thêm</b>:
        </p>
        <div ><ul><li>(<font color='green'>attended</font>): ${requestScope.student.name} had attended this activity / ${requestScope.student.name} đã tham gia hoạt động này</li>
                <li>(<font color='red'>absent</font>): ${requestScope.student.name} had NOT attended this activity / ${requestScope.student.name} đã vắng mặt buổi này</li>   
                <li>(-): no data was given / chưa có dữ liệu</li> </ul></div>
        <p>
        </p>


    </div>
</td>
</tr>
<tr style="border-bottom: 0 none">
    <td>
        <br />

        <table width="100%" style="border: 1px solid transparent;" >

            <tr>
                <td>
                    <div>
                        <br />
                        <b>Mọi góp ý, thắc mắc xin liên hệ: </b><span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>: Email: <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                        Điện thoại: <span class="style1"
                                          style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(024)7308.13.13 </span>
                        <br />

                    </div>
                    </body>
                    </html>
