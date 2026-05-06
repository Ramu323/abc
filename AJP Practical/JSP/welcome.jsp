<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome Page</title>
</head>
<body>

<form>
    <h2>Hello JSP Program</h2>

    <%
        String user = request.getParameter("username");
        out.print("Welcome " + user);
    %>

</form>

</body>
</html>