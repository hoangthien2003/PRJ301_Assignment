<%-- 
    Document   : products
    Created on : Jun 20, 2023, 2:50:49 AM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:if test="${sessionScope.LOGIN_USER.role == 'AD'}">
            <title>Products - Admin Page</title>
        </c:if>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <link href="home/home.css?version=31" rel="stylesheet" />
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.LOGIN_USER.role ne 'AD' && sessionScope.LIST_PRODUCT == null}">
                <c:redirect url="HomeController" />
            </c:when>
        </c:choose>
        <c:if test="${sessionScope.LOGIN_USER.role == 'AD'}">
            <h3>Product List</h3>
            <button type='button' class="btn btn-outline-danger addProductBtn" 
                    data-bs-target="#addProductModal" data-bs-toggle="modal">
                Add
            </button>
            <!-- Modal -->
            <%@include file="./modal.jsp" %>
        </c:if>
        <div class='container mt-4'>
            <div class="row row-cols-md-5 row-cols-sm-6 row-cols-xs-12 g-4 d-flex">
                <c:forEach items="${sessionScope.LIST_PADDING}" var="item">
                    <div class="col">
                        <div class="card" style="height: 100%" aria-hidden="true">
                            <c:if test="${sessionScope.LOGIN_USER.role ne 'AD'}">
                                <form id="form_product_us"
                                      action="MainController"
                                      method="POST">
                                    <input type="hidden" name="id" value="${item.productID}" />
                                    <input type="hidden" name="imageURL" value="${item.imageURL}" />
                                    <div class="card-img-container">
                                        <img src="${item.imageURL}" class="card-img-top border-bottom" alt="..." style="height: 320px" />
                                        <button type="submit" name="action" value="Add to Cart" class="cart-icon"
                                                onclick="submitFormUS()"
                                                style="border: none">
                                            <img src="assets/icons/cart_black.svg" alt="cart icon"/>
                                        </button>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center" style="height: 70px">
                                            <h5 class="card-title">${item.name}</h5>
                                            <input type="hidden" name="name" value="${item.name}" />
                                            <input type="number" name="quantity" min="1" value="1" style="width: 30px; height: 30px;" />
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex justify-content-between" style="width: 100%">
                                                <p>Price:</p>
                                                <strong>${item.price}$</strong>
                                                <input type="hidden" name="price" value="${item.price}" />
                                            </div>
                                        </div>
                                        <input type="hidden" name="index" value="${tag}" />
                                        <input type="submit" name="action" value="Add to Cart" 
                                               class="btn btn-danger" style="width: 100%"/>
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER.role == 'AD'}">
                                <div class="card-img-container">
                                    <img src="${item.imageURL}" class="card-img-top border-bottom" alt="..." style="height: 280px" />
                                    <button class="cart-icon editProductBtn" data-bs-target="#editProductModal" data-bs-toggle="modal"
                                            data-productid="${item.productID}" data-imageurl="${item.imageURL}" data-name="${item.name}"
                                            data-price="${item.price}" data-quantity="${item.quantity}"
                                            style="border: none">
                                        <img src="assets/icons/edit.svg" alt="cart icon" height="20" width='20'/>
                                    </button>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center" style="height: 70px">
                                        <h5 class="card-title">${item.name}</h5>
                                    </div>
                                    <div class="d-flex flex-column justify-content-start">
                                        <span class="d-flex justify-content-between">Price: <span class="fw-bold">${item.price}$</span></span>
                                        <span class="d-flex justify-content-between">Quantity: <span class="fw-bold">${item.quantity}</span></span>
                                        <div class="d-flex justify-content-between mt-2">
                                            <button type='button' class="btn btn-success editProductBtn" 
                                                    data-bs-target="#editProductModal" data-bs-toggle="modal"
                                                    data-productid="${item.productID}" data-imageurl="${item.imageURL}" data-name="${item.name}"
                                                    data-price="${item.price}" data-quantity="${item.quantity}">
                                                Edit
                                            </button>
                                            <button type="submit" class="btn btn-outline-danger"
                                                    onclick="window.location.href = 'AdminController?action=RemoveProduct&productID=${item.productID}'"
                                                    >
                                                Remove
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="clearfix d-flex mt-5" style="float: right; margin-right: 10rem">
                <c:choose>
                    <c:when test="${sessionScope.LOGIN_USER.role == 'AD'}">
                        <ul class="pagination ms-5">
                            <c:if test="${tag != 1}">
                                <li class="page-item"><a href="ProductsController?index=${tag - 1}" class="page-link">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${LAST_PAGE}" var="i">
                                <li class="page-item ${tag == i?"active":""}"><a href="ProductsController?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                                <c:if test="${tag != LAST_PAGE}">
                                <li class="page-item"><a href="ProductsController?index=${tag + 1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="pagination ms-5">
                            <c:if test="${tag != 1}">
                                <li class="page-item"><a href="HomeController?index=${tag - 1}" class="page-link">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${LAST_PAGE}" var="i">
                                <li class="page-item ${tag == i?"active":""}"><a href="HomeController?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                                <c:if test="${tag != LAST_PAGE}">
                                <li class="page-item"><a href="HomeController?index=${tag + 1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="toastFail" class="toast bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto">Status Failed</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <p>${requestScope.ERROR}</p>
                </div>
            </div>
        </div>
    </body>
    <script src="jquery-3.7.0.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"
    ></script>
    <script>
                                                        // Lắng nghe sự kiện nhấp vào nút "Edit"
                                                        document.querySelectorAll('.editProductBtn').forEach(btn => {
                                                            btn.addEventListener('click', () => {
                                                                // Lấy thông tin từ thuộc tính data của nút "Edit"
                                                                const productID = btn.dataset.productid;
                                                                const imageUrl = btn.dataset.imageurl;
                                                                const name = btn.dataset.name;
                                                                const price = btn.dataset.price;
                                                                const quantity = btn.dataset.quantity;

                                                                // Đưa thông tin vào modal
                                                                document.getElementById('editID').value = productID;
                                                                document.getElementById('editImage').value = imageUrl;
                                                                document.getElementById('editName').value = name;
                                                                document.getElementById('editPrice').value = price;
                                                                document.getElementById('editQuantity').value = quantity;
                                                            });
                                                        });
                                                        function submitFormUS() {
                                                            document.getElementById('form_product_us').submit()
                                                        }
                                                        const toastFail = document.getElementById('toastFail')
                                                        const error = '${requestScope.ERROR}'
                                                        if (error) {
                                                            console.log(0)
                                                            const toastBootstrapFail = bootstrap.Toast.getOrCreateInstance(toastFail)
                                                            toastBootstrapFail.show()
                                                        }
    </script>
</html>
