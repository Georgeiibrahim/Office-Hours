<%-- 
    Document   : cancelSpecificDate
    Created on : Jan 15, 2021, 11:25:07 AM
    Author     : George
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = request.getSession().getAttribute("StaffEmail").toString();
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            PreparedStatement ps=null;
            int ID=0;
            //out.print(email);
             try {
                Class.forName("com.mysql.jdbc.Driver");
                     String url = "jdbc:mysql://localhost:3306/staff";
                    String user = "root";
                    String password = "";
                    Con = DriverManager.getConnection(url, user, password);
                    Stmt = Con.createStatement();
                     try {
                         
                      ps =Con.prepareStatement("select * from staff where StaffEmail=?");
                      ps.setString(1, email);
                      RS=ps.executeQuery();
                      if(RS.next())
                      {
                          ID=RS.getInt("StaffID");
                      }
                      //out.print(ID);
               RS=Stmt.executeQuery("select * from appointment where StaffID = " + ID);
                }catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        
          <table border="1">
            <tr>
                <th>Appointment ID</th> 
                <th>Office Hour ID</th> 
                <th>Staff ID</th>
                <th>Student ID</th>
                <th>slot</th>
                <th>Appointment Date</th>
                <th>Appointment Day</th>
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getInt("ID")%></td>
                <td><%=RS.getInt("officeHoursID")%></td>
                <td><%=RS.getInt("StaffID")%></td>
                <td><%=RS.getInt("StudentID")%></td>
                <td><%=RS.getString("slot")%></td>
                <td><%=RS.getString("Date")%></td>
                <td><%=RS.getString("day")%></td>
            </tr>
            <% }
}catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            %>
        </table>
        
        <form action="cancelDate">
            <p>Enter The Appointment Date</p>
            <input type="text" name="appointmentDate">
            <input type="submit" value="Cancel Specific Date">
        </form>
        
    </body>
</html>
