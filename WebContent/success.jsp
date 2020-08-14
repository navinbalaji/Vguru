<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Google Authentication Page</title>
<meta charset="utf-8">
<meta name="google-signin-client_id" content="995639186583-3qgtpn3713dqso146ah0gior04v600ar.apps.googleusercontent.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="assets/style.css">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
 <%
 String name=(String)request.getParameter("name");
 String email=(String)request.getParameter("email");
 String imageurl=(String)request.getParameter("imageurl");
 //String id=(String)request.getParameter("ID");
  %>


  <div class="container-fluid">
    <div class="row">
     <div class="col">
        <h1 class="jumbotron text-center p-4">Google Authorization Portal</h1>
     </div>
    </div>
  </div>
 <div class="container">
   <div class="row">
     <div class="col-md-6">
       <img src="<%=imageurl%>" class="img-fluid  w-100 h-75">
     </div>
     <div class="col-md-6">
      <br><br>
      <h3 class="text-center">Please Check Your Details</h3>
      <br><br>
              <form class="form-signin" action="Oauthentication" method="post">
              <div class="form-label-group">
              <label for="inputUserame"><b>Name</b> </label>
                <input type="text" id="inputUserame" class="form-control"  value="<%=name %>" name="oAuthName" readonly>
              </div>
              <br>
              <div class="form-label-group">
               <label for="inputemail"><b>Google Email</b></label>
                <input type="text" id="inputemail" class="form-control" value="<%=email %>" name="oAuthEmail" readonly>
              </div>
              <br><br>
              <div class="form-row">
               <div class="col-md-4 p-2">
               <button class="btn btn-danger btn-block btn-lg" onclick="signOut();" >Logout</button>
               </div>
               <div class="col-md-8 p-2">
               <button class="btn btn-primary btn-block btn-lg" type="submit">Continue With Google Sign in</button>
               </div>
              </div>
             
              </form>
             
     </div>
   </div>
 </div>
 
 <script>
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
        console.log('User signed out.');
        location="index.html";
      });
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  </script>
  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>
</html>

