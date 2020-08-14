<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("sessionID")==null){
	response.sendRedirect("index.html");
}

%>
<%
if(request.getParameter("subject_id")!=null) 
{
   String stdr =(String)request.getParameter("subject_id"); 
    System.out.println(stdr);
    String dburl="jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false"; 
    String dbusername="uqts9igealqykn9n"; 
    String dbpassword="WeuumU7W09PwJIvXiU9f";
    String standard=(String)session.getAttribute("standard");
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); 
            
        PreparedStatement pstmt=null ; 
                
        pstmt=con.prepareStatement("SELECT DISTINCT testtopic FROM testquestions WHERE subject = ? and standard= ?"); 
        pstmt.setString(1,stdr);
        pstmt.setString(2,standard);
        ResultSet rs=pstmt.executeQuery(); 
        %>        
            <option selected="selected" value="no">--Select TestName--</option>
        <%    
        while(rs.next())
        {
        %>        
            <option value="<%=rs.getString("testtopic")%>">
               <%=rs.getString("testtopic")%>
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