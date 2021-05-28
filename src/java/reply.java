/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
@WebServlet(urlPatterns = {"/reply"})
public class reply extends HttpServlet {

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
            out.println("<title>Servlet reply</title>");            
            out.println("</head>");
            out.println("<body>");
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            int ID=Integer.parseInt(request.getParameter("msgto"));
            String message=request.getParameter("msg");

           
            String SecongEmail="";
            //String to = request.getParameter("email2");;
            //String content = request.getParameter("message");;
            String email=request.getSession().getAttribute("StaffEmail").toString();
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/staff";
                    String user = "root";
                    String password = "";
                    Con = DriverManager.getConnection(url, user, password);
                    Stmt = Con.createStatement();
                ////////////////////connection
                 RS=Stmt.executeQuery("select *from messages where ID="+ID);
                 {
                     if(RS.next())
                     {
                       SecongEmail=RS.getString("email1");
                     }
                     
                 }
                
                
                String line = "INSERT INTO messages(email1,email2,content)VALUES("
                        + "'" + email + "',"
                        + "'" + SecongEmail + "',"
                        + "'" + message + "')";
                int Rows = Stmt.executeUpdate(line);
                out.print("your message is sent successfully");
                
                RS.close();
                Stmt.close();
                Con.close();
                }catch(Exception e)
                {
                    System.out.println(e);
                }
            RequestDispatcher rd = request.getRequestDispatcher("staffreply.jsp");
            rd.include(request, response);
        
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
