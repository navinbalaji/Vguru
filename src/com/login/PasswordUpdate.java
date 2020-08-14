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


@WebServlet("/PasswordUpdate")
public class PasswordUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("fpuserEmail");
		String otp=request.getParameter("fpotp");
		String Newpass=request.getParameter("fppass");
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");      
			PreparedStatement ps=con.prepareStatement("select otp from users where email = ? ");  
			ps.setString(1,email);
			String fotp="";
			//Execute the insert command using executeUpdate() 
			// to make changes in database 
			
			ResultSet rs=ps.executeQuery();
			//rs.next();
			while(rs.next())
			{
				fotp=rs.getString(1);
				  System.out.println(otp);
			}
			if(fotp.equals(otp)) {
				PreparedStatement in=con.prepareStatement("update users set Password = ? where email= ? ");  
				in.setString(1,Newpass);
				in.setString(2, email);
				 in.executeUpdate();
				 System.out.println("Password Updation done");
				RequestDispatcher rd=request.getRequestDispatcher("index.html");  
			     rd.forward(request,response);
			}else {
				out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\" integrity=\"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk\" crossorigin=\"anonymous\">");
			     out.print("<h1 class='text-center jumbotron p-4 text-Warning'>Please Check Your OTP</h1>");
				request.setAttribute("fpuserEmail",email);
				RequestDispatcher rd=request.getRequestDispatcher("ForgotPassCheck.jsp");
			     rd.forward(request,response); 
			     
			}
			con.close();
			
		}catch(Exception e){
			System.out.println(e);
		}
	}

}
