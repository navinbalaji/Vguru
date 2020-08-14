package com.login;

import java.sql.*;  

public class Insert{  
public static void dataInsert(String firstname,String lastname,String email,String dateofbirth,String gender,String bloodgroup,String standard,String address,String city,String state,String zip,String phonenumber,String fathername,String mothername,String parentsphonenumber,String parentsemail,String password,String otp){   
try{  
	Class.forName("com.mysql.jdbc.Driver");  
	//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");     
	 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
	 PreparedStatement ps=con.prepareStatement("insert into users values(?, ?, ?, ? , ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ? , ? , ? )");  
	 ps.setString(1,firstname);
	 ps.setString(2,lastname);
	 ps.setString(3,email);
	 ps.setString(4,dateofbirth);
	 ps.setString(5,gender);
	 ps.setString(6,bloodgroup);
	 ps.setString(7,standard);
	 ps.setString(8,address);
	 ps.setString(9,city);
	 ps.setString(10,state);
	 ps.setString(11,zip);
	 ps.setString(12,phonenumber);
	 ps.setString(13,fathername);
	 ps.setString(14,mothername);
	 ps.setString(15,parentsphonenumber);
	 ps.setString(16,parentsemail);
	 ps.setString(17,password);
	 ps.setString(18,otp);
	 ps.setInt(19,0);
	 ps.setString(20,"-");

//Execute the insert command using executeUpdate() 
// to make changes in database 
ps.executeUpdate(); 

// Close all the connections 
ps.close(); 
con.close(); 
  
  System.out.print("Insertion Successfull");        
}catch(Exception e){System.out.println(e);}   
}

public static int emailValidate(String tod) {
	// TODO Auto-generated method stub
	int flag=0;
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		 Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f"); 
		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");      
	PreparedStatement ps=con.prepareStatement("select email from users");
	ResultSet rs=ps.executeQuery();
	String tempEmail="";
	while(rs.next())
	{
		tempEmail=rs.getString(1);
		 if(tempEmail.equals(tod)){
			 flag=1;
		 }
	}
	}catch(Exception e){
		System.out.println(e);
	}
	return flag;
}  
}  