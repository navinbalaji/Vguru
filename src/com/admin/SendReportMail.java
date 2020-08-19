package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.sql.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/SendReportMail")
public class SendReportMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendReportMail() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("MentorLogin.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Studentname=request.getParameter("studentname");
		String Studentemail=request.getParameter("studentemail");
		String Parentemail=request.getParameter("parentemail");
		String AdditionalMessage=request.getParameter("additionalmessage");
		
		PrintWriter out=response.getWriter();
	    response.setContentType("text/html");
	      
		 String to = Parentemail;
		 
	      String MessageContent="<h1 style='text-align:center'>Vguru</h1><br><h1 style='text-align:center' >"+Studentname+"</h1><br><h4>Test Marks</h4><br>";
	           
	      try{ 
	            Class.forName("com.mysql.jdbc.Driver");  
	            Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");     
	            PreparedStatement ps=con.prepareStatement("select subject,testname,totalmarks,marks from test where email = ? order by subject");  
	            ps.setString(1,Studentemail);
	            ResultSet rs=ps.executeQuery();
	            while(rs.next())
	            {
	            	MessageContent+=" "+rs.getString("subject")+"  :  "+rs.getString("testname")+"  -->  "+rs.getString("marks")+" out of "+rs.getString("totalmarks")+"<br>";
	            }
	            MessageContent+="<h4>Puzzle Marks</h4><br><br>";
	            PreparedStatement in=con.prepareStatement("select puzzleName,totalmarks,marks from puzzle where email = ?");  
	            in.setString(1,Studentemail);
	            ResultSet r=in.executeQuery();
	            while(r.next())
	            {
	            	MessageContent+=" "+r.getString("puzzleName")+"  -->  "+r.getString("marks")+" out of "+r.getString("totalmarks")+"<br>";
	            }
	      	}
	    catch(Exception e){
	    	System.out.println(e);
	    }
		 
		 
	      MessageContent+="<br><br><h3 style='text-align:center '> Mentor Message <h3><br><p>"+AdditionalMessage+"</p>";
		 
			final String user="";//Email  
			final String pass="";//password
			  
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
			 message.setSubject("Student Report From VGURU");
			 message.setContent(MessageContent,"text/html");  
			   
			 //3rd step)send message  
			 Transport.send(message);  
			 System.out.println("Report Send To Parent");
			 } catch (MessagingException e) {  
			    /*throw new RuntimeException(e);  */
				System.out.println(e);
			 } 
		
			
			out.print("<script type=\"text/javascript\">");
		   	 out.print("alert('Report Sent to Parent');");
		   	 out.print("location='AdminHome.jsp';");
		   	 out.print("</script>");
	}

}
