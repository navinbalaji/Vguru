package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserProfileUpdate
 */
@WebServlet("/UserProfileUpdate")
public class UserProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("sessionID")==null){
			response.sendRedirect("index.html");
		}
		PrintWriter out=response.getWriter();
	    response.setContentType("text/html");
	    
		String firstname=(String)request.getParameter("firstname");
		String lastname=(String)request.getParameter("lastname");
		String email=(String)request.getParameter("email");
		String dateofbirth=(String)request.getParameter("dateofbirth");
		String gender=(String)request.getParameter("gender");
		String bloodgroup=(String)request.getParameter("bloodgroup");
		String address=(String)request.getParameter("address");
		String city=(String)request.getParameter("city");
		String state=(String)request.getParameter("state");
		String zip=(String)request.getParameter("zip");
		String phonenumber=(String)request.getParameter("phonenumber");
		String fathername=(String)request.getParameter("fathername");
		String mothername=(String)request.getParameter("mothername");
		String parentsphonenumber=(String)request.getParameter("parentsphonenumber");
		String parentsemail=(String)request.getParameter("parentsemail");
		
		//Update user Profile
		try {
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");   
	//Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
	PreparedStatement ps=con.prepareStatement("update users set Firstname = ?,Lastname = ?,DateofBirth = ?,Gender = ?,BloodGroup = ?,Address = ?,City= ?,State= ?,Zip= ?,Phonenumber = ?,Fathername = ?,Mothername= ?,parentsnumber = ?,Parentsemail = ? where email= ?");  
	ps.setString(1,firstname);
	ps.setString(2,lastname);
	ps.setString(3,dateofbirth);
	ps.setString(4,gender);
	ps.setString(5,bloodgroup);
	ps.setString(6,address);
	ps.setString(7,city);
	ps.setString(8,state);
	ps.setString(9,zip);
	ps.setString(10,phonenumber);
	ps.setString(11,fathername);
	ps.setString(12,mothername);
	ps.setString(13,parentsphonenumber);
	ps.setString(14,parentsemail);
	ps.setString(15,email);

	//Execute the insert command using executeUpdate() 
	// to make changes in database 
	ps.executeUpdate(); 

	// Close all the connections 
	ps.close(); 
	con.close(); 
	
	out.print("<script type=\"text/javascript\">");
  	 out.print("alert('Profile Updated');");
  	 out.print("location='Home.jsp';");
  	 out.print("</script>");
  	 
	  System.out.print("Updation Successfull");        
	}
		catch(Exception e)
		{
		
		System.out.println(e);
		
		}   

	}
}

