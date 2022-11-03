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
        <form  action="weeklytimtable" method="POST">
            <input type="hidden" name="stdid" value="${requestScope.stdid}"/>
            <input type="hidden" name="username" value="${requestScope.username}"
                   <tr>
            <td>
                From: <input  type="date" name="from" value="${requestScope.from}"/>
                To: <input  type="date" name="to" value="${requestScope.to}"/>
            </td>
        </tr>
        <input class="btn" type="submit" value="View"/>
    </form>

    <table border="1px">
        <tr>
            <td class="day">YEAR: <select>
                    <option>2022</option>
                    <option>2023</option>
                    <option>2024</option>
                </select> </td>
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
                        <b>Mọi góp ý, thắc mắc xin liên hệ: </b><span style="color: rgb(34, 34, 34);
                                                                      font-family: arial, sans-serif;
                                                                      font-size: 13.333333969116211px;
                                                                      font-style: normal; font-variant: normal;
                                                                      font-weight: normal; letter-spacing: normal;
                                                                      line-height: normal;
                                                                      text-align: start; text-indent: 0px; text-transform: none; white-space: normal;
                                                                      ">Phòng dịch vụ sinh viên</span>: Email: <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                        Điện thoại: <span class="style1"
                                          style="color: rgb(34, 34, 34); font-family: arial,
                                          sans-serif; font-size: 13.333333969116211px;
                                          font-style: normal; font-variant: normal;
                                          text-indent: 0px; text-transform: none;
                                          white-space: normal; ; word-spacing: 0px;
                                          background-color: rgb(255, 255, 255); ">(024)7308.13.13 </span>
                        <br/>

                    </div>
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


                        .day{
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
