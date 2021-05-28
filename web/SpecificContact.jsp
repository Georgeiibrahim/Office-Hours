<%-- 
    Document   : SpecificContact
    Created on : Jan 10, 2021, 2:17:53 PM
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
            int ID=Integer.parseInt(request.getParameter("ID"));
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
                
                RS=Stmt.executeQuery("select * from Staff2 where StaffID="+ID);
                
                }catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
             
          %>
          
                         <table border="0">
                           <% while (RS.next()) { %>
                                        <tr>
                                            <th>The staff member ID is :</th>
                                            <th>
                                             <%=RS.getInt("StaffID")%>
                                          </th>
                                        </tr>
                                         <tr>
                                            <th>The staff member Name is : </th>
                                            <th>
                                             <%=RS.getString("StaffName")%>
                                          </th>
                                        </tr>
                                        <tr>
                                            <th>The staff member Type is : </th>
                                            <th>
                                             <%=RS.getString("type")%>
                                          </th>
                                        </tr>
                                        <tr>
                                            <th>The staff member Email is : </th>
                                            <th>
                                             <%=RS.getString("StaffEmail")%>
                                          </th>
                                        </tr>
                                         
                                       
                                        <%}%>
                                    </table>
                                    <a href="findContact.jsp">Back</a>
                                    
    </body>
    
</html>
