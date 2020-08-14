package com.admin;

import java.sql.*;

public class MemberLoginCheck {

	public static boolean validate(String username, String password) {
		String uname="";

		String pass="";
		boolean status=false;
		 try
	        {
	            Class.forName("com.mysql.jdbc.Driver"); 
	            Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
	             PreparedStatement ps=con.prepareStatement("select * from mentor where email = ? and password = ?");
	             ps.setString(1,username);
	             ps.setString(2,password);
	             ResultSet rs=ps.executeQuery();
	             while(rs.next())
	             {
	            	uname=rs.getString("email");
	            	pass=rs.getString("password");
	             }
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	            status=false;
	        }
		 if((uname.equals(username))&&(pass.equals(pass))){
			 status=true;
			 }
		 return status;
	}

}
