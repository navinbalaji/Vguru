<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Updation</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="Images/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" type="text/javascript"></script>
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
String email=(String)request.getAttribute("fpuserEmail");
%>


<div class="container-fluid">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5 h-100">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center"><b>Recovery Password Enter Portal</b></h5>
            <form  class="form-signin" action="PasswordUpdate" method="post">
              <div class="form-label-group">
                <input type="text" id="inputUserame" class="form-control" placeholder="Username" value="<%=email %>" name="fpuserEmail" readonly>
                <label for="inputUserame">UserName</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="otp" class="form-control" placeholder="Enter Recoverey OTP" name="fpotp" maxlength="7" required>
                <label for="otp">Enter Recoverey OTP</label>
              </div>
              <div class="form-label-group">
                <input type="password" name="fppass" class="form-control" id="Password" onkeyup='check();' placeholder="Password" required>
                <label for="Password">Password</label>
              </div>
              <div class="form-label-group">
                <input type="password" name="fpcpass"  class="form-control" id="ConfirmPassword" onkeyup='check();'  placeholder="Confirm password" required>
                <label for="ConfirmPassword">Confirm Password</label>
              </div>
              <div class="text-center">
              <span id='message'></span>
              </div>
              <br>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" >Update Password</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>