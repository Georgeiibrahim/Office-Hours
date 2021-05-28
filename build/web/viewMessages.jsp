<%-- 
    Document   : viewMessages
    Created on : Jan 14, 2021, 11:53:59 AM
    Author     : George
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
           </style>
    </head>
    
     <body>
        <h2>Your messages</h2>
        <% 
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            PreparedStatement ps = null;
            String email=request.getSession().getAttribute("studentEmail").toString();
             try {
                String url = "jdbc:mysql://localhost:3306/staff";
                String user = "root";
                String password = "";
                Con = DriverManager.getConnection(url, user, password);

                Stmt = Con.createStatement();
                
                ps =Con.prepareStatement("select * from messages where email2=? OR email1=?");
                      ps.setString(1, email);
                      ps.setString(2, email);
                      RS=ps.executeQuery();
             
          %>
          
           <table border="1">
            <tr id="header">
                <th>Sent From</th> 
                <th>Sent to</th> 
                <th>Content</th> 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("email1")%></td>
                <td><%=RS.getString("email2")%></td>
                <td><%=RS.getString("content")%></td>
            </tr>
            <% }
}catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            %>
        </table>
        <br><br>
            <form action="message.jsp">
                <input type="submit" value="back">
            </form>
    </body>
    
</html>
