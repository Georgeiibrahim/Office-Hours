<%-- 
    Document   : manage
    Created on : Jan 15, 2021, 11:31:56 AM
    Author     : George
--%>

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
        <h2>Manage office hours slots</h2>
        <a href="create.html">Create An Office Hour Slot</a><br>
        <br>
        <a href="read.jsp">Read From Office Hours</a><br>
        <br>
        <a href="update.html">Update To Office Hour</a><br>
        <br>
        <a href="delete.jsp">Delete From Office Hours</a><br>
        <br>
        <a href="staffhome.jsp">Back To Home</a>
    </body>
</html>
