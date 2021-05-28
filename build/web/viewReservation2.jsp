<%-- 
    Document   : viewReservation2
    Created on : Jan 15, 2021, 8:44:55 PM
    Author     : George
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body 
            {
                background-image: url("login-background.png");
                background-repeat: no-repeat;
                background-size: 100%;
                opacity: 0.9;
                filter: alpha(opacity=40);
                font-family: Arial, Helvetica, sans-serif;
           
            }
            table
            {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
                color: white;
            }
            #header
            {
                background-color: #4CAF50;
            }
            h2
            {
                color: white;
            }
            </style>
    </head>
    <body>
       <%
            Statement Stmt = null;
            ResultSet RS = null;
            PreparedStatement ps = null;
            Connection Con = null;
            int ID = Integer.parseInt(request.getParameter("id"));
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staff";
                String user = "root";
                String password = "";
                Con = DriverManager.getConnection(url, user, password);
                try {
                    ps = Con.prepareStatement("select * from appointment where officeHoursID = ?");
                    ps.setInt(1, ID);
                    RS = ps.executeQuery();
                } catch (Exception e) {
                    System.out.println(e);
                }      
        %>
        <br><br>
        <table border="1">
            <tr id="header">
                <th>The ID of Office Hours is</th>
                <th>The ID of Staff Member</th> 
                <th>The ID of Student</th> 
                <th>The Range Time</th> 
            </tr>
            <%
                while (RS.next()) { %>
            <tr>
                <td><%=RS.getInt("officeHoursID")%></td>
                <td><%=RS.getInt("StaffID")%></td>
                <td><%=RS.getInt("StudentID")%></td>
                <td><%=RS.getString("slot")%></td>
            </tr>
            <% }
            }catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            %>
        </table>
        <br>
        <form action="viewReservation.jsp">
            <input type="submit" value="Back">
        </form>
    </body>
</html>
    </body>
</html>
