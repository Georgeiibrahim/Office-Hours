<%-- 
    Document   : findOfficeHours
    Created on : Jan 12, 2021, 7:38:55 AM
    Author     : lenovo
--%>

<%@page import="java.sql.DriverManager"%>
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
            p{
                color:white;
            }
            </style>
    </head>
    <body>
        <h2>the Staff members</h2>
        <% 
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            String email=request.getSession().getAttribute("studentEmail").toString();
             try {
                String url = "jdbc:mysql://localhost:3306/staff";
                String user = "root";
                String password = "";
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                
                RS=Stmt.executeQuery("select * from staff2");
                
                }catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
             
          %>
          
           <table border="1">
            <tr>
                <th>Staff ID</th> 
                <th>Staff Name</th> 
                <th>Staff Type</th> 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getInt("StaffID")%></td>
                <td><%=RS.getString("StaffName")%></td>
                <td><%=RS.getString("type")%></td>
            </tr>
            <%}%>
        </table>
       
            <form action="staffmember.jsp">
                <p>Enter the staff ID</p>
                <input type="text" name="id">
                <input type="submit">
            </form>
        <a href="Student.jsp">Back To Home Page</a>
    </body>
</html>
