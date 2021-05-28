package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;

public final class Student_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("        <style>\n");
      out.write("            .topnav {\n");
      out.write("               overflow: hidden;\n");
      out.write("               padding: 1% ; \n");
      out.write("               border-bottom: inset #BDBDBD 2px ;\n");
      out.write("               padding-top: 0.2cm; \n");
      out.write("               padding-right: 2cm; \n");
      out.write("        } \n");
      out.write("        .topnav a { \n");
      out.write("            float: right; \n");
      out.write("            color: #EAEDF0; \n");
      out.write("            font-family: Sans-serif;\n");
      out.write("            text-align: left; \n");
      out.write("            padding: 15px 20px; \n");
      out.write("            text-decoration: none; \n");
      out.write("            font-size: 17px;\n");
      out.write("        } \n");
      out.write("        .topnav a:hover{ \n");
      out.write("            color: lightgrey; \n");
      out.write("        } \n");
      out.write("         .topnav a.active { \n");
      out.write("             color: white; \n");
      out.write("         } \n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("                   <div class=\"topnav\"> \n");
      out.write("                <a href=\"message.jsp\">Message staff member</a>\n");
      out.write("                <a href=\"cancel.jsp\">Cancel a meeting</a>\n");
      out.write("                <a href=\"reserve.jsp\">Reserve an appointment</a>\n");
      out.write("                <a href=\"findOfficeHours.jsp\">View the office hours</a>\n");
      out.write("                <a href=\"findContact.jsp\">Find the contact</a>\n");
      out.write("                <a href=\"findStaff.jsp\">Find staff</a>  \n");
      out.write("            </div>\n");
      out.write("        ");

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
            
      out.write("\n");
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
