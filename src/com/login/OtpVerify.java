package com.login;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OtpVerify")
public class OtpVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public OtpVerify() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index.html");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter write=response.getWriter();
		response.setContentType("text/html");  
		String userEmailId=request.getParameter("email");
	     System.out.println(userEmailId);
	     String userEnteredOtp=request.getParameter("optnum");
	     System.out.println(userEnteredOtp);
	     String areValid=CheckOtp.validateOtp(userEmailId,userEnteredOtp);
	     System.out.println(areValid);
	     if(areValid.equals("OK")) {
	    	 write.println("YOU are Succesfully Verified");
	    	 RequestDispatcher rd=request.getRequestDispatcher("index.html"); 
	    	 rd.forward(request, response);
	     }else {
	    	 request.setAttribute("userEmail", userEmailId);
	    	 write.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\" integrity=\"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk\" crossorigin=\"anonymous\">");
	    	 write.println("<h2 class='text-center text-warning'>Worng OTP  Please Go Back and Enter Correct OTP</h2>");
	    	 
	    	 RequestDispatcher rd=request.getRequestDispatcher("OtpVerification.jsp"); 
	    	 rd.include(request, response);
	    	
	     }
	     
	}

}
