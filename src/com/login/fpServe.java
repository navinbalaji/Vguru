package com.login;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fpServe")
public class fpServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fpServe() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String touser=request.getParameter("fpemail");
		Random rand=new Random();
		int ROTP=rand.nextInt(1000000);
		String RecoverOTP=String.valueOf(ROTP);
		String to = touser;
		final String user="";//Email  
		final String pass="";//Password  
		  
		//1st step) Get the session object    
		Properties props = new Properties();  
		props.put("mail.smtp.host", "smtp.zoho.in");//change accordingly  
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		  
		Session session = Session.getDefaultInstance(props,  
		 new javax.mail.Authenticator() {  
		  protected PasswordAuthentication getPasswordAuthentication() {  
		   return new PasswordAuthentication(user,pass);  
		   }  
		});  
		//2nd step)compose message  
		try {  
		 MimeMessage message = new MimeMessage(session);  
		 message.setFrom(new InternetAddress(user));  
		 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
		 message.setSubject("Vguru Password Recovery");
		 message.setText("Your Recover OTP is : "+RecoverOTP);  
		   
		 //3rd step)send message  
		 Transport.send(message);  
		 System.out.println("Done");
		 
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");      
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
			PreparedStatement ps=con.prepareStatement("update users set otp = ? where email = ? ");  
			ps.setString(1,RecoverOTP);
			ps.setString(2,touser);

			//Execute the insert command using executeUpdate() 
			// to make changes in database 
			ps.executeUpdate(); 

			// Close all the connections 
			ps.close(); 
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
 
		  
		 request.setAttribute("fpuserEmail", to);
		 RequestDispatcher rd=request.getRequestDispatcher("ForgotPassCheck.jsp");  
	     rd.forward(request,response); 
		  
		 } catch (MessagingException e) {  
		   // throw new RuntimeException(e);  
			 e.printStackTrace();
		 }  
		
	}



}
