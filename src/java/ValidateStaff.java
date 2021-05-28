/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
@WebServlet(urlPatterns = {"/ValidateStaff"})
public class ValidateStaff extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           boolean check=true;
            String email=request.getParameter("email");
            String Password=request.getParameter("password");
            ResultSet RS = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staff";
                String user = "root";
                String password = "";
                Connection Con = null;
                Statement Stmt = null;
                
                Con = DriverManager.getConnection(url, user, password);
                
                PreparedStatement ps =Con.prepareStatement("select * from staff2 where StaffEmail=? and StaffPassword=?");
                ps.setString(1, email);
                ps.setString(2,Password);
                RS=ps.executeQuery();
             
                if (RS.next()) {

				HttpSession session = request.getSession(true);
				session.setAttribute("StaffEmail", email);
				response.sendRedirect("staffhome.jsp");
                               /* RequestDispatcher rd=request.getRequestDispatcher("customerhome.jsp");  
                                 rd.forward(request,response); */
			}

			else {
				out.println("your data is invalid");
				//response.sendRedirect("index.html"); // error page*/
                                RequestDispatcher rd=request.getRequestDispatcher("StaffLogin.html");
                                //System.out.println("your data is invalid");
                                rd.include(request, response);
			}
			RS.close();
			Stmt.close();
			Con.close();

                 }catch(Exception e)
            {
                System.out.println(e);
            }
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
