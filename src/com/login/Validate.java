package com.login;

import java.sql.*;  

public class Validate {  
public static boolean validate(String name,String pass){  
boolean status=false;  
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");  
	 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
PreparedStatement ps=con.prepareStatement("select * from users where email=? and Password=?");  
ps.setString(1,name);  
ps.setString(2,pass); 
      
ResultSet rs=ps.executeQuery();  
status=rs.next();  
          
}catch(Exception e){System.out.println(e);}  
return status;  
}  



public static boolean AuthStatus(String email,String password) {
	boolean Authstatus=false;  
	try{  
	Class.forName("com.mysql.jdbc.Driver");  
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root",""); 
	 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
PreparedStatement in=con.prepareStatement("select Authentication from users where email=? and Password=?");  
in.setString(1,email);  
in.setString(2,password);      
ResultSet r=in.executeQuery();  
int tempAuth=0;
int Auth=1;
  while(r.next()) {
	  tempAuth=r.getInt("Authentication");
  }
  if(tempAuth==Auth) {
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