package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class staffreply_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>  \n");
      out.write("       ");


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
        
      out.write("\n");
      out.write("        <br><br>\n");
      out.write("        <table border=\"1\">\n");
      out.write("            <tr>\n");
      out.write("                <th>ID of this message is</th>\n");
      out.write("                <th>Sent From</th> \n");
      out.write("                <th>Sent to</th> \n");
      out.write("                <th>Content</th> \n");
      out.write("            </tr>\n");
      out.write("            ");

                while (RS.next()) {
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(RS.getInt("ID"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(RS.getString("email1"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(RS.getString("email2"));
      out.write("</td>\n");
      out.write("                <td>");
      out.print(RS.getString("content"));
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            ");
 }
            }catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <form action=\"reply\">\n");
      out.write("            <label>Enter the ID of message that want to reply</label><br>\n");
      out.write("            <input type=\"text\"name=\"msgto\" required><br>\n");
      out.write("            <label>Your reply</label><br>\n");
      out.write("            <input type=\"text\" name=\"msg\"required><br>   \n");
      out.write("             <input type=\"submit\" value=\"Reply\">\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
