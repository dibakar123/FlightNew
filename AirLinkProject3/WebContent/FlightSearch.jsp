<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="dao.FlightDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights</title>
</head>
<body>
<form action="SearchResult.jsp">
<table>
<tr><td>Source:<input type="text" name="source" ></td></tr>
<tr><td>Destination:<input type="text" name="destination" ></td></tr>
<tr><td>Date:<input type="text" name="date" ></td></tr>
<tr><td>Passengers:<input type="text" name="passengers" ></td></tr>
<tr><td>Class:<input type="text" name="class_type" ></td></tr>
<tr><td>Preferred Airline:<input type="text" name="airline" ></td></tr>
<tr><td><input type="submit" ></td></tr>
</table>
</form>
</body>
</html>