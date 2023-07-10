<%-- 
    Document   : showUser
    Created on : Jul 10, 2023, 3:52:50 PM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
        crossorigin="anonymous"
        />
    <body>
        <c:set var="topUser" value="${requestScope.TOP_USER}" />
        <div class="d-flex flex-column align-items-center">
            <h1>TOP USER</h1>
            <p>UserID: ${TOP_USER.userID}</p>
            <p>FullName: ${TOP_USER.name}</p>
            <p>Role: ${TOP_USER.role}</p>
            <p>Password: ${TOP_USER.password}</p>
        </div>
    </body>
</html>
