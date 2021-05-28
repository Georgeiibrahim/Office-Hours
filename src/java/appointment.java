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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
@WebServlet(urlPatterns = {"/appointment"})
public class appointment extends HttpServlet {

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
          String email=request.getSession().getAttribute("studentEmail").toString();
            String Password=request.getParameter("password");
            int ID = Integer.parseInt(request.getParameter("officeHoursID"));
            ResultSet RS = null;
            PreparedStatement ps=null;
            String time="";
            int StudentID=0;
            int StaffID=0;
            boolean check=false;
            String Day="";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staff";
                String user = "root";
                String password = "";
                Connection Con = null;
                Statement Stmt = null; 
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                
                RS=Stmt.executeQuery("select *from officeHours where ID="+ID);
                {
                    if(RS.next())
                    {
                       time=RS.getString("time");
                       StaffID=RS.getInt("staffID");
                       Day=RS.getString("day");
                       
                     // RS=Stmt.executeQuery("select *from Student where StudentEmail="+email);
                      ps =Con.prepareStatement("select * from student where StudentEmail=?");
                      ps.setString(1, email);
                      RS=ps.executeQuery();
                       while(RS.next())
                       {
                           StudentID=RS.getInt("StudentID");
                       }
                       //out.print(StudentID);
                       DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
                       LocalDateTime now = LocalDateTime.now();
                      // out.print(Day);
                      // out.print(dtf.format(now));
                       
                       String line = "INSERT INTO appointment(officeHoursID,StaffID,StudentID,slot,Date,day)VALUES("
                            + "'" + ID + "',"
                            + "'" + StaffID + "',"
                            + "'" + StudentID + "',"
                            + "'" + time + "',"
                            + "'" + dtf.format(now) + "',"
                            + "'" + Day + "')";
                        int Rows = Stmt.executeUpdate(line);
                        
                       out.print("appointment is reserved successfully");
                        
                    }
                    else
                    {
                        out.print("this appointment isn't available");
                    }
                }  

                }catch(Exception e)
            {
                System.out.println(e);
            }
            
           RequestDispatcher rd=request.getRequestDispatcher("reserve.jsp");
            rd.include(request, response);
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
