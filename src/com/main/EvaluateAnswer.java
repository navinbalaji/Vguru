package com.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class EvaluateAnswer {

	
	public static int getMarks(String question,String useranswer,String standard,String subjectName,String testName) {
       
      try
      {
           Class.forName("com.mysql.jdbc.Driver"); 
           Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");
          
          PreparedStatement pstmt=null ; 
          
          pstmt=con.prepareStatement("SELECT correctanswer FROM testquestions where question= ? and standard= ?  and subject = ? and testtopic= ? ");
          pstmt.setString(1,question);  
          pstmt.setString(2,standard);
            pstmt.setString(3,subjectName);
            pstmt.setString(4,testName);
          ResultSet rs=pstmt.executeQuery();
          String Answer="";
                  while(rs.next()){
                     
                	  Answer=rs.getString("correctanswer");
               	  System.out.println("correctanswer"+Answer);
                  }
                  con.close(); 
           if(Answer.equals(useranswer)) {
        	   return 1;
           }else {
        	   return 0;
           }
      }
         
      catch(Exception e)
      {
          e.printStackTrace();
          return 0;
      }
	}
}
