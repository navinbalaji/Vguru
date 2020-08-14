package com.main;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

public class FetchQuestion{
	
	
	public ArrayList getQuestions(String Email,String std,String sub,String TName){
	    ArrayList list=new ArrayList();
			String email=Email;
			String standard=std;
	       String subjectName=sub;
	       String testName=TName;
	       System.out.println(Email+std+sub+TName);
	       String dburl="jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false"; 
           String dbusername="uqts9igealqykn9n"; 
           String dbpassword="WeuumU7W09PwJIvXiU9f";
	      try
	      {
	           Class.forName("com.mysql.jdbc.Driver"); 
	          Connection con=(Connection) DriverManager.getConnection(dburl,dbusername,dbpassword); 
	          
	          PreparedStatement pstmt=null ; 
	          
	          pstmt=con.prepareStatement("SELECT question,option1,option2,option3, option4 ,correctanswer FROM testquestions where standard= ?  and subject = ? and testtopic= ?");
	            pstmt.setString(1,standard);
	            pstmt.setString(2,subjectName);
	            pstmt.setString(3,testName);
	          ResultSet rs=pstmt.executeQuery();
	        
	          Questions question;
	                  while(rs.next()){
	                     
	               	   question = new Questions(rs.getString("question"),rs.getString("option1"),rs.getString("option2"),rs.getString("option3"),rs.getString("option4"),rs.getString("correctanswer")); 
	                      list.add(question);
	                  }
	                  
	                  pstmt.close();
	                  con.close(); 
	      }
	         
	      catch(Exception e)
	      {
	          e.printStackTrace();
	      }
   return list;
	}
	
}