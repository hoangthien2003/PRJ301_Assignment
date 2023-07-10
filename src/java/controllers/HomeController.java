/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.shopping.ProductDAO;
import models.shopping.ProductDTO;

/**
 *
 * @author hoang
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {
    private static final String ERROR = "home/home.jsp";
    private static final String SUCCESS = "home/home.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            List<ProductDTO> listProduct = new ArrayList<>();
            ProductDAO prodDAO = new ProductDAO();
            for (ProductDTO item : prodDAO.getListProduct()) {
                listProduct.add(item);
            }
            HttpSession session = request.getSession();
            session.setAttribute("LIST_PRODUCT", listProduct);
            if (session.getAttribute("CART_SIZE") == null) 
                session.setAttribute("CART_SIZE", 0);
            String indexPage = request.getParameter("index");
            if(indexPage == null){
                indexPage = "1";
            }
            int index =Integer.parseInt(indexPage);
            int count = prodDAO.getCountProduct();
            int lastPage = count/5;
            if(count % 5 != 0){
                lastPage++;
            }
            List<ProductDTO> listPadding = prodDAO.paddingProduct(index);
            session.setAttribute("LIST_PADDING", listPadding);
            session.setAttribute("LAST_PAGE", lastPage);
            session.setAttribute("tag", index);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at HomeController: " + e.toString());
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
