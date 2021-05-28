<%-- 
    Document   : staffhome
    Created on : Jan 11, 2021, 9:47:12 PM
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
            
            </style>
    </head>
    <body>  
       <%

            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            PreparedStatement ps=null;
            String email = request.getSession().getAttribute("StaffEmail").toString();
            int StudentID = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                     String url = "jdbc:mysql://localhost:3306/staff";
                    String user = "root";
                    String password = "";
                    Con = DriverManager.getConnection(url, user, password);
                    Stmt = Con.createStatement();
                try {
                    
                    //String query = "select * from messages where email2 = " + email;
                    //ps = Con.prepareStatement(query);
                    //RS = ps.executeQuery();
                    ps = Con.prepareStatement("select * from messages where email2 =?");
                    ps.setString(1,email);
                    RS = ps.executeQuery();
                } catch (Exception e) {
                    System.out.println(e);
                }      
        %>
        <br><br>
        <table border="1">
            <tr id="header">
                <th>ID of this message is</th>
                <th>Sent From</th> 
                <th>Sent to</th> 
                <th>Content</th> 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getInt("ID")%></td>
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
        <form action="reply">
            <label>Enter the ID of message that want to reply</label><br>
            <input type="text"name="msgto" required><br>
            <label>Your reply</label><br>
            <input type="text" name="msg"required><br>   
            <br>
             <input type="submit" value="Reply">
             <br>
       <br>
        </form>
        <a href="staffhome.jsp">Back To Home</a>
    </body>
</html>
