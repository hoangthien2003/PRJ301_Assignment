<%-- 
    Document   : checkout
    Created on : Jul 6, 2023, 10:51:02 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
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
        </style>
    </head>
    <body style="background-color: #f0f0f0">
        <%@include file="../components/navbar/navbar.jsp" %>
        <c:if test="${requestScope.MESSAGE_SUCCESS == null && requestScope.ERROR == null}">
            <div class="shop-layout container pt-3 pb-4">
                <c:set var="total" value="0" />
                <form action="MainController" method="POST">
                    <div class="d-flex">
                        <div class="cart_layout_box" style="width: 60%;max-height: 27rem">
                            <div class="border-bottom pb-3">
                                <h3><strong>DELIVERY INFORMATION</strong></h3>
                            </div>
                            <c:choose>
                                <c:when test="${sessionScope.LOGIN_USER == null}">
                                    <div class="pt-3 pb-3">
                                        <div class="mb-4">
                                            <label for="basic-url" class="form-label">Name<span style="color: red" class="ms-1">*</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4"
                                                       style="height: 2.5rem;font-size: 16px" name="name" required="">
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <label for="basic-url" class="form-label">Phone Number<span style="color: red" class="ms-1">*</span></label>
                                            <div class="input-group">
                                                <input type="tel" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4"
                                                       style="height: 2.5rem;font-size: 16px" name="phone-number" required=""
                                                       pattern="[0-9]{10}" maxlength="10">
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <label for="basic-url" class="form-label">Address<span style="color: red" class="ms-1">*</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4"
                                                       style="height: 2.5rem;font-size: 16px" name="address" required="">
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
                                    <div class="pt-3 pb-3">
                                        <div class="mb-4">
                                            <label for="basic-url" class="form-label">Name<span style="color: red" class="ms-1">*</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4"
                                                       style="height: 2.5rem;font-size: 16px" name="name" value="${loginUser.name}" required="">
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <label for="basic-url" class="form-label">Phone Number<span style="color: red" class="ms-1">*</span></label>
                                            <div class="input-group">
                                                <input type="tel" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4"
                                                       style="height: 2.5rem;font-size: 16px" name="phone-number" required=""
                                                       pattern="[0-9]{10}" maxlength="10">
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <label for="basic-url" class="form-label">Address<span style="color: red" class="ms-1">*</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4"
                                                       style="height: 2.5rem;font-size: 16px" name="address" required="">
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div
                            class="cart_layout_box ms-3 "
                            style="width: 40%;"
                            >
                            <div class="border-bottom pb-3">
                                <h3><strong>ORDER SUMMARY</strong></h3>
                            </div>
                            <c:forEach var="item" items="${sessionScope.CART.getCart().values()}">
                                <c:set var="total" value="${total + item.price*item.quantity}" />
                                <form action="MainController" method="POST">
                                    <div class="d-flex align-items-center border-bottom"
                                         style="padding-top:2rem;padding-bottom:2rem">
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
                                    </div>
                                </form>
                            </c:forEach>
                            <div class="d-flex align-items-center justify-content-between mt-5" 
                                 style="width: 100%;">
                                <h5>TOTAL</h5>
                                <h5><strong>${total}$</strong></h5>
                            </div>
                            <input type="hidden" name="total" value="${total}" />
                            <button
                                class="btn btn-outline-danger mt-3"
                                style="width: 100%; border-radius: 0"
                                type="submit" name="action" value="Checkout"
                                >
                                CONFIRM ORDER
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </c:if>
        <c:if test="${requestScope.MESSAGE_SUCCESS != null}">
            <div class="d-flex flex-column mt-4 align-items-center"
                 style="width: 100%">
                <h2>Checkout Successfully!</h2>
                <p>Your orderID: ${requestScope.ORDER_ID}</p>
                <button
                    class="btn btn-success mt-4 px-4 py-2"
                    onclick="window.location.href = 'MainController?action=Home'"
                    style="border-radius: 0;width: 14rem;
                    height: 3.5rem;"
                    >
                    BUY MORE
                </button>
            </div>
        </c:if>
        <c:if test="${requestScope.ERROR != null}">
            <div class="d-flex flex-column mt-4 align-items-center">
                <h2>Checkout ERROR!</h2>
                <p>${requestScope.ERROR}</p>
                <button
                    class="btn btn-danger mt-2 px-4 py-2"
                    onclick="window.location.href = 'MainController?action=ViewCart'"
                    style="border-radius: 0;width: 14rem;
                    height: 3.5rem;"
                    >
                    CHECK AGAIN
                </button>
            </div>
        </c:if>
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="toastSuccess" class="toast bg-success" role="status" aria-live="polite" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Checkout Success</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <p>${requestScope.MESSAGE_SUCCESS}</p>
                </div>
            </div>
        </div>
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="toastFail" class="toast bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Checkout Failed</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <p>${requestScope.ERROR}</p>
                </div>
            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"
        ></script>
        <script>
                        const toastSuccess = document.getElementById('toastSuccess')
                        const toastFail = document.getElementById('toastFail')
                        const message = '${requestScope.MESSAGE_SUCCESS}'
                        const error = '${requestScope.ERROR}'
                        if (message) {
                            console.log(1)
                            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastSuccess)
                            toastBootstrap.show()
                        }
                        if (error) {
                            console.log(0)
                            const toastBootstrapFail = bootstrap.Toast.getOrCreateInstance(toastFail)
                            toastBootstrapFail.show()
                        }
        </script>
    </body>
</html>
