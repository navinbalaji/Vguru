<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
if(session.getAttribute("sessionID")==null){
	response.sendRedirect("index.html");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
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
                   <li class="nav-item active">
                     <a class="nav-link font-weight-bolder" style="font-size: 24px;" href="Home.jsp">Home<span class="sr-only y">(current)</span></a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link font-weight-bolder " data-toggle="tooltip" data-placement="top" title="To Learn All Lesson" style="font-size: 24px;" href="Lesson.jsp">Lesson</a>
                   </li>
                   <li class="nav-item">
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
    
     <!--  Banner -->
    <div class="container">
       <div class="row m-2">
         <div class="col-md-9"><h3 class="text-center">Welcome: <%=session.getAttribute("username")%></h3><h3 class="float-left">Standard : <%=session.getAttribute("standard")%></h3></div>
         <div class="col-md-3"><i>LastLogin</i> : <b><%=session.getAttribute("LastLogin")%></b></div>
       </div>
    </div>
    
    <!--  Quotes -->
       <div class="container p-2">
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
    
    
    <%
    String OverallInfomation="";
    String OverallTime="";
    String SpecificInformation="";
    String SpecificTime="";
    try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");  
        PreparedStatement ps=con.prepareStatement("select info,date from information where standard= ? ");  
        ps.setString(1,"ForAll");
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
        OverallInfomation=rs.getString(1);
        OverallTime=rs.getString("date");
        }
        
        PreparedStatement in=con.prepareStatement("select info,date from information where standard= ? ");  
        in.setString(1,(String)session.getAttribute("standard"));
        ResultSet r=in.executeQuery();
        while(r.next())
        {
        	SpecificInformation=r.getString(1);
        	SpecificTime=r.getString("date");
        }
        con.close(); 
    }
    catch(Exception e){
    	System.out.println(e);
    }
    
    %>
    <!-- Overall -->
    
    <div class="container p-2">
         <div class="row">
           <div class="col">
             <div class="card bg-secondary rounded">
               <div class="card-body">
               <h5 class="card-title text-info"><i>Overall Information</i></h5>
                 <h3><%=OverallInfomation%></h3>
                  <h5 class="float-right text-dark"><%=OverallTime%></h5>
               </div>
             </div>
           </div>
         </div>
       </div>
       
       
   <!-- Information -->
      
      <div class="container p-2">
         <div class="row">
           <div class="col">
             <div class="card bg-warning rounded">
               <div class="card-body">
                <h5 class="card-title text-info"><i>Standard <%=session.getAttribute("standard")%> Information</i></h5>
                 <h3><%=SpecificInformation %></h3>
                  <h5 class="float-right text-dark"><%=SpecificTime%></h5>
               </div>
             </div>
           </div>
         </div>
       </div>
    
    
</body>
</html>