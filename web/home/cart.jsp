<%-- 
    Document   : cart
    Created on : Jul 5, 2023, 11:26:35 AM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Cart Page</title>
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
            .cart_layout_box {
                background-color: white;
                padding: 2rem 3rem;
            }
            .close-icon {
                position: absolute;
                top: 1rem;
                right: 1rem;
                transition: background-color 0.3s, border-radius 0.3s;
                background-color: transparent;
                border: none;
                cursor: pointer;
                padding:4px
            }

            .close-icon:hover {
                background-color: #ccc;
                border-radius: 6px;
            }
        </style>
    </head>
    <body style="background-color: #f0f0f0">
        <c:set var="cartSize" value="${sessionScope.CART_SIZE}" />
        <%@include file="../components/navbar/navbar.jsp" %>
        <div class="shop-layout container pt-3 pb-4">
            <c:if test="${cartSize == 0}">
                <div class="d-flex flex-column align-items-center mt-5">
                    <h1>Your cart is empty.</h1>
                    <button
                        class="btn btn-success mt-2 px-4 py-2"
                        onclick="window.location.href = 'MainController?action=Home'"
                        style="border-radius: 0"
                        >
                        BUY SOMETHING
                    </button>
                </div>
            </c:if>
            <c:if test="${cartSize != 0}">
                <c:set var="total" value="0" />
                <div class="d-flex">
                    <div class="cart_layout_box" style="width: 60%;">
                        <div class="border-bottom pb-3">
                            <h3><strong>MY CART</strong></h3>
                        </div>
                        <c:forEach var="item" items="${sessionScope.CART.getCart().values()}">
                            <c:set var="total" value="${total + item.price*item.quantity}" />
                            <form class="d-flex align-items-center border-bottom"
                                  style="position: relative;padding-top:2rem;padding-bottom:2rem"
                                  action="MainController" method="POST">
                                <img src="${item.imageURL}" alt="product image" width="110" height="140"/>
                                <div class="ms-4">
                                    <div class="d-flex">
                                        <div style="width: 5rem">
                                            <h5><strong>${item.price}$</strong></h5>
                                            <p style="font-size: 16px">${item.name}</p>
                                        </div>
                                        <span>
                                            Quantity: 
                                            <input type="number" name="quantity" value="${item.quantity}"
                                                   min="1" style="width: 2rem" class="border"/>
                                        </span>
                                    </div>
                                    <input type="hidden" name="productID" value="${item.productID}" />
                                    <input type="hidden" name="name" value="${item.name}" />
                                    <input type="hidden" name="price" value="${item.price}" />
                                    <input type="hidden" name="quantity" value="${item.quantity}" />
                                    <input type="hidden" name="imageURL" value="${item.imageURL}" />
                                    <button class="d-flex align-items-center btn border mt-2"
                                            style="border-radius: 0" type="submit"
                                            name="action" value="UpdateItemCart">
                                        <img src="assets/icons/update.svg" width="16" height="16" />
                                        <span style="font-size: 15px" class="ms-1">Update</span>
                                    </button>
                                </div>
                                <a class="close-icon"
                                   href="MainController?action=RemoveItemCart&id=${item.productID}&quantity=${item.quantity}">
                                    <img src="assets/icons/close.svg" width="22" height="20" />
                                </a>
                            </form>
                        </c:forEach>
                        <div class="d-flex align-items-center justify-content-between mt-5" 
                             style="float: right; width: 13rem;">
                            <h5><strong>SUB-TOTAL</strong></h5>
                            <h5><strong>${total}$</strong></h5>
                        </div>
                    </div>
                    <div
                        class="cart_layout_box ms-3 "
                        style="width: 40%; max-height: 17rem"
                        >
                        <div class="border-bottom">
                            <h3><strong>Total</strong></h3>
                        </div>
                        <div class="mt-3 d-flex justify-content-between">
                            <h5><strong>Sub-total</strong></h5>
                            <p>${total}$</p>
                        </div>
                        <button
                            class="btn btn-success mt-3"
                            style="width: 100%; border-radius: 0"
                            onclick="window.location.href = 'MainController?action=Checkout'"
                            >
                            CHECKOUT
                        </button>
                        <button
                            class="btn btn-outline-danger mt-3"
                            style="width: 100%; border-radius: 0"
                            onclick="window.location.href = 'MainController?action=Home'"
                            >
                            BUY MORE
                        </button>
                    </div>
                </div>
            </c:if>
        </div>
        <script src="jquery-3.7.0.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
