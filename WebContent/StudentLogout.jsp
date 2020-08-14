<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
<meta name="google-signin-client_id" content="995639186583-3qgtpn3713dqso146ah0gior04v600ar.apps.googleusercontent.com">
</head>
<body>
<%
if(session.getAttribute("sessionID")==null){
	response.sendRedirect("index.html");
}

session.removeAttribute("sessionID");
session.removeAttribute("email");
session.removeAttribute("standard");
session.removeAttribute("username");  
session.removeAttribute("LastLogin");  
session.invalidate();
response.sendRedirect("index.html");
%>
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
    signOut();
  </script>
  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>
</html>