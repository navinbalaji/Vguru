package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SubmitPuzzle")
public class SubmitPuzzle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitPuzzle() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	response.sendRedirect("Mentorlogin.html");
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
	    String dateandtime = myDateObj.format(myFormatObj);
		
	    PrintWriter out=response.getWriter();
        response.setContentType("text/html");
		
		String standard=request.getParameter("chstandard");
		/*String subject=request.getParameter("chsubject");*/
		String puzzle=request.getParameter("puzzlename");
		String question=request.getParameter("question");
		String option1=request.getParameter("option1");
		String option2=request.getParameter("option2");
		String option3=request.getParameter("option3");
		String option4=request.getParameter("option4");
		String correctanswer=request.getParameter("correctanswer");
		if(standard==null||puzzle==null||question==null||option1==null||option2==null||option3==null||option4==null||correctanswer==null) {
			response.sendRedirect("AddPuzzle.jsp");
		}
		else {
			String dburl="jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false"; 
            String dbusername="uqts9igealqykn9n"; 
            String dbpassword="WeuumU7W09PwJIvXiU9f"; 
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); 
             PreparedStatement ps=con.prepareStatement("insert into puzzlequestions values(?,?,?,?,?,?,?,?,?)");
             ps.setString(1,standard);
             ps.setString(2,puzzle);
             ps.setString(3,question);
             ps.setString(4,option1);
             ps.setString(5,option2);
             ps.setString(6,option3);
             ps.setString(7,option4);
             ps.setString(8,correctanswer);
             ps.setString(9,dateandtime);
             ps.executeUpdate(); 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
   	 out.print("<script type=\"text/javascript\">");
   	 out.print("alert('Puzzle Submitted');");
   	 out.print("location='AddPuzzle.jsp';");
   	 out.print("</script>");
/*		response.sendRedirect("AddPuzzle.jsp");*/
	}
		
		
	}

}
