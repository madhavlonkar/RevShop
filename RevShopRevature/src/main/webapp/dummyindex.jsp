<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Current Date and Time in JSP</title>
</head>
<body>
    <h1>Current Date and Time in JSP</h1>

    <!-- Using Scriptlet to get the current date and time -->
    <h2>Using Scriptlet:</h2>
    <%
        // Importing the Date class
        java.util.Date currentDate = new java.util.Date();
        // Setting the current date and time as a request attribute to use in EL
        request.setAttribute("currentDate", currentDate);
    %>
    <p>Current Date and Time: <%= currentDate.toString() %></p>
	<p><%=new java.util.Date() %></p>
    <!-- Using Expression Language to get the current date and time -->
    <h2>Using Expression Language:</h2>
    <p>The current date and time is: ${currentDate}</p>
</body>
</html>
