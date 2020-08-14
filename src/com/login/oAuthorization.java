package com.login;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/oAuthorization")
public class oAuthorization extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public oAuthorization() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname=(String)request.getParameter("firstname");
		String lastname=(String)request.getParameter("lastname");
		String email=(String)request.getParameter("email");
		String dateofbirth=(String)request.getParameter("dateofbirth");
		String gender=(String)request.getParameter("gender");
		String bloodgroup=(String)request.getParameter("bloodgroup");
		String standard=(String)request.getParameter("standard");
		String address=(String)request.getParameter("address");
		String city=(String)request.getParameter("city");
		String state=(String)request.getParameter("state");
		String zip=(String)request.getParameter("zip");
		String phonenumber=(String)request.getParameter("phonenumber");
		String fathername=(String)request.getParameter("fathername");
		String mothername=(String)request.getParameter("mothername");
		String parentsphonenumber=(String)request.getParameter("parentsphonenumber");
		String parentsemail=(String)request.getParameter("parentsemail");
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");      
			 PreparedStatement ps=con.prepareStatement("insert into users values(?, ?, ?, ? , ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )");  
				ps.setString(1,firstname);
				ps.setString(2,lastname);
				ps.setString(3,email);
				ps.setString(4,dateofbirth);
				ps.setString(5,gender);
				ps.setString(6,bloodgroup);
				ps.setString(7,standard);
				ps.setString(8,address);
				ps.setString(9,city);
				ps.setString(10,state);
				ps.setString(11,zip);
				ps.setString(12,phonenumber);
				ps.setString(13,fathername);
				ps.setString(14,mothername);
				ps.setString(15,parentsphonenumber);
				ps.setString(16,parentsemail);
				ps.setString(17,"AuthUser");
				ps.setString(18,"AuthUser");
				ps.setInt(19,1);
				ps.setString(20,"-");
		
		//Execute the insert command using executeUpdate() 
		// to make changes in database 
		ps.executeUpdate(); 

		// Close all the connections 
		ps.close(); 
		con.close(); 
		  System.out.print("OAuth Insertion Successfull and Registration Successful");
		  response.sendRedirect("index.html");
		}catch(Exception e){System.out.println(e);}   
		}
	}

