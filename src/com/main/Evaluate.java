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

@WebServlet("/Evaluate")
public class Evaluate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Evaluate() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
    	HttpSession session=request.getSession();
		if(session.getAttribute("email")==null&&session.getAttribute("standard")==null&&session.getAttribute("allow")==null) {
			/*response.sendRedirect("index.jsp");*/
			System.out.println("i am Enetered in worng way");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
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
		String subjectName=(String)request.getParameter("subjectName");
		String testName=(String)request.getParameter("testName");
		int size=Integer.parseInt(request.getParameter("size"));
		//String username=(String)session.getAttribute("username");
		
		int count=0;
		for(int i=0;i<size;i++){
            String question=request.getParameter("question"+i);
            String ans=request.getParameter("ans"+i);
            int mark=EvaluateAnswer.getMarks(question,ans,standard,subjectName,testName);
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
	          
	          PreparedStatement pstmt=con.prepareStatement("update test set marks= ? ,finishtime = ?,totalmarks= ? where email = ? and standard = ? and subject = ? and testname = ? ");
	          pstmt.setInt(1, count);
	          pstmt.setString(2, dateandtime);
	          pstmt.setInt(3, size);
	          pstmt.setString(4,email);  
	          pstmt.setString(5,standard);
	          pstmt.setString(6, subjectName); 
	          pstmt.setString(7, testName); 
	          pstmt.executeUpdate();
	         /* PreparedStatement in=con.prepareStatement("update test set finishtime = ? where email = ? and standard = ? and subject = ? and testname = ? ");
	          in.setString(1, dateandtime);
	          in.setString(2,email);  
	          in.setString(3,subjectName);
	          in.setString(4, subjectName); 
	          in.setString(5, testName); 
	          in.executeUpdate();
	          PreparedStatement ps=con.prepareStatement("update test set totalmarks = ? where email = ? and standard = ? and subject = ? and testname = ? ");
	          ps.setInt(1,size);
	          ps.setString(2,email);  
	          ps.setString(3,standard);
	          ps.setString(4, subjectName); 
	          ps.setString(5, testName); 
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
