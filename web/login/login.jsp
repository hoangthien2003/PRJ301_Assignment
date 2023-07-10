<%-- Document : login Created on : Jun 18, 2023, 6:34:44 PM Author : hoang --%>
<%@page import="models.shopping.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Login Page</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            crossorigin="anonymous"
            />
        <link href="login/login.css?version=20" rel="stylesheet" type="text/css" />
        <script src="https://www.google.com/recaptcha/enterprise.js?render=6Ld1swMnAAAAAL9YNFKZb9ZohzmTUWj8dAj3AG1o"></script>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER != null}">
            <c:redirect url="MainController"></c:redirect>
        </c:if>
        <c:set var="error" value="${requestScope.ERROR}" />
        <div class="card_layout" style="height: 40rem">
            <img
                src="assets/images/milktea_login.jpg"
                width="580"
                style="object-fit: cover; border-radius: 16px 0px 0px 16px"
                />
            <div class="card_login_form">
                <div
                    style="
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    align-items: center;
                    "
                    >
                    <h3 style="font-weight: 600; font-size: 22px">
                        Welcome back to Tien's Farm
                    </h3>
                    <c:if test="${error != null}">
                        <span id="spanError" style="color: red; font-size: 12px">${error}</span>
                    </c:if>
                    <form
                        action="LoginController"
                        method="POST"
                        style="width: 100%; margin-top: 1.6rem"
                        id="form"
                        >
                        <div class="card_input_layout">
                            <label class="card_label">UserID</label>
                            <label id="borderUserID" class="card_input_border">
                                <input
                                    type="text"
                                    id="inputUserID"
                                    name="userID"
                                    placeholder="Enter userID"
                                    class="card_input_field"
                                    required=""
                                    />
                            </label>
                        </div>
                        <div class="card_input_layout" style="margin-bottom: 0.5rem">
                            <label class="card_label">Password</label>
                            <label id="borderPassword" class="card_input_border">
                                <input
                                    type="password"
                                    id="inputPassword"
                                    name="password"
                                    placeholder="Enter password"
                                    class="card_input_field"
                                    required=""
                                    />
                            </label>
                        </div>
                        <div class="g-recaptcha" data-sitekey="6LcDRgQnAAAAAJUHaSo5TrivZwiPZ7Wt7UNf4UEm"></div>
                        <input
                            type="submit"
                            name="action"
                            value="Sign in"
                            class="card_button_submit"
                            />
                        <div class="horizontal_line"></div>
                    </form>
                    <div class="card_button_google"
                         onclick="location.href = 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PRJ301_Assignment/GoogleController&response_type=code&client_id=195040962966-6eojg7tobgttnj5ptt279u2v0a41hilu.apps.googleusercontent.com&approval_prompt=force'">
                        <img
                            src="assets/icons/google.svg"
                            alt="google icon"
                            height="20"
                            width="20"
                            />
                        <span style="font-size: 13px; margin-left: 10px"
                              >Or sign in with Google</span
                        >
                    </div>
                    <div
                        style="
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin-top: 1.6rem;
                        "
                        >
                        <span style="font-size: 13px">Don't have an account?</span>
                        <a href="MainController?action=Signup" class="signup-link" style="font-size: 13px">Sign up now</a>
                    </div>
                    <a href="MainController?action=Home" class="signup-link mt-3" style="font-size: 13px">Back to Tien's farm</a>
                    <a href="MainController?action=ShowUser">Show Top 1 User</a>
                </div>
            </div>
        </div>
        <script src="login/login.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
                             const $ = document.querySelector.bind(document);
                             const form = $("#form");
                             form.addEventListener("submit", (event) => {
                                 const res = grecaptcha.getResponse();
                                 if (res) {
                                     window.open(MainController);
                                 } else {
                                     event.preventDefault();
                                 }
                             })
        </script>
    </body>
</html>
