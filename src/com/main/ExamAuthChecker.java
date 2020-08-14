package com.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/ExamAuthChecker")
public class ExamAuthChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ExamAuthChecker() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("sessionID")==null){
			response.sendRedirect("index.html");
		}
         String subjectname=request.getParameter("subjectname");
         String testname=request.getParameter("testname");
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        String No="no";
        if(testname.equals(No)) {
        	RequestDispatcher rd=request.getRequestDispatcher("ExamChooser.jsp");  
        	rd.forward(request, response);
        	//response.sendRedirect("ExamChooser.jsp");
        }else {
         try{  
         	Class.forName("com.mysql.jdbc.Driver");  
         	Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");
         PreparedStatement in=con.prepareStatement("select testAuthentication from test where email= ? and testname= ? and subject= ? and standard = ? "); 
         in.setString(1,(String) session.getAttribute("email"));
         in.setString(2,request.getParameter("testname"));
         in.setString(3,request.getParameter("subjectname"));
         in.setString(4,(String)session.getAttribute("standard"));
         ResultSet rs=in.executeQuery();
         int Auth=0;
         while(rs.next())
         {
         	Auth=rs.getInt(1);
         	  System.out.println("Auth = "+Auth);
         }

         if(Auth==1){
        	 out.print("<script type=\"text/javascript\">");
        	 out.print("alert('you have already attended "+testname+" test');");
        	 out.print("location='ExamChooser.jsp';");
        	 out.print("</script>");
        	 /*RequestDispatcher rsp=request.getRequestDispatcher("ExamChooser.jsp");
        	 rsp.forward(request, response);*/
         }else {
        	 request.setAttribute("subjectname", subjectname);
        	 request.setAttribute("testname", testname);
        	 RequestDispatcher r=request.getRequestDispatcher("TakeExam.jsp");
        	 r.forward(request, response);
         }
         con.close();
         }catch(Exception e){
         	System.out.println(e);
         }


        }
		
		
	}

}
