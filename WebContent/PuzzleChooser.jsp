<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
 <%
if(session.getAttribute("sessionID")==null){
	response.sendRedirect("index.html");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Puzzle Chooser</title>
<!-- CSS only -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

      <!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
  <!-- Custom Styling -->
  
  <style>
  a {
    text-decoration: none !important;
    }
  </style>

</head>
<body>

          <!-- Banner -->
    <div class="container-flex">
     <div class="row">
       <div class="col-md-12">
       <h1 class="jumbotron text-center p-2"><a class="float-left" href="Home.jsp"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbspBack</a>Puzzle Chooser</h1>
       </div>
     </div>
    </div>
    
           <!--  Puzzle Fetching -->

<%
     String standard=(String)session.getAttribute("standard");
String allowance="notallow";
session.setAttribute("allow",allowance);
     try{  
           Class.forName("com.mysql.jdbc.Driver");  
           Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");     
           PreparedStatement ps=con.prepareStatement("select distinct puzzleName from puzzlequestions where standard = ? ");  
           ps.setString(1,standard);
           ResultSet rs=ps.executeQuery();
           String temp="";
           String createdDate="";
           while(rs.next())
           {
        	   temp=rs.getString("puzzleName");
%>

                <div class="container text-center ">
                    <div class="row">
                       <div class="col-md-12">
                           <div class="card border  border-primary">
                               <div class="card-body">
                                  <h3 class="card-title"><%=rs.getString("puzzleName") %></h3> 
                                   <form action="PuzzleAuthChecker" method="post"><input type="hidden" value="<%=rs.getString("puzzleName") %>" name="puzzlename" ><input type="submit" class="btn btn-primary" value="Take Quiz"></form>
                               </div>
                                <%  PreparedStatement in=con.prepareStatement("select createdDate from puzzlequestions where standard = ? and puzzleName = ? ");
                                    in.setString(1,standard);
                                    in.setString(2,temp);
                                    ResultSet r=in.executeQuery();
                                    while(r.next())
                                    {
    	                            createdDate=r.getString("createdDate");
                                    }
                                 %>
                                     <div class="card-footer text-muted">
    	                                Posted ON&nbsp:&nbsp<%=createdDate%>
                                     </div> 
                           </div>
                      </div>
                  </div>
               </div>
     &nbsp&nbsp&nbsp&nbsp
    
   <%
     }
           con.close(); 
}
catch(Exception e) {
  System.out.println(e);
}
    %>

</body>
</html>