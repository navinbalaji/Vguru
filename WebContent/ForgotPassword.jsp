<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="Images/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5 h-100">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center"><b>Forgot Password Portal</b></h5>
            <form class="form-signin" action="fpServe" method="post">
              <div class="form-label-group">
                <input type="email" id="inputUserame" class="form-control" name="fpemail" placeholder="email" required autofocus>
                <label for="inputUserame">Enter E-Mail</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Send Request</button>
              <br>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>