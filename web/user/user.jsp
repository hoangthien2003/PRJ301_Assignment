<%-- 
    Document   : user
    Created on : Jul 8, 2023, 2:43:11 AM
    Author     : hoang
--%>
<%@page import="models.user.UserGoogle"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <c:if test="${sessionScope.LOGIN_USER.role ne 'US'}">
            <script>
                window.history.back();
            </script>
        </c:if>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap");
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Roboto", sans-serif;
            }
        </style>
    </head>
    <body>
        <%@include file="../components/navbar/navbar.jsp" %>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <div class="d-flex flex-column align-items-center pt-5">
            <h2>User Profile</h2>
            <div class="d-flex align-items-center mt-3">
                <%
                    String imageGoogle = (String) session.getAttribute("IMAGE_GOOGLE");
                    if (imageGoogle == null) {%>
                <img src="assets/images/user.png" />
                <%
                } else {%>
                <img src="https://lh3.googleusercontent.com/a/AAcHTte10RxX7HIYqacNt_mr_fY9WzVLA94JrzV5WExBUT5XCg=s96-c" class="rounded-circle"/><%
                    }
                %>
                <div class="ms-4">
                    <p>UserID: ${loginUser.userID}</p>
                    <p>Name: ${loginUser.name}</p
                </div>
            </div>
        </div>
    </body>
</html>
