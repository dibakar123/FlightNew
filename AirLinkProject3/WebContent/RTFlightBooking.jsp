<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String class_type = request.getParameter("class_type");
		//System.out.println("Class Type:" + class_type);
		//String airline = request.getParameter("airline");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		//String departure_time = request.getParameter("departure_time");
		//String arrival_time = request.getParameter("arrival_time");

		String flightidDep = request.getParameter("dep");
		String flightidRet = request.getParameter("ret");
		//System.out.println("ret:" +flightidRet) ;
		String jdate = request.getParameter("jdate");
		String jdate2 = request.getParameter("jdate2");
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		/* String charge = request.getParameter("charge");
		int totalcharge = Integer.parseInt(charge) * Integer.parseInt(adult);
		totalcharge += ((int) (Integer.parseInt(charge) * .70) * Integer.parseInt(child)); */
	%>
	<form action="FlightBooks" method=post>
		<table>
			<tr>
				<!-- <td>Booking Id : <input type="text" name="bookingId"></td> -->
				<!-- <td>Date Of Booking : <input type="text" name="dtOfBooking"></td> -->
				
				<td>Flight Id Departure: <input type="text" name="flightIdDep"
					value=<%=flightidDep%>></td>
					<td>Flight Id Return: <input type="text" name="flightIdRep"
					value=<%=flightidRet%>></td>
				<td>Date Of Journey (Departure): <input type="text" name="jdate"
					value=<%=jdate%>></td>
					<td>Date Of Journey (Return): <input type="text" name="jdate2"
					value=<%=jdate2%>></td>
				<td>Seat Type: <input type="text" name="seat_type"
					value=<%=class_type%>></td>
			</tr>
			<tr>
				<td>Source : <input type="text" name="source" value=<%=source%>></td>
				<td>Destination : <input type="text" name="destination"
					value=<%=destination%>></td>
				<td>Contact No. : <input type="text" name="contactNo"></td>
				<td>Email : <input type="text" name="email"></td>
			</tr>
			<tr>
				<input type="radio" name="status" value="block"> Blocking
				<a href="url">Learn More</a>
				<br>
				<input type="radio" name="status" value="prebook">
				Pre-booking
				<a href="url">Learn More</a>
				<br>
				<input type="radio" name="status" value="earlybird"> Early
				Bird Bookings
				<a href="url">Learn More</a>
				<td><input type="submit" name="bsubmit" value=Book></td>
			</tr>
		</table>
	</form>
</body>
</html>