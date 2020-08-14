package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.*;

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

@WebServlet("/SendMail")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		String password=(String)request.getParameter("password");
		
		
		PrintWriter out=response.getWriter();
		Random rand=new Random();
		int OTP=rand.nextInt(1000000);

		String msg=String.valueOf(OTP);

		
		int validateEmail=Insert.emailValidate(email);
		if(validateEmail==0) {
		 String to = email;
		final String user="navinbalaji@zohomail.in";//change accordingly  
		final String pass="naveenbalaji";  
		  
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
		 message.setSubject("OTP Verification For VGURU");
		 message.setText("Your Verification OTP for VGURU is : "+msg);  
		   
		 //3rd step)send message  
		 Transport.send(message);  
		 Insert.dataInsert(firstname,lastname,email,dateofbirth,gender,bloodgroup,standard,address,city,state,zip,phonenumber,fathername,mothername,parentsphonenumber,parentsemail,password,msg);
		 System.out.println("Done");
		 
		 request.setAttribute("userEmail", to);
		 RequestDispatcher rd=request.getRequestDispatcher("OtpVerification.jsp");  
	     rd.forward(request,response); 
		 //response.sendRedirect("OtpVerification.jsp");
		  
		 } catch (MessagingException e) {  
		    /*throw new RuntimeException(e);  */
			System.out.println(e);
		 } 
		
		}
		else {
			out.println("<h1>You are Already registered</h1>");
		}
		      
	}

}
