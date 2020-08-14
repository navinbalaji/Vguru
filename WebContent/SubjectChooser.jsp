<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies. 
    if(session.getAttribute("mentorName")==null&&session.getAttribute("mentorEmail")==null&&session.getAttribute("mentorStandard")==null&&session.getAttribute("mentorLastLogin")==null){
    	response.sendRedirect("Mentorlogin.html");
    }
    %>
<%
if(request.getParameter("standard_id")!=null) 
{
   String standard =(String)request.getParameter("standard_id"); 
    String dburl="jdbc:mysql://localhost:3306/demo"; 
    String dbusername="root"; 
    String dbpassword=""; 
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
            
        PreparedStatement pstmt=null ; 
                
        pstmt=con.prepareStatement("SELECT subject FROM testsubject WHERE standard= ?"); 
        pstmt.setString(1,standard);
        ResultSet rs=pstmt.executeQuery(); 
        %>        
            <option selected="selected" value="no">-Select Subject-</option>
        <%    
        while(rs.next())
        {
        %>        
            <option value="<%=rs.getString("subject")%>">
                <%=rs.getString("subject")%>
            </option>
        <%
        }
  
        con.close(); //close connection
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>