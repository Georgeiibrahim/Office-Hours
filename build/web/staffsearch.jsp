<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
<body>
<h1>Search Data</h1>
<table border="1">
<tr>
<td>id</td>
<td>username</td>
<td>subject</td>
<td>type</td>

</tr>
 <%
         Class.forName("com.mysql.jdbc.Driver");
   //int id =Integer.parseInt(request.getSession().getAttribute("id").toString());
   String name=request.getParameter("staffname").toString();
   
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/staff","root","");
            
          //  String myrs="select * from staff where username=?";
            PreparedStatement stmt=con.prepareStatement("select * from student where StudentName=?");  
            stmt.setString(1,name);  
            //PrepareStatement stmt =con.prepareStatement(myrs);
            //ResultSet myrs=stmt.executeUpdate("select * from staff");
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
           
               
%>
<table>
<tr bgcolor="#DEB887" style="width:100%">

<th><b><%=rs.getString("StudentName") %></b></th>
<th><b><%=rs.getString("StudentAddres") %></b></th>
<th><b><%=rs.getString("StudentMobile") %></b></th>
<th><b><%=rs.getString("StudentEmail") %></b></th>
<br>
</tr>
<%}
%>
</table>
</body>
</html>