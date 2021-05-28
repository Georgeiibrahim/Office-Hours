<%-- 
    Document   : cancel
    Created on : Jan 15, 2021, 11:17:46 AM
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
        <%
            Statement Stmt = null;
            ResultSet RS = null;
            PreparedStatement ps = null;
            Connection Con = null;
            String email = request.getSession().getAttribute("studentEmail").toString();
            int StudentID = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                     String url = "jdbc:mysql://localhost:3306/staff";
                    String user = "root";
                    String password = "";
                    Con = DriverManager.getConnection(url, user, password);
                    Stmt = Con.createStatement();
                try {
                    ps = Con.prepareStatement("select * from student where StudentEmail=?");
                        ps.setString(1, email);
                        RS = ps.executeQuery();
                        while (RS.next()) {
                            StudentID = RS.getInt("StudentID");
                        }
                    String query = "select * from appointment where StudentID = " + StudentID;
                    ps = Con.prepareStatement(query);
                    RS = ps.executeQuery();
                } catch (Exception e) {
                    System.out.println(e);
                }      
        %>
        <br><br>
        <table border="1">
            <tr>
                <th>The office hours ID is :</th>
                <th>The staff member ID is : </th>
                <th>The Student ID is : </th>
                <th>The slot time is : </th>
                <th>The appointment date is : </th>
                <th>The appointment day is : </th>
            </tr>
            <% while (RS.next()) { %>
            <tr>
                <th><%=RS.getInt("officeHoursID")%></th>
                <th><%=RS.getInt("StaffID")%></th>
                <th><%=RS.getString("StudentID")%></th>
                <th><%=RS.getString("slot")%></th>
                <th><%=RS.getString("Date")%></th>
                <th><%=RS.getString("day")%></th>
            </tr>
            <% }   
                } catch (Exception e) {
                    System.out.println(e);
                }
            %>
        </table>
        <form action="cancelappointment">
                <p>Enter The Office Hours ID</p>
                <input type="text" name="appointmentID">
                <input type="submit">
            </form>
        <br>
        <a href="Student.jsp">Back To Home PAge</a>
    </body>
</html>
