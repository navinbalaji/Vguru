<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%

session.removeAttribute("mentorName");
session.removeAttribute("mentorEmail");
session.removeAttribute("mentorStandard");
session.removeAttribute("mentorLastLogin");  
session.invalidate(); 
response.sendRedirect("Mentorlogin.html");
%>
</body>
</html>