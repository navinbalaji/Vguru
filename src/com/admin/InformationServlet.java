package com.admin;


import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InformationServlet")
public class InformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InformationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("MentorLogin.html");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String Standard=request.getParameter("standard");
		String Information=request.getParameter("information");
		
		PrintWriter out=response.getWriter();
	    response.setContentType("text/html");
	    
		//Date and Time
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
	    String dateandtime = myDateObj.format(myFormatObj);
	    
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");
			 PreparedStatement ps=con.prepareStatement("update information set info = ?,date = ? where standard = ? "); 
			 ps.setString(1, Information);
			 ps.setString(2, dateandtime);
			 ps.setString(3, Standard);
			 ps.executeUpdate();
			 
			 
			 out.print("<script type=\"text/javascript\">");
		   	 out.print("alert('Information Posted');");
		   	 out.print("location='AdminHome.jsp';");
		   	 out.print("</script>");
			 
			 System.out.println("Information Updated");
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
	}

}
