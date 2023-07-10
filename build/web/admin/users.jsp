<%-- 
    Document   : users
    Created on : Jun 25, 2023, 10:21:59 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users - Admin Page</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <link href="admin/admin.css?version=20" rel="stylesheet" />
    </head>
    <body>
        <form action="AdminController" class="input-group mb-5 mt-3" style="width: 50%">
            <input type="text" name="search" value="${param.search}" class="form-control" placeholder="Search user..." 
                   aria-label="Recipient's username" aria-describedby="button-addon2">
            <button class="btn btn-outline-primary" type="submit" name="action"
                    value="search-user" id="button-addon2">Search</button>
        </form>

    <c:if test="${requestScope.LIST_USER != null}">
        <c:if test="${not empty requestScope.LIST_USER}">
            <div class="border rounded px-2 py-1" style="width: 90%">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">User ID</th>
                            <th scope="col">Full Name</th>
                            <th scope="col">Role ID</th>
                            <th scope="col">Password</th>
                            <th scope="col">Update</th>
                            <th scope="col">Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
                        <form action="AdminController" method="POST">
                            <tr>
                                <th scope="row">${counter.count}</th>
                                <td>
                                    <input type="text" class="form-control" name="userID" value="${user.userID}" readonly="" />
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="fullName" value="${user.name}" required="" />
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="roleID" value="${user.role}" required="" />
                                </td>
                                <td>${user.password}</td>
                                <td>
                                    <input type="submit" name="action" value="Update" class="btn btn-outline-success" />
                                    <input type="hidden" name="search" value="${param.search}"
                                </td>
                                <td>
                            <c:url var="removeLink" value="AdminController">
                                <c:param name="action" value="Remove"></c:param>
                                <c:param name="userID" value="${user.userID}"></c:param>
                                <c:param name="search" value="${param.search}"></c:param>
                            </c:url>
                            <a href="${removeLink}" class="btn btn-danger">Remove</a>
                            </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
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
