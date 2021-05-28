<%-- 
    Document   : findStaff
    Created on : Jan 10, 2021, 11:16:49 AM
    Author     : lenovo
--%>

<%@page import="java.sql.PreparedStatement"%>
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
            p{
                color: white;
            }
            a{
                color: white;
            }
        </style>
    </head>
    <body>
        <% 
            
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            String email=request.getSession().getAttribute("studentEmail").toString();
            int ID=0;
            
            try {
                String url = "jdbc:mysql://localhost:3306/staff";
                String user = "root";
                String password = "";
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                out.print(email);
                
                /*RS=Stmt.executeQuery("SELECT * FROM Student");
                {
                    while(RS.next())
                    {
                        String mail=RS.getString("StudentEmail");
                        if(email==mail)
                        {
                            ID=RS.getInt("StudentID");
                        }
                    }
                    
                }
                out.print(ID);*/
                  out.print(email);
                PreparedStatement ps =Con.prepareStatement("select * from student where StudentEmail=?");
                 out.println("kadn");
                ps.setString(1,email);
                RS=ps.executeQuery();
                  out.print(email);
                if(RS.next())
                {
                    ID=RS.getInt("StudentID");
                                     out.println("kadn");

                }
                
                //out.print(ID);
                
                RS=Stmt.executeQuery("SELECT* FROM enrolled_in where StudID="+ID);
                                 out.println("kadn");

                {
                                     out.println("kadnsafsa");

                  RS=Stmt.executeQuery("SELECT enrolled_in.SubjectID, Subject.SubjectName, works_in.StaffID  ,staff2.StaffName FROM enrolled_in inner join Subject ON enrolled_in.SubjectID=Subject.SubjectID inner join works_in ON Subject.SubjectID = works_in.SubjectID inner join staff2 ON works_in.StaffID = staff2.StaffID ORDER BY Subject.SubjectName");
                                out.println("kadn12e21");

               }
                
            

        %>
        <table border="1">
            <tr id="header">
                <th>Subject ID</th> 
                <th>Subject Name</th> 
                <th>Staff ID</th> 
                <th>Staff Name</th>  
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getInt("enrolled_in.SubjectID")%></td>
                <td><%=RS.getString("Subject.SubjectName")%></td>
                <td><%=RS.getInt("works_in.StaffID")%></td>
                <td><%=RS.getString("staff2.StaffName")%></td>
            </tr>
            <%}}catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }%>
        </table>
        <br>
        <a href="Student.jsp">Back To Home Page</a>
    </body>
</html>
