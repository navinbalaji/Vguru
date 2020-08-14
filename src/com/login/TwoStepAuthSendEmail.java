package com.login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class TwoStepAuthSendEmail {

	public static boolean sendEmail(String username,String IpAddress) {
		// TODO Auto-generated method stub
		String twoStepAuthUserId=username;
		Random rand=new Random();
		int ROTP=rand.nextInt(1000000);
		String RecoverOTP=String.valueOf(ROTP);
		boolean twoAuthStatus=false;
		String to = twoStepAuthUserId;
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
		 message.setSubject("Vguru Password Recovery");
		 message.setText("Your Two Step Authentication OTP is : "+RecoverOTP+"  "+"Your Account is Accessing at "+"      "+IpAddress);  
		   
		 //3rd step)send message  
		 Transport.send(message);  
		 System.out.println(" Two Factor Mail Done");
		 
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root",""); 
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
			PreparedStatement ps=con.prepareStatement("update users set otp = ? where email = ? ");  
			ps.setString(1,RecoverOTP);
			ps.setString(2,twoStepAuthUserId);

			//Execute the insert command using executeUpdate() 
			// to make changes in database 
			ps.executeUpdate(); 

			// Close all the connections 
			ps.close(); 
			con.close();
			twoAuthStatus=true;
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		} 
		  
		 }
        catch (MessagingException e) {  
        	// throw new RuntimeException(e); 
        	e.printStackTrace();
		 }  
		
		return twoAuthStatus;
	}

}
