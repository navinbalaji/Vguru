package com.main;

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

@WebServlet("/Subject")
public class Subject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Subject() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String str=request.getParameter("email");
		HttpSession session=request.getSession();
	    if(session.getAttribute("sessionID")==null){
	    	response.sendRedirect("index.html");
	    }
	    String str=(String)session.getAttribute("sessionID");
		String std="";
		String username="";
		String Lastname="";
		String LastLogin="";
		
		//Date and Time
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

	    String dateandtime = myDateObj.format(myFormatObj);
	    
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");     
		PreparedStatement ps=con.prepareStatement("select Standard from users where email= ? ");  
		ps.setString(1,str);
		ResultSet rs=ps.executeQuery();
		//rs.next();
		while(rs.next())
		{
			std=rs.getString(1);
			  System.out.println(std);
		}
		PreparedStatement in=con.prepareStatement("select Firstname,LastName,LastLogin from users where email= ? "); 
		in.setString(1,str);
		ResultSet r=in.executeQuery();
		while(r.next())
		{
			username=r.getString(1);
			Lastname=r.getString(2);
			LastLogin=r.getString("LastLogin");
			System.out.println(username);
		}
		PreparedStatement psmt=con.prepareStatement("update users set LastLogin= ? where email = ? ");
		psmt.setString(1,dateandtime);
		psmt.setString(2,str);
		psmt.executeUpdate();
		  con.close(); 
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		
		session.setAttribute("email",str);
		session.setAttribute("standard",std);
		session.setAttribute("username",username+"  "+Lastname);
		session.setAttribute("LastLogin",LastLogin);
		response.sendRedirect("Home.jsp");
				
	}

}
