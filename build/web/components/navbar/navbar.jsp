<%-- Document : navbar Created on : Jun 20, 2023, 2:26:27 AM Author : hoang --%>
<%@page import="models.shopping.ProductDTO"%>
<%@page import="models.shopping.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="components/navbar/navbar.css?version=20" rel="stylesheet" />
    </head>
    <body>
        <nav
            class="navbar navbar-expand-lg border-bottom fixed-top d-flex justify-content-between pe-5"
            style="background-color: white"
            >
            <a href="#" class="navbar-brand" style="padding: 0.6rem 3.2rem 0.4rem 3.2rem">
                <h3 style="font-weight: bold; font-size: 24px">Tien's Farm</h3>
            </a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <c:if test="${sessionScope.LOGIN_USER.role == 'AD' && param.action != 'ViewProfile'}">
                        <li class="nav-item">
                            <a id="users-nav" class="${sessionScope.USER_NAV_STYLE}"
                               href="AdminController?action=Users">Users</a>
                        </li>
                        <li class="nav-item">
                            <a id="products-nav" class="${sessionScope.PROD_NAV_STYLE}" 
                               href="AdminController?action=Products">Products</a>
                        </li>
                    </c:if>
                    <c:if test="${param.action == 'ViewProfile'}">
                        <li class="nav-item">
                            <a id="home-nav" class="nav-link"
                               href="AdminController">Back to Home</a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="d-flex align-items-center">
                <div id="profile" class="d-flex align-items-center nav-icon nav-right"
                     style="cursor: pointer" data-toggle="tooltip" data-placement="bottom" title="Profile"">
                    <img src="assets/icons/user.svg" alt="user icon" width="16" height="16" class="me-2"/>
                    <c:if test="${sessionScope.LOGIN_USER == null}">
                        <div class="d-flex"
                             style="font-weight: bold;color: #23A6F0;font-size: 14px;user-select:none;">
                            <a href="MainController?action=Login" class="nav-auth">Login</a>
                            /
                            <a href="MainController?action=Register" class="nav-auth">Register</a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null && sessionScope.LOGIN_USER.role ne 'AD'}">
                        <div class="d-flex" style="font-weight: bold;color: #23A6F0;font-size: 14px;user-select:none"
                             onclick="window.location.href = 'MainController?action=ViewProfile'">
                            <span>Hi, ${sessionScope.LOGIN_USER.name}</span>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null && sessionScope.LOGIN_USER.role == 'AD'}">
                        <div class="d-flex" style="font-weight: bold;color: #23A6F0;font-size: 14px;user-select:none">
                            <span>Hi, ${sessionScope.LOGIN_USER.name}</span>
                        </div>
                    </c:if>
                </div>
                <c:if test="${sessionScope.LOGIN_USER.role == 'US' || sessionScope.LOGIN_USER.role == null}">
                    <div id="cart" class="d-flex align-items-center nav-icon nav-icon-pointer nav-right px-2 py-2"
                         data-toggle="tooltip" data-placement="bottom" title="Cart"
                         onclick="window.location.href = 'MainController?action=ViewCart'">
                        <img src="assets/icons/cart.svg" />
                        <span style="color: #23A6F0;font-size: 13px;margin-left: 5px">${sessionScope.CART_SIZE}</span>
                    </div>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <div id="logout" class="d-flex align-items-center nav-icon nav-icon-pointer nav-right px-2 py-2"
                         onclick="location.href = 'MainController?action=Logout'"
                         data-toggle="tooltip" data-placement="bottom" title="Logout">
                        <img src="assets/icons/logout.png" width="18" height="18" />
                    </div>
                </c:if>
            </div>
        </nav>
    </body>
    <script src="jquery-3.7.0.min.js"></script>
    <script src="components/navbar/navbar.js?version=1"></script>
</html>
