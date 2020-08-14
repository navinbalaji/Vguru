package com.login;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TwoStepAuth")
public class TwoStepAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TwoStepAuth() {
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
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
	    if(session.getAttribute("sessionID")==null){
	    	response.sendRedirect("index.html");
	    }
	   
		PrintWriter out=response.getWriter();
		response.setContentType("text/html"); 
		String userEmail=request.getParameter("email");
		String userEnterOtp=request.getParameter("optnum");
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
		PreparedStatement in=con.prepareStatement("select otp from users where email= ?");  
		in.setString(1,userEmail);        
		ResultSet r=in.executeQuery();  
		String tempOtp="";
		  while(r.next()) {
			  tempOtp=r.getString(1);
		  }
		  if(tempOtp.equals(userEnterOtp)) {
			//response.sendRedirect("index.jsp");
			  request.setAttribute("email", userEmail);
			  RequestDispatcher rd=request.getRequestDispatcher("Subject");  
		      rd.forward(request,response); 
			  
		  }else {
			  out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\" integrity=\"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk\" crossorigin=\"anonymous\">");
		      out.print("<h1 class='text-center jumbotron p-4 text-warning'>Sorry Your Entered OTP is Invalid </h1>");
		      request.setAttribute("userEmail", userEmail);
		      RequestDispatcher rd=request.getRequestDispatcher("TwoFactorAuth.jsp");  
		      rd.include(request,response);  
		  }
		  con.close();     
		}
		catch(Exception e)
		{
			System.out.println(e);	
		}  
				
		
	}

}
