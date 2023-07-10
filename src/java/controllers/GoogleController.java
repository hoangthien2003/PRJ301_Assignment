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
import models.user.UserDAO;
import models.user.UserDTO;
import models.user.UserGoogle;
import utils.GoogleUtils;

/**
 *
 * @author hoang
 */
@WebServlet(name = "GoogleController", urlPatterns = {"/GoogleController"})
public class GoogleController extends HttpServlet {
    private static final String ERROR = "login/login.jsp";
    private static final String SUCCESS = "HomeController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            if (code != null || !code.isEmpty()) {
                String accessToken = GoogleUtils.getToken(code);
                UserGoogle userGoogle = GoogleUtils.getUserInfo(accessToken);
                UserDTO loginUser = new UserDTO(userGoogle.getId(), userGoogle.getName(), "US", "***");
                UserDAO userDAO = new UserDAO();
                boolean isExist = userDAO.checkExistUser(loginUser.getUserID());
                if (!isExist) {
                    userDAO.insert(loginUser.getUserID(), loginUser.getName(), 
                        loginUser.getRole(), loginUser.getPassword());
                }
                HttpSession session = request.getSession();
                session.setAttribute("IMAGE_GOOGLE", userGoogle.getPicture());
                session.setAttribute("LOGIN_USER", loginUser);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at GoogleController: " + e.toString());
        } finally {
            response.sendRedirect(url);
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
