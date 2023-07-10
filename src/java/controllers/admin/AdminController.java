/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hoang
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {
    private static final String USER = "Users";
    private static final String USER_CONTROLLER = "UsersController";
    private static final String UPDATE_USER = "Update";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";
    private static final String REMOVE_USER = "Remove";
    private static final String REMOVE_USER_CONTROLLER = "RemoveUserController";
    private static final String PRODUCTS = "Products";
    private static final String PRODUCTS_CONTROLLER = "ProductsController";
    private static final String UPDATE_PRODUCT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String REMOVE_PRODUCT = "RemoveProduct";
    private static final String REMOVE_PRODUCT_CONTROLLER = "RemoveProductController";
    private static final String ADD_PRODUCT_CONTROLLER = "AddProductController";
    private static final String ADD_PRODUCT = "AddProduct";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = USER_CONTROLLER;
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            if (action == null || "Sign in".equals(action) || USER.equals(action)) {
                url = USER_CONTROLLER;
                session.setAttribute("USER_NAV_STYLE", "nav-link active");
                session.setAttribute("PROD_NAV_STYLE", "nav-link");
            } else if ("search-user".equals(action)) {
                url = USER_CONTROLLER;
            } else if (UPDATE_USER.equals(action)) {
                url = UPDATE_USER_CONTROLLER;
            } else if (REMOVE_USER.equals(action)) {
                url = REMOVE_USER_CONTROLLER;
            } else if (PRODUCTS.equals(action)) {
                session.setAttribute("USER_NAV_STYLE", "nav-link");
                session.setAttribute("PROD_NAV_STYLE", "nav-link active");
                url = PRODUCTS_CONTROLLER;
            } else if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            } else if (REMOVE_PRODUCT.equals(action)) {
                url = REMOVE_PRODUCT_CONTROLLER;
            } else if (ADD_PRODUCT.equals(action)) {
                url = ADD_PRODUCT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at AdminController: " + e.toString());
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
