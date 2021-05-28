    <%-- 
    Document   : Student
    Created on : Jan 9, 2021, 3:43:43 PM
    Author     : lenovo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .topnav {
               overflow: hidden;
               padding: 1% ; 
               border-bottom: inset #BDBDBD 2px ;
               padding-top: 0.2cm; 
               padding-right: 2cm; 
        } 
        .topnav a { 
            float: right; 
            color: #EAEDF0; 
            font-family: Sans-serif;
            text-align: left; 
            padding: 15px 20px; 
            text-decoration: none; 
            font-size: 17px;
        } 
        .topnav a:hover{ 
            color: lightgrey; 
        } 
         .topnav a.active { 
             color: white; 
         } 
         body{
              background-image: url("login-background.png");
              background-size: 100%;
         }
         
        </style>
        
    </head>
    <body>
                   <div class="topnav"> 
                <a href="welcome.html">Logout</a>
                <a href="message.jsp">Message staff member</a>
                <a href="cancel.jsp">Cancel a meeting</a>
                <a href="reserve.jsp">Reserve an appointment</a>
                <a href="findOfficeHours.jsp">View the office hours</a>
                <a href="findContact.jsp">Find the contact</a>
                <a href="findStaff.jsp">Find staff</a>
                   <a href="studupdate.html">update profile</a>
                
            </div>
        <%
             String email=request.getSession().getAttribute("studentEmail").toString();
            try{
               Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staff";
                String user = "root";
                String password = "";
                Connection Con = null;
                Statement Stmt = null;
                
                Con = DriverManager.getConnection(url, user, password);
                   }catch(Exception e)
                {
                    System.out.println(e);
                }
            %>
    </body>
</html>
