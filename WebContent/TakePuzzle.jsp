<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@ page import="java.time.LocalDateTime" %> 
<%@ page import="java.time.format.DateTimeFormatter" %> 

<%@page import="com.main.Questions" %>
<jsp:useBean id="pDAO" class="com.main.FetchPuzzle" scope="page"/>
<%
if(session.getAttribute("sessionID")==null){
	response.sendRedirect("index.html");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Take Exam</title>
	<!-- CSS only -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script> -->
	<script>
	function startTime() {
		  var today = new Date();
		  var h = today.getHours();
		  var m = today.getMinutes();
		  var s = today.getSeconds();
		  m = checkTime(m);
		  s = checkTime(s);
		  document.getElementById('clock').innerHTML =
		  h + ":" + m + ":" + s;
		  var t = setTimeout(startTime, 500);
		}
		function checkTime(i) {
		  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
		  return i;
		}
		
	</script>
</head>
<body onload="startTime()">
                 
                 <div class="container">
                         <% 
                         if(session.getAttribute("allow")==null){
                        	 response.sendRedirect("PuzzleChooser.jsp");
                         }
                        %>
                       <div class="row">
                       <div class="col-md-12">
                       <h1 class="jumbotron p-2 text-center text-info">Puzzle Portal :&nbsp&nbsp<span class="text-warning"><%=request.getParameter("puzzlename") %> </span><i class="text-primary">Time :</i> <i id="clock" class="text-danger"></i></h1>
                       </div>
                       </div>
                       <div class="row">
                       <div class="col-md-9"></div>
                       <div class="col-md-3">
                       <b><p id="clock"></p></b>
                       </div>
                       </div>
                        <form action="PuzzleEvaluate" method="post">
                       <%
                       ArrayList list=pDAO.getQuestions((String) session.getAttribute("email"),(String)session.getAttribute("standard"),request.getParameter("puzzlename"));
                       Questions question;
                       %>
                       <input type="hidden" name="size" value="<%=list.size()%>">
                      
                       <%
                       for(int i=0;i<list.size();i++){
                           question=(Questions)list.get(i);
                       %>
                       <center>
                       <div class="card w-100">
                       <h3 class="card-header"><span><b><%=i+1 %>)</b>&nbsp</span><%=question.getQuestion() %></h3>
                        <div class="card-body ">
                             <div class="form-check">
                             <h5 class="card-title ">
                             <input  class="form-check-input" type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt1()%>"/><label class="form-check-label" for="c1<%=i%>"><%=question.getOpt1()%></label></h5>
                             </div>
                             <div class="form-check ">
                             <h5 class="card-title"><input  class="form-check-input" type="radio" id="c2<%=i%>" name="ans<%=i%>" value="<%=question.getOpt2()%>" /><label class="form-check-label"  for="c2<%=i%>"><%=question.getOpt2()%></label></h5>
                             </div>
                             <div class="form-check ">
                             <h5 class="card-title"><input  class="form-check-input" type="radio" id="c3<%=i%>" name="ans<%=i%>" value="<%=question.getOpt3()%>" /><label class="form-check-label" for="c3<%=i%>"><%=question.getOpt3()%></label></h5> 
                             </div>
                             <div class="form-check ">
                             <h5 class="card-title"><input  class="form-check-input" type="radio"  id="c4<%=i%>" name="ans<%=i%>" value="<%=question.getOpt4()%>"/><label class="form-check-label" for="c4<%=i%>" ><%=question.getOpt4()%></label></h5>
                             </div>
                           </div>
                         </div>

                       <input type="hidden" name="question<%=i%>" value="<%=question.getQuestion()%>">
                         &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       <%
                       }
                       %>
                     
              <input type="hidden" name="puzzlename" value="<%=request.getParameter("puzzlename")%> " >
              <div class="row p-4">
              <div class="col-md-3"></div>
              <div class="col-md-6 text-center">
              <input type="submit" class="btn btn-success btn-lg btn-block rounded-pill" value="Done">
              </div>
              <div class="col-md-3"></div>
              </div>
               
            </form>
            </center>
            </div>
        <%
        LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

	    String dateandtime = myDateObj.format(myFormatObj);
		try
	      {
	           Class.forName("com.mysql.jdbc.Driver"); 
	           Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");
	           int len=list.size();
	          PreparedStatement pstmt=con.prepareStatement("insert into puzzle values(?,?,?,?,?,?,?,?,?)");
	          pstmt.setString(1,(String)session.getAttribute("username"));
	          pstmt.setString(2,(String)session.getAttribute("email"));  
	          pstmt.setString(3,(String)session.getAttribute("standard"));
	          pstmt.setString(4, request.getParameter("puzzlename"));
	          pstmt.setInt(5,1);
	          pstmt.setInt(6, 0);
	          pstmt.setInt(7,0);  
	          pstmt.setString(8,dateandtime);
	          pstmt.setString(9,dateandtime);
	          pstmt.executeUpdate();
	          con.close(); 
	      }
		    
	      catch(Exception e)
	      {
	          e.printStackTrace();
	          
	      }
         
         %>
               
</body>
</html>
