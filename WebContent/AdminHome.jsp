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
	<title>Mentor Home</title>
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
  <style>
  form{
display:none;
}
  </style>
  <script type="text/javascript">
		$(function run () {
  $('[data-toggle="tooltip"]').tooltip();
})
	</script>
	<script>
  $(document).ready(
   function show(){
          $.getJSON('https://type.fit/api/quotes',function(data){
         var num=Math.floor(Math.random() * 1643);
         document.getElementById("quote").innerHTML=data[num].text;
         document.getElementById("author").innerHTML=data[num].author;
       });
  }
);
</script>
<script>
$(document).ready(function() {
	  $("#profileButton").click(function() {
	    $("#profile").toggle();
	  });
	  $("#reportButton").click(function() {
		    $("#report").toggle();
		  });
	  $("#informationButton").click(function() {
		    $("#information").toggle();
		  });
	  $("#studentButton").click(function() {
		    $("#student").toggle();
		  });  
	});
</script>
<script>

function getSelect(){	
	var standard = $('#standard').val();  
    document.getElementById("standard").value = standard;
}

function getStudents(){	
	var student = $('#students').val();  
    document.getElementById("getstudent").value = student;
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
      <li class="nav-item active">
        <a class="nav-link font-weight-bolder" style="font-size: 24px;" href="AdminHome.jsp">Home<span class="sr-only y">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bolder " data-toggle="tooltip" data-placement="top" title="AddLesson to All Standards" style="font-size: 24px;" href="AddLesson.jsp">AddLesson</a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="AddQuestion to All Standards" style="font-size: 24px;" href="AddQuestion.jsp">AddQuestion</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="AddPuzzle to All Standards" style="font-size: 24px;" href="AddPuzzle.jsp">AddPuzzle</a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bolder " style="font-size: 24px;" href="MentorLogout.jsp"><span class="text-danger">Logout</span></a>
      </li>
    </ul>
  </div>
</nav>
</div>

         <!-- Header -->
          <div class="container">
             <div class="row">
	             <div class="col-md-12">
		             <h1 class="jumbotron p-2 text-center"><%=session.getAttribute("mentorName")%></h1>
	              </div>
             </div>
          </div>

     <!-- Banner -->
      <div class="container">
        <div class="row">
          <div class="col">
            <h5 class="float-left"><b>Handling : </b><%=session.getAttribute("mentorStandard")%><b> Standard</b></h5>
            <h5 class="float-right"><b>LastLogin : </b><%=session.getAttribute("mentorLastLogin")%></h5>
          </div>
        </div>
      </div>




         <!--  Quotes -->
       <div class="container p-3">
         <div class="row">
           <div class="col">
             <div class="card bg-info text-white rounded">
               <div class="card-body">
                 <h3 id="quote"></h3>
                  <h3 id="author" class="float-right text-dark"></h3>
               </div>
             </div>
           </div>
         </div>
       </div>


   <!-- Actions -->
       <div class="container p-5">
         <div class="row">
           <div class="col-md-3 p-2">
               <button class="btn btn-success btn-block btn-lg" id="profileButton" >Student Profile</button>
           </div>
           <div class="col-md-3 p-2">
               <button class="btn btn-success btn-block btn-lg" id="studentButton">Students</button>
           </div>
           <div class="col-md-3 p-2">
                <button class="btn btn-success btn-block btn-lg"  id="reportButton">Report</button>
           </div>
           <div class="col-md-3 p-2">
               <button class="btn btn-success btn-block btn-lg" id="informationButton">Information</button>
           </div>
         </div>
       </div>
   
     
        <!-- Profile -->
       <div class="container p-2">
         <div class="row">
          <div class="col-md-3"></div>
           <div class="col-md-6">
           <form id="profile" method="post" action="StudentProfileView.jsp">
           <input type="email" class="form-control" name="studentProfile" placeholder="Enter Student Email ID" required>
           <br>
           <div class="form-row text-center">
            <div class="col">
             <input type="submit" class="btn btn-primary" value="Get Profile">
            </div>
           </div>
           </form>
           </div>
         </div>
       </div>
       
       
        
          <!--  student -->
          
          <div class="container p-2">
           <div class="row text-center">
               <div class="col">
                   <form id="student" action="GetStudents.jsp" method="post">
                <div class="form-row text-center">
                <div class="col-md-3"></div>
                    <div class="col-md-6">
                            <select id="students" class="mdb-select md-form form-control" name="student" required>
                                    <option value="" disabled selected>Choose Standard</option>
                                    <option value="PreKG">Pre-KG</option>
                                    <option value="LKG">LKG</option>
                                    <option value="UKG">UKG</option>
                                    <option value="1">1 Standard</option>
                                    <option value="2">2 Standard</option>
                                    <option value="3">3 Standard</option>
                                    <option value="4">4 Standard</option>
                                    <option value="5">5 Standard</option>
                                    <option value="6">6 Standard</option>
                                    <option value="7">7 Standard</option>
                                    <option value="8">8 Standard</option>
                                    <option value="9">9 Standard</option>
                                    <option value="10">10 Standard</option>
                                    <option value="11">11 Standard</option>
                                    <option value="12">12 Standard</option>
                            </select>
                      </div>
                      </div>
                      <br>
                      <input type="hidden" id="getstudent" name="Allstudents" >
                 <input type="submit" class="btn btn-primary btn-large" onclick="getStudents()" value="Get Students"> 
              </form>
               </div>
           </div>
        </div>
        
        
        
        
        
        
       <!-- Report -->
       <div class="container p-2">
         <div class="row">
          <div class="col-md-3"></div>
           <div class="col-md-6">
           <form id="report" action="StudentReportView.jsp">
           <input type="email" class="form-control" name="studentReport" placeholder="Enter Student Email ID" required>
           <br>
           <div class="form-row text-center">
            <div class="col">
             <input type="submit" class="btn btn-primary" value="Get Report">
            </div>
           </div>
           </form>
           </div>
         </div>
       </div>
       
       <!--  Information -->
       
        <div class="container p-2">
           <div class="row">
           <form id="information" action="InformationServlet" method="post">
                <div class="form-row p-2">
                    <div class="col-md-3">
                      <div class="form-group">
                            <select id="standard" class="mdb-select md-form form-control" name="standard" required>
                                    <option value="" disabled selected>Choose Standard</option>
                                    <option value="ForAll">ALL STUDENTS</option>
                                    <option value="PreKG">Pre-KG</option>
                                    <option value="LKG">LKG</option>
                                    <option value="UKG">UKG</option>
                                    <option value="1">1 Standard</option>
                                    <option value="2">2 Standard</option>
                                    <option value="3">3 Standard</option>
                                    <option value="4">4 Standard</option>
                                    <option value="5">5 Standard</option>
                                    <option value="6">6 Standard</option>
                                    <option value="7">7 Standard</option>
                                    <option value="8">8 Standard</option>
                                    <option value="9">9 Standard</option>
                                    <option value="10">10 Standard</option>
                                    <option value="11">11 Standard</option>
                                    <option value="12">12 Standard</option>
                            </select>
                      </div>
                    </div>
                    <div class="col-md-9">
                       <textarea class="border border-info rounded form-control" placeholder="Enter Information" name="information" rows="5" cols="150" required></textarea>
                    </div>
                 </div>
                 <div class="form-row text-center p-2">
                 <div class="col">
                 <input type="hidden" id="standard" name="standard">
                 <input type="submit" class="btn btn-primary btn-large" onclick="getSelect()" value="Information Post"> 
                 </div>
                 </div>
              </form>
           </div>
        </div>
       
       
      
       

</body>
</html>