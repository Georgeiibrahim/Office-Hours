<%-- 
    Document   : delete
    Created on : Jan 15, 2021, 1:12:16 PM
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
            label
            {
                color:white;
            }
            a{
                color:white;
                position:absolute;
                badding :20px;
            }
            </style>
    </head>
    <body>
       <h2>The Office Hours Of Staff Member</h2>
        <% 
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            PreparedStatement ps = null;
            int staffID = 0 ;
            String email = request.getSession().getAttribute("StaffEmail").toString();
             try {
                String url = "jdbc:mysql://localhost:3301/staff";
                String user = "root";
                String password = "root";
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                ps = Con.prepareStatement("select * from Staff where StaffEmail=?");
                        ps.setString(1, email);
                        RS = ps.executeQuery();
                        while (RS.next()) {
                            staffID = RS.getInt("StaffID");
                        } 
                    ps = Con.prepareStatement("select * from officeHours where staffID = ?");
                    ps.setInt(1,staffID);
                    RS = ps.executeQuery();
                
             
          %>
          
           <table border="1">
            <tr>
                <th>The Office Hour ID</th> 
                <th>Staff ID</th> 
                <th>Day</th> 
                <th>Time</th> 
                <th>Status</th> 
                <th>Location</th> 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getInt("ID")%></td>
                <td><%=RS.getInt("staffID")%></td>
                <td><%=RS.getString("day")%></td>
                <td><%=RS.getString("time")%></td>
                <td><%=RS.getString("status")%></td>
                <td><%=RS.getString("location")%></td>
            </tr>
            <% }
                }catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            %>
        </table>
        <br>
        <form action="delete">
            <label>Enter The ID of Row</label><br>
            <input type="text" name="id"><br>
            <input type="submit" >
        </form>
        <br>
        <form action="manage.jsp">
            <input type="submit" value="Back">
        </form>
    </body>
</html>
