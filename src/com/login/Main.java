package com.login;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	    
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String IpAddress=request.getParameter("IpAddress");
	
	if(Validate.validate(username, password)){  
		
		if(Validate.AuthStatus(username,password)) {
			/* RequestDispatcher rd=request.getRequestDispatcher("Subject.jsp");  
		        rd.forward(request,response); */
			HttpSession session=request.getSession();
			session.setAttribute("sessionID", username);
		        if(TwoStepAuthSendEmail.sendEmail(username,IpAddress)) {
		        	response.sendRedirect("TwoFactorAuth.jsp");
		        	/*RequestDispatcher rd=request.getRequestDispatcher("TwoFactorAuth.jsp"); */ 
		        }
		        else {
		        	response.sendRedirect("index.html");
		        }
		}
		else {
			request.setAttribute("userEmail",username);
			RequestDispatcher rd=request.getRequestDispatcher("OtpVerification.jsp");  
	        rd.forward(request,response);
		}
     
    }  
    else{  
    	out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\" integrity=\"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk\" crossorigin=\"anonymous\">");
        out.print("<h1 class='text-center jumbotron p-4 text-danger'>Sorry Username or Password Wrong</h1>");
        RequestDispatcher rd=request.getRequestDispatcher("index.html");  
        rd.include(request,response);  
    }  
          
    out.close();
	}
	
	}	
	
