package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SubmitLesson")
public class SubmitLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SubmitLesson() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	response.sendRedirect("Mentorlogin.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String standard=request.getParameter("chstandard");
		String subject=request.getParameter("chsubject");
		String lessonname=request.getParameter("lessonname");
		String lesson=request.getParameter("lesson");
		
	    PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

	    String dateandtime = myDateObj.format(myFormatObj);
		String No="no";
		if(standard==null||subject.equals(No)||lessonname==null||lesson==null) {
			response.sendRedirect("AddLesson.jsp");
		}
		else {
			String dburl="jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false"; 
            String dbusername="uqts9igealqykn9n"; 
            String dbpassword="WeuumU7W09PwJIvXiU9f"; 
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); 
             PreparedStatement ps=con.prepareStatement("insert into lesson values(?,?,?,?,?)");
             ps.setString(1,standard);
             ps.setString(2,subject);
             ps.setString(3,lessonname);
             ps.setString(4,lesson);
             ps.setString(5,dateandtime);
             ps.executeUpdate(); 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); 
             PreparedStatement in =con.prepareStatement("update testsubject set lastupdated = ? where subject = ? ");
             in.setString(1,dateandtime);
             in.setString(2,subject);
             in.executeUpdate(); 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
   	 out.print("<script type=\"text/javascript\">");
	 out.print("alert('Lesson Submitted');");
	 out.print("location='AddLesson.jsp';");
	 out.print("</script>");
	}
		
		
	}

}
