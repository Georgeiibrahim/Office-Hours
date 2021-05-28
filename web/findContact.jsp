<%-- 
    Document   : findContact
    Created on : Jan 10, 2021, 1:40:15 PM
    Author     : lenovo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("com.mysql.jdbc.Driver").newInstance();%>

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
                margin-left: 50%;
            }
            </style>
        
    </head>
    <body>
        
       
        
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
        
        <form action="SpecificContact.jsp" method="post">
                                     
           <table border="0">
            <tr>
            <br>
            <th align="right">Enter The Staff Member ID: </th>
            <td><input type="text" name="ID"></td>
            </tr>
            </table>
   
        </form>
        <a href="Student.jsp">Back to Home Page</a>
            
    </body>
</html>
