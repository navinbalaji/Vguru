package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PuzzleAuthChecker")
public class PuzzleAuthChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PuzzleAuthChecker() {
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
		 String PuzzleName=request.getParameter("puzzlename");
		 System.out.println(PuzzleName);
	        PrintWriter out=response.getWriter();
	        response.setContentType("text/html");
	         try{  
	         	Class.forName("com.mysql.jdbc.Driver");  
	         	Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");   
	         PreparedStatement in=con.prepareStatement("select testAuthentication from puzzle where email= ? and puzzleName= ? and standard = ? "); 
	         in.setString(1,(String) session.getAttribute("email"));
	         in.setString(2,request.getParameter("puzzlename"));
	         in.setString(3,(String)session.getAttribute("standard"));
	         ResultSet rs=in.executeQuery();
	         int Auth=0;
	         while(rs.next())
	         {
	         	Auth=rs.getInt(1);
	         	  System.out.println("Auth = "+Auth);
	         }

	         if(Auth==1){
	        	 out.print("<script type=\"text/javascript\">");
	        	 out.print("alert('you have already attended "+PuzzleName+" test');");
	        	 out.print("location='PuzzleChooser.jsp';");
	        	 out.print("</script>");
	         }else {
	        	 request.setAttribute("puzzlename", PuzzleName);
	        	 RequestDispatcher r=request.getRequestDispatcher("TakePuzzle.jsp");
	        	 r.forward(request, response);
	         }
	         con.close(); 
	         }catch(Exception e){
	         	System.out.println(e);
	         }


         		
		
		
	}

}
