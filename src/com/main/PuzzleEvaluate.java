package com.main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PuzzleEvaluate")
public class PuzzleEvaluate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PuzzleEvaluate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("email")==null&&session.getAttribute("standard")==null&&session.getAttribute("allow")==null) {
			/*response.sendRedirect("index.jsp");*/
			System.out.println("i am Enetered in worng way");
			RequestDispatcher rd=request.getRequestDispatcher("index.html");  
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("sessionID")==null){
			response.sendRedirect("index.html");
		}
		if(session.getAttribute("email")==null&&session.getAttribute("standard")==null&&session.getAttribute("allow")==null) {
			/*response.sendRedirect("index.jsp");*/
			System.out.println("i am Enetered in worng way");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
			rd.forward(request, response);
		}
		String email=(String)session.getAttribute("email");
		String standard=(String)session.getAttribute("standard");
		String puzzlename=(String)request.getParameter("puzzlename");
		int size=Integer.parseInt(request.getParameter("size"));
		String username=(String)session.getAttribute("username");
		
		int count=0;
		for(int i=0;i<size;i++){
            String question=request.getParameter("question"+i);
            String ans=request.getParameter("ans"+i);
            int mark=EvaluatePuzzleAnswer.getMarks(question,ans,standard,puzzlename);
            count+=mark;
        }
		System.out.println(count);
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

	    String dateandtime = myDateObj.format(myFormatObj);
		try
	      {
	           Class.forName("com.mysql.jdbc.Driver"); 
	           Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");
	          
	          PreparedStatement pstmt=con.prepareStatement("update puzzle set marks= ?,finishtime = ?,totalmarks = ? where email = ? and standard = ? and puzzleName = ? ");
	          pstmt.setInt(1, count);
	          pstmt.setString(2, dateandtime);
	          pstmt.setInt(3,size);
	          pstmt.setString(4,email);  
	          pstmt.setString(5,standard);
	          pstmt.setString(6, puzzlename); 
	          pstmt.executeUpdate();
	          /*PreparedStatement in=con.prepareStatement("update puzzle set finishtime = ? where email = ? and standard = ? and puzzleName = ? ");
	          in.setString(1, dateandtime);
	          in.setString(2,email);  
	          in.setString(3,standard);
	          in.setString(4, puzzlename);
	          in.executeUpdate();
	          PreparedStatement ps=con.prepareStatement("update puzzle set totalmarks = ? where email = ? and standard = ? and puzzleName = ? ");
	          ps.setInt(1,size);
	          ps.setString(2,email);  
	          ps.setString(3,standard);
	          ps.setString(4, puzzlename);
	          ps.executeUpdate();*/
	          
	          con.close(); 
	      }
		    
	      catch(Exception e)
	      {
	          e.printStackTrace();
	          
	      }
		session.removeAttribute("allow");
		response.sendRedirect("Home.jsp");
	}

}
