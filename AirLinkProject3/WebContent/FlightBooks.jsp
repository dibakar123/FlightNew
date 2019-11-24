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
	
		String airline = request.getParameter("airline");
	    String class_type = request.getParameter("class_type");
		System.out.println("Class Type:"+class_type);
		String flightid = request.getParameter("flightid");
		
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String departure_time = request.getParameter("departure_time");
		String arrival_time = request.getParameter("arrival_time");

		
		String jdate = request.getParameter("jdate");
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		
		String charge = request.getParameter("charge");
		int totalcharge = Integer.parseInt(charge) * Integer.parseInt(adult);
		totalcharge += ((int) (Integer.parseInt(charge) * .70) * Integer.parseInt(child));
	%>
	<form action="FlightBooks" method=post>
		<table>
			<tr>
				<!-- <td>Booking Id : <input type="text" name="bookingId"></td> -->
				<!-- <td>Date Of Booking : <input type="text" name="dtOfBooking"></td> -->
				<td>Airline name : <input type="text" name="airline"
					value=<%=airline%>></td>
				<td>Flight Id : <input type="text" name="flightId"
					value=<%=flightid%>></td>
				<td>Date Of Journey : <input type="text" name="jdate"
					value=<%=jdate%>></td>
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
				<td>departure_time : <input type="text" name="departure_time"
					value=<%=departure_time%>></td>
				<td>arrival_time : <input type="text" name="arrival_time"
					value=<%=arrival_time%>></td>
				<td>No Of Passengers</td>
				<td>Adults : <input type="text" name="adult" value=<%=adult%>></td>
				<td>Childrens : <input type="text" name="child"
					value=<%=child%>></td>
				<td>Total Charge : <input type="text" name="charge"
					value=<%=totalcharge%>></td>
			</tr>
			<tr>
				<input type="radio" name="status" value="block"> Blocking <a href="url">Learn More</a>
				<br>
				<input type="radio" name="status" value="prebook"> Pre-booking <a href="url">Learn More</a>
				<br>
				<input type="radio" name="status" value="earlybird"> Early Bird Bookings <a href="url">Learn More</a>
				<td><input type="submit" name="bsubmit" value=Book></td>
			</tr>
		</table>
	</form>
</body>
</html>