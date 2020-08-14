package com.login;


import java.io.IOException;
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


@WebServlet("/Oauthentication")
public class Oauthentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Oauthentication() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		 String name=(String)request.getParameter("oAuthName");
		 String email=(String)request.getParameter("oAuthEmail");
		 int flag=OauthEmailCheck.OauthEmail(name,email);
		 
		 
		 if(flag==1) {
			 try {
				 Class.forName("com.mysql.jdbc.Driver");  
				 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
					//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root",""); 
				PreparedStatement in=con.prepareStatement("select Standard from users where email = ? ");
				in.setString(1, email);
				ResultSet r=in.executeQuery();
				String tempSubject="";
				int tempFlag=0;
				while(r.next()) {
					tempSubject=r.getString(1);
					if(tempSubject.length()>=1) {
						tempFlag=1;
					}
				}
				if(tempFlag==1) {
					System.out.println("Subject Registered");
					HttpSession session=request.getSession();
					session.setAttribute("sessionID", email);
					/*response.sendRedirect("Subject");*/
					  RequestDispatcher rd=request.getRequestDispatcher("Subject");  
				      rd.forward(request,response); 
				}else {
					request.setAttribute("userAuthEmail",email);
					 RequestDispatcher rd=request.getRequestDispatcher("oAuthRegistration.jsp");  
				     rd.forward(request,response); 
				}
				con.close();
			}
			 catch(Exception e) {
				 System.out.println(e);
			 }
				 
			 }else {
				 request.setAttribute("userAuthEmail",email);
				 RequestDispatcher rd=request.getRequestDispatcher("oAuthRegistration.jsp");  
			     rd.forward(request,response); 
		           }
		
	}

}
