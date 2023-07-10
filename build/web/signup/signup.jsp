<%-- 
    Document   : signup
    Created on : Jun 22, 2023, 11:18:43 PM
    Author     : hoang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Signup Page</title>
        <link href="signup/signup.css?version=31" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER != null}">
            <c:redirect url="MainController"></c:redirect>
        </c:if>
        <c:set var="userError" value="${requestScope.USER_ERROR}" />
        <div class="card_layout" style="position: relative">
            <div
                style="position: absolute; left: 0; padding: 1rem; cursor: pointer"
                onclick="window.location.href = 'MainController?action=Login'"
                >
                <img src="assets/icons/arrow-left.png" width="20" height="20" />
            </div>
            <div class="card_login_form">
                <div
                    style="
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    align-items: center;
                    height: 18rem;
                    "
                    >
                    <h3 style="font-weight: 600; font-size: 22px">New to Tien's Farm?</h3>
                    <form
                        id="signUpForm"
                        action="MainController"
                        method="POST"
                        style="width: 100%; margin-top: 2rem"
                        >
                        <div class="card_input_layout">
                            <label class="card_label">UserID<span class="validate-hint">Required length must be in [3,10]</span></label>
                            <label id="userIDBorder" class="card_input_border"
                                   style="${userError.userIDError != null ? 'border: solid 1px red' : null}">
                                <input
                                    id="userIDInput"
                                    type="text"
                                    name="userID"
                                    placeholder="Enter userID"
                                    class="card_input_field"
                                    required=""
                                    />
                            </label>
                            <c:if test="${userError.userIDError != null}">
                                <span id="userIDHintError" 
                                      class="validate-error">
                                    ${userError.userIDError}
                                </span>
                            </c:if>
                        </div>
                        <div class="card_input_layout">
                            <label class="card_label">Full Name</label>
                            <label id="fullNameBorder" class="card_input_border"
                                   style="${userError.fullNameError != null ? 'border: solid 1px red' : null}">
                                <input
                                    id="fullNameInput"
                                    type="text"
                                    name="fullName"
                                    placeholder="Enter your fullname"
                                    class="card_input_field"
                                    required=""
                                    />
                            </label>
                            <c:if test="${userError.fullNameError != null}">
                                <span id="fullNameHintError" 
                                      class="validate-error">
                                    ${userError.fullNameError}
                                </span>
                            </c:if>
                        </div>
                        <div class="card_input_layout">
                            <label class="card_label">Password<span class="validate-hint">Required lower case, number, at least 6 letter</span></label>
                            <label id="passwordBorder" class="card_input_border"
                                   style="${userError.passwordError != null ? 'border: solid 1px red' : null}">
                                <input
                                    id="passwordInput"
                                    type="password"
                                    name="password"
                                    placeholder="Enter password"
                                    class="card_input_field"
                                    required=""
                                    />
                            </label>
                            <c:if test="${userError.passwordError != null}">
                                <span id="passwordHintError" 
                                      class="validate-error">
                                    ${userError.passwordError}
                                </span>
                            </c:if>
                        </div>
                        <div class="card_input_layout">
                            <label class="card_label">Confirm Password</label>
                            <label id="confirmBorder" class="card_input_border"
                                   style="${userError.confirmError != null ? 'border: solid 1px red' : null}">
                                <input
                                    id="confirmInput"
                                    type="password"
                                    name="confirm"
                                    placeholder="Retype password"
                                    class="card_input_field"
                                    required=""
                                    />
                            </label>
                            <c:if test="${userError.confirmError != null}">
                                <span id="confirmHintError" 
                                      class="validate-error">
                                    ${userError.confirmError}
                                </span>
                            </c:if>
                        </div>
                        <input
                            type="submit"
                            name="action"
                            value="Signup"
                            class="card_button_submit"
                            />
                    </form>
                    <div
                        style="
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin-top: 1.6rem;
                        "
                        >
                        <span style="font-size: 13px">Already have an account?</span>
                        <a href="MainController?action=Login" class="signup-link" style="font-size: 13px"
                           >Login now</a
                        >
                    </div>
                </div>
            </div>
            <img
                src="assets/images/milktea_signup.jpg"
                height="570"
                width="580"
                style="object-fit: cover; border-radius: 0px 16px 16px 0px"
                />
        </div>
        <script src="jquery-3.7.0.min.js"></script>
        <script src="signup/signup.js?version=1"></script>
    </body>
</html>
