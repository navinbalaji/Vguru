<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("sessionID")==null){
	response.sendRedirect("index.html");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Exam Chooser</title>
       <!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
        function changet()
        {
            var subject = $("#count").val();
            $.ajax({
                type: "POST",
                url: "ChooseTest.jsp",
                data: "subject_id="+subject,
                cache: false,
                success: function(response)
                {
                    $("#testname").html(response);
                }
            });
           
        }
        
      function sub(){
    	  var subjectname = $('#count').val();
          var testName=$('#testname').val();
         
          document.getElementById("sName").value = subjectname;
          document.getElementById("tName").value = testName; 
      }
      
      $(function run () {
    	  $('[data-toggle="tooltip"]').tooltip();
    	})
      
        </script>

<style>

.border{
    border-width:5px !important;
}
.mycontrol{
 border-width:2px !important;
}
</style>

    </head>

    <body>
    
      <!--  NavBar -->
     <div class="container-flex">
       <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand text-primary" href="#"><h1>VGURU</h1></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                   <span class="navbar-toggler-icon"></span>
                 </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
              <ul class="navbar-nav">
                   <li class="nav-item">
                     <a class="nav-link font-weight-bolder" style="font-size: 24px;" href="Home.jsp">Home<span class="sr-only y">(current)</span></a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link font-weight-bolder " data-toggle="tooltip" data-placement="top" title="To Learn All Lesson" style="font-size: 24px;" href="Lesson.jsp">Lesson</a>
                   </li>
                   <li class="nav-item active">
                     <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="To Take the Test" style="font-size: 24px;" href="ExamChooser.jsp">Test</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="To Take the Puzzles" style="font-size: 24px;" href="PuzzleChooser.jsp">Puzzle</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="View Your Profile" style="font-size: 24px;" href="Profile.jsp">Profile</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link font-weight-bolder" data-toggle="tooltip" data-placement="top" title="View All Your Reports" style="font-size: 24px;" href="Report.jsp">Report</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link font-weight-bolder " style="font-size: 24px;" href="StudentLogout.jsp"><span class="text-danger">Logout</span></a>
                   </li>
              </ul>
            </div>
        </nav>
    </div>
    
    
    
     <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="jumbotron text-center text-primary header p-2">Exam Page</h1>
                </div>
            </div>
        </div>
    
    
                       <%
                         String allowance="notallow";
                         session.setAttribute("allow",allowance);
                         %>
     
      <div class="container">
            <div class="card w-100 border border-info">
                <div class="card-body">
                <div class="row">
              <div class="col-md-12">
                  <form  method="post" action="ExamAuthChecker">
                  
                   <div class="form-group">
                   <center>
            <label class="col-md-3 control-label"><h3>Subject Name</h3></label>
                <div class="col-md-3 p-4">
                    <select class="form-control mycontrol border-primary" id="count" onchange="changet()" required>
                        <option value="" selected="selected"> - select Subject - </option>
                        <%
                             String standard=(String)session.getAttribute("standard");
                        String dburl="jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false"; 
                        String dbusername="uqts9igealqykn9n"; 
                        String dbpassword="WeuumU7W09PwJIvXiU9f";
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver"); 
                                Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); 
                                
                                PreparedStatement pstmt=null ; 
                                
                                pstmt=con.prepareStatement("SELECT * FROM testsubject where standard= ?");
                                  pstmt.setString(1,standard);
                                ResultSet rs=pstmt.executeQuery(); 
                                while(rs.next())
                                {
                                %>
                                    <option value="<%=rs.getString("subject")%>">
                                        <%=rs.getString("subject")%>
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

  <label class="col-md-2 control-label"><h3>Test Name</h3></label>
                <div class="col-md-3 p-4">
                    <select class="form-control mycontrol border-primary" id="testname" required>
                        <option selected="selected" value="no"> - select Test - </option>        
                    </select>
                </div>
              
             
                <input type="hidden" id="sName" name="subjectname">
                <input type="hidden" id="tName" name="testname">
                 <div class="row p-2">
               <div class="col-md-12 p-2">
                   <input type="submit" class="btn btn-warning btn-lg" onclick="sub()" value="submit">
               </div>
                 </div>

                </form> 
         <!--       </center> -->
              </div>
          </div>
        </div>
                </div>
            </div>
            </center>
    </body>
</html>
