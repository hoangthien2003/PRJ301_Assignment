/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.user.UserDTO;

/**
 *
 * @author hoang
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private static final String HOME = "Home";
    private static final String HOME_PAGE = "home/home.jsp";
    private static final String HOME_CONTROLLER = "HomeController";
    private static final String LOGIN = "Sign in";
    private static final String LOGIN_PAGE = "Login";
    private static final String LOGIN_PAGE_VIEW = "login/login.jsp";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SIGNUP = "Signup";
    private static final String SIGNUP_PAGE = "Register";
    private static final String SIGNUP_PAGE_VIEW = "signup/signup.jsp";
    private static final String SIGNUP_CONTROLLER = "SignupController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String ADD_CART = "Add to Cart";
    private static final String CART_CONTROLLER = "CartController";
    private static final String VIEW_CART = "ViewCart";
    private static final String VIEW_CART_PAGE = "home/cart.jsp";
    private static final String REMOVE_CART = "RemoveItemCart";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";
    private static final String UPDATE_CART = "UpdateItemCart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";
    private static final String PROFILE_VIEW = "ViewProfile";
    private static final String PROFILE_CONTROLLER = "ProfileController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_CONTROLLER;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOME_CONTROLLER;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGIN_PAGE.equals(action)) {
                url = LOGIN_PAGE_VIEW;
            } else if (SIGNUP.equals(action)) {
                url = SIGNUP_CONTROLLER;
            } else if (SIGNUP_PAGE.equals(action)) {
                url = SIGNUP_PAGE_VIEW;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (HOME.equals(action)) {
                url = HOME_CONTROLLER;
            } else if (ADD_CART.equals(action)) {
                url = CART_CONTROLLER;
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_PAGE;
            } else if (REMOVE_CART.equals(action)) {
                url = REMOVE_CART_CONTROLLER;
            } else if (UPDATE_CART.equals(action)) {
                url = UPDATE_CART_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (PROFILE_VIEW.equals(action)) {
                url = PROFILE_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
