package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MentorLogin
 */
@WebServlet("/MentorLogin")
public class MentorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentorLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("Mentorlogin.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		HttpSession session=request.getSession();
		boolean areValidMentor=MemberLoginCheck.validate(username,password);
		
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

	    String dateandtime = myDateObj.format(myFormatObj);
		
		String mentorName="";
		String mentorEmail="";
		String mentorStandard="";
		String mentorLastLogin="";
		if(areValidMentor) {
			try
	        {
	            Class.forName("com.mysql.jdbc.Driver"); 
	            Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
	             PreparedStatement ps=con.prepareStatement("select name,email,standard,lastlogin from mentor where email = ? and password = ?");
	             ps.setString(1,username);
	             ps.setString(2,password);
	             ResultSet rs=ps.executeQuery();
	             while(rs.next()) {

	            	 mentorName=rs.getString("name");
	            	 mentorEmail=rs.getString("email");
	            	 mentorStandard=rs.getString("standard");
	            	 mentorLastLogin=rs.getString("lastlogin");
	             }
	             PreparedStatement in=con.prepareStatement("update mentor set lastlogin= ? where email = ? and password = ?");
	             in.setString(1,dateandtime);
	             in.setString(2,username);
	             in.setString(3,password);
	             in.executeUpdate();
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }
			
		    
			session.setAttribute("mentorName", mentorName);
			session.setAttribute("mentorEmail", mentorEmail);
			session.setAttribute("mentorStandard", mentorStandard);
			session.setAttribute("mentorLastLogin", mentorLastLogin);
			
			response.sendRedirect("AdminHome.jsp");
	         }else {
			response.sendRedirect("Mentorlogin.html");
		}
		
	}

}
