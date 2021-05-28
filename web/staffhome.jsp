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
                   <div class="topnav"> 
                <a href="messagestaff.html">Message staff member</a>
                <a href="messagestud.html">Message studnet member</a>
                <a href="staffreply.jsp">Messges and reply</a>
                <a href="cancelReservations.html">Cancel a meeting</a>
                <a href="viewHistory.jsp">view history of Reservations</a>
                <a href="viewReservation.jsp">View specific office hours</a>
                <a href="staffsearchinput.html">Find contact of Student</a>
                <a href="manage.jsp">Manage</a>
                 <a href="signupstaff.html">register a new stuff</a>  
                 <a href="welcome.html">Logout</a>
            </div>
        <%
             String email=request.getSession().getAttribute("StaffEmail").toString();
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
