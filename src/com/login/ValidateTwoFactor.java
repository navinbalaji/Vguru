package com.login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ValidateTwoFactor {

	public static boolean validate(String answer,String email,String question) {
			boolean Authstatus=false;  
			try{  
			Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");      
		PreparedStatement in=con.prepareStatement("select ? from users where email= ?");  
		in.setString(1,question );
		in.setString(2,email);   
		ResultSet r=in.executeQuery();  
       String tempAuth="";
		  while(r.next()) {
			  tempAuth=r.getString(1);
		  }
		 
		  if(tempAuth.equalsIgnoreCase(answer)) {
			  Authstatus=true;
		  }else {
			  Authstatus=false;
		  }
		  con.close();      
		}
		catch(Exception e)
		{
			System.out.println(e);
			Authstatus=false;
		}  
		return Authstatus;  
		
	}

}
