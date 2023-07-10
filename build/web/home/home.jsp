<%-- Document : home Created on : Jun 18, 2023, 6:34:38 PM Author : hoang --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Tien's Farm - HomePage</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <link href="home/home.css?version=31" rel="stylesheet" />
    </head>
    <body>
        <%@include file="../components/navbar/navbar.jsp" %>
        <div class="shop-layout">
            <h1 class="mt-3" style="text-align: center;user-select: none">Shop Page</h1>
            <%@include file="../components/product/product.jsp" %>
        </div>
        <script src="jquery-3.7.0.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"
        ></script>
        <script src="home/home.js?version=1"></script>
    </body>
</html>
