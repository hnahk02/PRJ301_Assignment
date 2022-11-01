<%-- 
    Document   : login
    Created on : Oct 29, 2022, 8:10:59 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><span>FPT University Academic Portal</span></h1>
        <table>
            <tr>
                <td ><strong>FAP mobile app (myFAP) is ready at</strong></td>
            </tr>
            <tr>
                <td><a href="https://apps.apple.com/app/id1527723314">
                        <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store" /></a></td>
                <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                        <img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store" /></a></td>
            </tr>
        </table>
        <form action="login" method="POST">
            Username: <input type="text" value="${username}" name="username"><br>
            Password: <input type="password" value="${password}" name="password"><br>
            Remember me:<input type="checkbox" value="1" name="remember" >

            <input type="submit" value="Login">
            <p style="color:red;">${alert}</p>
        </form>z
    </body>
</html>
