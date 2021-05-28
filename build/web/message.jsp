<%-- 
    Document   : message
    Created on : Jan 15, 2021, 2:21:58 PM
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
            p{
                color :white;
            }
            h4{
                color:white;
            }
            
    </style>
    </head>
  <body>
        <form action="stusendtostuff">
            <p>Enter the email you want to send to : </p>
            <input type="text" name="email2">
            <p>Enter the content of your message</p>
            <input type="text" name="message">
            <input type="submit">
        </form>
        <br><br>
        <h4>your messages box</h4>
        <form action="viewMessages.jsp">
            <input type="submit" value="View messages">
        </form>
        <br>
        <a href="Student.jsp">Back To Home Page</a>
    </body>
</html>
