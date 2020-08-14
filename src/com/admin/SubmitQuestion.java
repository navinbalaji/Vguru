package com.admin;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/SubmitQuestion")
public class SubmitQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public SubmitQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("Mentorlogin.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		  PrintWriter out=response.getWriter();
	      response.setContentType("text/html");
	        
	        
		String standard=request.getParameter("chstandard");
		String subject=request.getParameter("chsubject");
		String testname=request.getParameter("testname");
		String question=request.getParameter("question");
		String option1=request.getParameter("option1");
		String option2=request.getParameter("option2");
		String option3=request.getParameter("option3");
		String option4=request.getParameter("option4");
		String correctanswer=request.getParameter("correctanswer");
		String No="no";
		if(standard==null||subject.equals(No)||testname==null||question==null||option1==null||option2==null||option3==null||option4==null||correctanswer==null) {
			response.sendRedirect("AddQuestion.jsp");
		}
		else {
			String dburl="jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false"; 
            String dbusername="uqts9igealqykn9n"; 
            String dbpassword="WeuumU7W09PwJIvXiU9f";
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); 
             PreparedStatement ps=con.prepareStatement("insert into testquestions values(?,?,?,?,?,?,?,?,?)");
             ps.setString(1,standard);
             ps.setString(2,subject);
             ps.setString(3,testname);
             ps.setString(4,question);
             ps.setString(5,option1);
             ps.setString(6,option2);
             ps.setString(7,option3);
             ps.setString(8,option4);
             ps.setString(9,correctanswer);
             ps.executeUpdate(); 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
   	 out.print("<script type=\"text/javascript\">");
   	 out.print("alert('Question Submitted');");
   	 out.print("location='AddQuestion.jsp';");
   	 out.print("</script>");
		/*response.sendRedirect("AddQuestion.jsp");*/
	}
	}

}


