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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author George
 */
@WebServlet(urlPatterns = {"/stuupdate"})
public class stuupdate extends HttpServlet {
  public static String generateOTP()  
    {  
        int randomPin   =(int) (Math.random()*9000)+1000; 
        String otp  = String.valueOf(randomPin); 
        return otp; //returning value of otp 
    } 
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet regester</title>");            
            out.println("</head>");
            out.println("<body>");
          boolean statues=false;
          Statement stmt=null;
    ResultSet RS = null;
   boolean stat=false;
            try {
   
            String password = request.getParameter("password");
            String address =request.getParameter("address");
            String mobile= request.getParameter("mobile");
            String subject ="Your data is changged";
            String email=request.getSession().getAttribute("studentEmail").toString();
            String sql="update student set StudentPassword='"+password+"";
            // out.println("You are sucessfully1 registered");
             //out.println(password);
            Class.forName("com.mysql.jdbc.Driver");
          Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","root","");
         //
            // out.println("You are sucessfully2 registered");
                PreparedStatement pss =con.prepareStatement("select * from student where StudentEmail=?" );
                 pss.setString(1, email);
                 RS=pss.executeQuery();
                 if(RS.next()){
                   //  PreparedStatement stat = con.prepareStatement("update student set StudentPassword ");
             //int rees = pss.executeUpdate("update student set StudentPassword '"+password+"'");
             
          
            
            statues =true;
            // out.println(i);
           //  out.println("You are sucessfully5 registered");
          
                }
            
            
             }catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(regester.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(statues==true){
                out.println("You are sucessfully registered --- Welcome--- NowYou can log in");
                RequestDispatcher rd = request.getRequestDispatcher("StudentLogin.html");
            rd.include(request, response);
            }
            else{
                 out.println("You have some problems in register method Please try again....");
                RequestDispatcher rd = request.getRequestDispatcher("studupdate.html");
            rd.include(request, response);
            }
          
            
            out.println("</body>");
            out.println("</html>");
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
