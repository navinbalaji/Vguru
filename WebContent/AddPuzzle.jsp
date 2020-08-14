<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies. 
    if(session.getAttribute("mentorName")==null&&session.getAttribute("mentorEmail")==null&&session.getAttribute("mentorStandard")==null&&session.getAttribute("mentorLastLogin")==null){
    	response.sendRedirect("Mentorlogin.html");
    }
    %>
<!DOCTYPE html>
<html>
<head>
	<title>Add Puzzle</title>
	<!-- CSS only -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<style type="text/css">
   body{
 background: #ADA996;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


   } 
  </style>
  
  <script type="text/javascript">
		$(function run () {
  $('[data-toggle="tooltip"]').tooltip();
})
	</script>
<script type="text/javascript">
      function sub(){
        var standard = $('#count').val();
          var subject=$('#Subject').val();
         
          document.getElementById("standard").value = standard;
          document.getElementById("subj").value = subject; 
      }
        </script>


</head>
<body>
<div class="container-flex">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand text-primary" href="#"><h1>VGURU</h1></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link font-weight-bolder" style="font-size: 24px;" href="AdminHome.jsp">Home<span class="sr-only y">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bolder " data-toggle="tooltip" data-placement="top" title="AddLesson to All Standards" style="font-size: 24px;" href="AddLesson.jsp">AddLesson</a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="AddQuestion to All Standards" style="font-size: 24px;" href="AddQuestion.jsp">AddQuestion</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="AddPuzzle to All Standards" style="font-size: 24px;" href="AddPuzzle.jsp">AddPuzzle</a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bolder " style="font-size: 24px;" href="MentorLogout.jsp"><span class="text-danger">Logout</span></a>
      </li>
    </ul>
  </div>
</nav>
</div>
       <div class="container">
             <div class="row">
	             <div class="col-md-12">
		             <h1 class="text-center ">Add Puzzle Portal</h1>
	                     </div>
             </div>
       </div>


      <div class="container">
      	<div class="row">
	                 <form action="SubmitPuzzle" method="post" >
                        <div class="form-row">
                             <div class="form-group">
                               <div class="col">
                                 <label for="Standard" class="font-weight-bolder" >Standard</label>
                                    <select class="form-control" id="count" required>
                        <option value="" selected="selected"> - select Standard - </option>
                        <%
                        String dburl="jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false"; 
                        String dbusername="uqts9igealqykn9n"; 
                        String dbpassword="WeuumU7W09PwJIvXiU9f";
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver"); 
                                Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); 
                                
                                PreparedStatement pstmt=null ; 
                                
                                pstmt=con.prepareStatement("SELECT distinct standard FROM testsubject");
                                ResultSet rs=pstmt.executeQuery(); 
                                while(rs.next())
                                {
                                %>
                                    <option value="<%=rs.getString("standard")%>">
                                        <%=rs.getString("standard")%>
                                    </option>
                                <%
                                }
                                con.close(); 
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
                    </select>
                             </div>
                             </div>
                             
                               <!--  Add Puzzle Portal -->
                             <div class="form-group">
                             	<div class="col">
                                <label for="test" class="font-weight-bolder" >Puzzle Name</label>
                                <input type="text" class="form-control" id="test" name="puzzlename" placeholder="Enter Puzzle Name" required>
                             </div>
                             </div>
                             
                             </div>
                            
                              <!-- Question  -->
                           
                           <div class="form-row">
                            <div class="form-group">
                           	<div class="col">
                              <label for="que" class="font-weight-bolder" >Enter Puzzle</label>
                              <textarea name="question" class="form-control" id="que" rows="6" cols="150" placeholder="Enter the Puzzle" required></textarea>
                            </div>
                           </div>
                           </div>
                           
                          <!--  Options -->
                           
                    <div class="form-row p-2">
                           	<div class="form-group">
                              <div class="col">
                              <label for="op1" class="font-weight-bolder" >OPTION-1</label>
                              <input type="text"  class="form-control" name="option1" id="op1" placeholder="OPTION-1" required>
                            </div>
                            </div>
                            
                            
                           	<div class="form-group">
                              <div class="col">
                               <label for="op2" class="font-weight-bolder" >OPTION-2</label>
                              <input type="text" class="form-control" name="option2"  id="op2" placeholder="OPTION-2" required>
                            </div>
                            </div>
                            
                            
                           	<div class="form-group">
                              <div class="col">
                               <label for="op3" class="font-weight-bolder" >OPTION-3</label>
                              <input type="text" class="form-control" name="option3" id="op3"  placeholder="OPTION-3" required>
                            </div>
                            </div>
                            
                            
                           	<div class="form-group">
                              <div class="col">
                               <label for="op4" class="font-weight-bolder" >OPTION-4</label>
                              <input type="text" class="form-control" name="option4" id="op4" placeholder="OPTION-4"
                              required>
                            </div>
                            </div>
                           
                 </div>
                         
                          <!--     correct Answer -->
                         <div class="form-group">
                           	<div class="col-7">
                              <label for="ans" class="font-weight-bolder" >Correct Answer</label>
                           		<input type="text" class="form-control" name="correctanswer" id="ans" placeholder="Correct Answer" required>
                           	</div>
                           </div>
                           
                            <input type="hidden" id="standard" name="chstandard">
                            <input type="hidden" id="subj" name="chsubject">
                            
                           <!--  Submit -->
                           
                           <div class="form-group">
                           <div class="col-12 text-center">
                              <input type="submit" class="btn btn-success btn-lg" onclick="sub()" value="submit">
                           </div>
                            </div>
                            
                   </form>
              </div>
      </div>
</body>
</html>