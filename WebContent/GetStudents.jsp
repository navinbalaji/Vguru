<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*" %>
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
<meta charset="ISO-8859-1">
<title></title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
	
      <!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>

<!-- Custom Styling -->
  
  <style>
  a {
    text-decoration: none !important;
    }
  </style>
  
</head>

<body>

          <!--  Banner -->
          
    <div class="container-fluid">
      	<div class="row">
      		<div class="col">
      			<h1 class="jumbotron p-2 text-center"><a class="float-left" href="AdminHome.jsp"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbspBack</a>Student's</h1>
                 <h1 class="text-muted text-center"><%=request.getParameter("Allstudents")%> Standard Students</h1>
      		</div>
      </div>
      </div>

       <!--  Students -->


   <div class="container">
   	<div class="row">
   	 <div class="col">
   	      <table class="table table-striped">
                      <thead class="thead-dark">
                         <tr>
                           <th scope="col">S.NO</th>
                           <th scope="col">Name</th>
                           <th scope="col">Email</th>
                           </tr>
                       </thead>
                       <tbody>
                          <% 	
      	                     try{ 
      		                   int i=1;
                                Class.forName("com.mysql.jdbc.Driver");  
                                Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");      
                                PreparedStatement ps=con.prepareStatement("select Firstname,Lastname,email from users where Standard = ? ORDER BY Firstname ASC ");
                                ps.setString(1,request.getParameter("Allstudents"));
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
      	                    %>
                           <tr>
                            <th scope="row"><%=i++%></th>
                            <td><%=rs.getString("Firstname")%> <%=rs.getString("Lastname")%></td>
                            <td><%=rs.getString("email")%></td>
                            </tr>
                           <%
                           }
                                con.close(); 
      	                     }
                           catch(Exception e){
    	                    System.out.println(e);
                            }
                            %>
                      </tbody>
              </table>
   	 </div>
   	</div>
   </div>

</body>
</html>