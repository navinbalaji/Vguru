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
	<title>Profile</title>
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
<style type="text/css">
   body{
 background: #ADA996;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #EAEAEA, #DBDBDB, #F2F2F2, #ADA996); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
   } 
  </style>

</head>

<body>
     <div class="container-fluid">
      	<div class="row">
      		<div class="col">
      			<h1 class="jumbotron p-2 text-center"><a class="float-left" href="AdminHome.jsp"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbspBack</a>Profile</h1>
      			
      	<%
      		String email=(String)request.getParameter("studentProfile");
      	try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com:3306/b0wwyqhyt7t9fqaabyej?useSSL=false","uqts9igealqykn9n","WeuumU7W09PwJIvXiU9f");     
            PreparedStatement ps=con.prepareStatement("select Firstname,Lastname,email,DateofBirth,Gender,BloodGroup,Standard,Address,City,State,Zip,Phonenumber,Fathername,Mothername,parentsnumber,Parentsemail from users where email = ?");  
            ps.setString(1,email);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
      	%>
               <h1 class="text-muted text-center"><%= rs.getString("Firstname")%> Standard - <%= rs.getString("Standard")%></h1>
      		</div>
      </div>
      </div>
      
<div class="container">
     <form method="#" action="#">
  <div class="form-row">
    <div class="col-md-4 mb-3 md-form">
      <label for="First name">First name</label>
      <input type="text" class="form-control" id="First name" value="<%= rs.getString("Firstname")%>" name="firstname" readonly >
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Last name">Last name</label>
      <input type="text" class="form-control" id="Last name" value="<%= rs.getString("Lastname")%>" name="lastname" readonly>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Username">E-Mail</label>
      <input type="email" class="form-control" id="Username"  name="email" value="<%= rs.getString("email")%>" aria-describedby="inputGroupPrepend23" readonly>
    </div>
  </div>
  <div class="form-row">
    <div class="col-md-4 mb-4 md-form">
      <label for="Date of Birth">Date of Birth</label>
      <input type="date" class="form-control" id="Date of Birth" name="dateofbirth" value="<%= rs.getString("DateofBirth")%>" readonly>
    </div>
    <div class="col-md-4 mb-4 md-form">
      <label for="Gender">Gender</label>
      <input type="text" class="form-control" id="Gender" name="gender" value="<%= rs.getString("Gender")%>" readonly>
    </div>
    <div class="col-md-4 mb-4 md-form">
      <label for="Blood Group">Blood Group</label>
      <input type="text" class="form-control" id="Blood Group" name="bloodgroup" value="<%= rs.getString("BloodGroup")%>" readonly>
    </div>
  </div>

 <div class="form-row">
    <div class="col-md-12 mb-3 md-form">
      <label for="Address">Address</label>
      <input type="text" class="form-control" id="Address" name="address" value="<%= rs.getString("Address")%>" readonly>
    </div>
  </div> 

<div class="form-row">
    <div class="col-md-4 mb-3 md-form">
      <label for="City">City</label>
      <input type="text" class="form-control" id="City" name="city"  value="<%= rs.getString("City")%>" readonly>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="State">State</label>
      <input type="text" class="form-control" id="State" name="state" value="<%= rs.getString("State")%>" readonly>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Zip">Zip</label>
      <input type="text" class="form-control" id="Zip"  name="zip"  value="<%= rs.getString("Zip")%>" readonly>
    </div>
  </div> 


<div class="form-row">
    <div class="col-md-4 mb-3 md-form">
      <label for="Phone Number">Phone Number</label>
      <input type="text" class="form-control" id="Phone Number" maxlength="10" name="phonenumber" value="<%= rs.getString("Phonenumber")%>" readonly>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Father Name">Father Name</label>
      <input type="text" class="form-control" id="Father Name"  name="fathername" value="<%= rs.getString("Fathername")%>" readonly>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Mother Name">Mother Name</label>
      <input type="text" class="form-control" id="Mother Name" name="mothername" value="<%= rs.getString("Mothername")%>" readonly>
    </div>
  </div> 


  <div class="form-row">
    <div class="col-md-6 mb-3 md-form">
      <label for="Parents PhoneNumber">Parent's PhoneNumber</label>
      <input type="text" class="form-control" id="Parents PhoneNumber"  maxlength="10" name="parentsphonenumber" value="<%= rs.getString("parentsnumber")%>" readonly>
    </div>
    <div class="col-md-6 mb-3 md-form">
      <label for="parentsemail">Parent's Email</label>
      <input type="email" class="form-control" id="parentsemail" name="parentsemail" value="<%= rs.getString("Parentsemail")%>" readonly>
    </div>
  </div>
    <%
    }
            con.close(); 
      	}
    catch(Exception e){
    	System.out.println(e);
    }
       %>

</form>
  </div> 
          
</body>
</html>