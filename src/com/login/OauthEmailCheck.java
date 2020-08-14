package com.login;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class OauthEmailCheck {

	public static int OauthEmail(String name,String email) {
		int flag=0;
		 try {
			 Class.forName("com.mysql.jdbc.Driver");  
				//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");   
			 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
			PreparedStatement ps=con.prepareStatement("select email from users ");  
			ResultSet rs=ps.executeQuery();
			String tempEmail="";
			while(rs.next())
			{
				tempEmail=rs.getString(1);
				if(tempEmail.equals(email)) {
					flag=1;
				}
				System.out.println(tempEmail);
			}
			con.close();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		 System.out.println("flag = "+flag);
		 return flag;
	}
}
