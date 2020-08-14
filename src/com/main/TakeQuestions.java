package com.main;

import java.io.IOException;

import com.main.Questions;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;


@WebServlet("/TakeQuestions")
public class TakeQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TakeQuestions() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}
    
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
			if(session.getAttribute("sessionID")==null){
				response.sendRedirect("index.html");
			}
		 if(session.getAttribute("email")==null&&session.getAttribute("standard")==null) {
			// response.sendRedirect("index.jsp");
			 RequestDispatcher rsp=request.getRequestDispatcher("index.jsp");
        	 rsp.forward(request, response);
		 }
	  String email=(String) session.getAttribute("email");
	  String standard=(String)session.getAttribute("standard");
      String subjectName=request.getParameter("subjectname");
      String testName=request.getParameter("testName");
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
          ArrayList list=new ArrayList();
          Questions question;
                  while(rs.next()){
                     
               	   question = new Questions(rs.getString("questions"),rs.getString("option1"),rs.getString("option2"),rs.getString("option3"),rs.getString("option4"),rs.getString("correctanswer")); 
                      list.add(question);
                  }
                  pstmt.close();
                  con.close(); 
      }
         
      catch(Exception e)
      {
          e.printStackTrace();
      }
      //response.sendRedirect("TakeExam.jsp");
      RequestDispatcher r=request.getRequestDispatcher("TakeExam.jsp");
      r.forward(request, response);
	}

}
