<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>OAuthorization Registration</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
  <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
	<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<script type="text/javascript">
		var check = function() {
  if (document.getElementById('Password').value ==document.getElementById('ConfirmPassword').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Password Matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Password Not Matching';
  }
}
</script>
</head>
<body>

<%
String email=(String)request.getAttribute("userAuthEmail");
%>
   <div class="container">
   	<div class="row">
   		<div class="col-md-12">
   			<h1 class="jumbotron text-center p-2">Student Registration Page</h1>
   		</div>
   	</div>
   </div>

   <div class="container">
<form action="oAuthorization" method="post">
  <div class="form-row">
    <div class="col-md-4 mb-3 md-form">
      <label for="First name">First name</label>
      <input type="text" class="form-control" id="First name" name="firstname" required>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Last name">Last name</label>
      <input type="text" class="form-control" id="Last name" name="lastname" required>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Username">Username</label>
      <input type="email" class="form-control" id="Username"  name="email" value="<%= email %>" readonly aria-describedby="inputGroupPrepend23">
    </div>
  </div>
  <div class="form-row">
    <div class="col-md-4 mb-4 md-form">
      <label for="Date of Birth">Date of Birth</label>
      <input type="date" class="form-control" id="Date of Birth" name="dateofbirth" required>
    </div>
    <div class="col-md-4 mb-4 md-form">
      <label for="Gender">Gender</label>
      <input type="text" class="form-control" id="Gender" name="gender" required>
    </div>
    <div class="col-md-4 mb-4 md-form">
      <label for="Blood Group">Blood Group</label>
      <input type="text" class="form-control" id="Blood Group" name="bloodgroup" required>
    </div>
  </div>

 <div class="form-row">
    <div class="col-md-4 mb-3 md-form">
        <select class="mdb-select md-form form-control" name="standard" required>
             <option value="" disabled selected>Choose your Standard</option>
             <option value="Pre-KG">Pre-KG</option>
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
    <div class="col-md-8 mb-3 md-form">
      <label for="Address">Address</label>
      <input type="text" class="form-control" id="Address" name="address" required>
    </div>
  </div> 

<div class="form-row">
    <div class="col-md-4 mb-3 md-form">
      <label for="City">City</label>
      <input type="text" class="form-control" id="City" name="city" required>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="State">State</label>
      <input type="text" class="form-control" id="State" name="state" required>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Zip">Zip</label>
      <input type="text" class="form-control" id="Zip"  name="zip" required>
    </div>
  </div> 


<div class="form-row">
    <div class="col-md-4 mb-3 md-form">
      <label for="Phone Number">Phone Number</label>
      <input type="text" class="form-control" id="Phone Number" maxlength="10" name="phonenumber" required>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Father Name">Father Name</label>
      <input type="text" class="form-control" id="Father Name"  name="fathername" required>
    </div>
    <div class="col-md-4 mb-3 md-form">
      <label for="Mother Name">Mother Name</label>
      <input type="text" class="form-control" id="Mother Name" name="mothername" required>
    </div>
  </div> 


  <div class="form-row">
    <div class="col-md-6 mb-3 md-form">
      <label for="Parents PhoneNumber">Parent's PhoneNumber</label>
      <input type="text" class="form-control" id="Parents PhoneNumber"  maxlength="10" name="parentsphonenumber" required>
    </div>
    <div class="col-md-6 mb-3 md-form">
      <label for="parentsemail">Parent's Email</label>
      <input type="email" class="form-control" id="parentsemail" name="parentsemail" required>
    </div>
 
  </div> 

  <div class="form-group">
    <div class="form-check pl-0">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck222" required>
      <label class="form-check-label" for="invalidCheck222">
        Agree to terms and conditions
      </label>
    </div>
  </div>
  <div class="form-row text-center">
  	<div class="col-md-12">
  		 <button class="btn btn-primary btn-sm" type="submit">Submit form</button>
  	</div>
  	 
  </div>
</form>
   </div>
</body>
</html>

