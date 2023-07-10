<%-- 
    Document   : admin
    Created on : Jun 25, 2023, 1:47:58 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <link href="admin/admin.css" rel="stylesheet" >
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role ne 'AD'}">
            <c:redirect url="MainController"></c:redirect>
        </c:if>
        <c:set var="action" value="${param.action}" />
        <c:set var="index" value="${param.index}" />
        <%@include file="../components/navbar/navbar.jsp" %>
        <div class="d-flex flex-column align-items-center pt-3">
            <h1 style="font-weight: bold">Admin World</h1>
            <c:choose>
                <c:when test="${action == 'Users' || action == 'search-user' || (action == null && index == null) 
                                || action == 'Update' || action == 'Sign in' || action == 'Remove'}">
                    <%@include file="./users.jsp" %>
                </c:when>
                <c:when test="${action == 'Products' || index != null}">
                    <%@include file="../components/product/product.jsp" %>
                </c:when>
            </c:choose>
        </div>
    </body>
    <script src="jquery-3.7.0.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"
    ></script>
</html>
