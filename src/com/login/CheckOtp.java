package com.login;
import java.sql.*;
public class CheckOtp {
	public static String validateOtp(String userEmailId, String userEnteredOtp) {
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
		PreparedStatement ps=con.prepareStatement("select otp from users where email = ? ");  
		ps.setString(1,userEmailId);
		String otp="";
		//Execute the insert command using executeUpdate() 
		// to make changes in database 
		
		ResultSet rs=ps.executeQuery();
		//rs.next();
		while(rs.next())
		{
			otp=rs.getString(1);
			  System.out.println(otp);
		}
			
		 System.out.println(userEnteredOtp);
		// Close all the connections 
	
          if(userEnteredOtp.equals(otp)) {
        	  System.out.println("Verified successfully");
        	  PreparedStatement in=con.prepareStatement("update users set Authentication = 1 where email = ? ");
        	  in.setString(1,userEmailId);
        	  in.executeUpdate();
        	  in.close();
        	  ps.close(); 
      		con.close(); 
      		System.out.print("Operation Successfull");
      		return "OK"; 
          }
          con.close();
		return "notok";
		}
		catch(Exception e)
		{
			System.out.println(e);
		     return "notok";
		}   
		
	}
}

