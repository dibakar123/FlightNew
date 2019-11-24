<%@page import="model.DailyFlight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.FlightDao"%>
<%@page import="model.Flights"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Flight</title>
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/magnific-popup/magnific-popup.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<style>
#flight-search {
	background: #fff;
	min-height: 20vh;
}
</style>
	<%
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String jdate = request.getParameter("date");
		String class_type = request.getParameter("class_type");
		String airline = request.getParameter("airline");
		String adult=request.getParameter("adult");
		String child=request.getParameter("child");
		String passengers = (Integer.parseInt(adult)+Integer.parseInt(child))+"";
		System.out.println(source+" -- "+ destination+"  -- "+ jdate+"  "+passengers+"  "+airline+"  "+class_type);
		FlightDao bdao = new FlightDao();
		List<Flights> list = new ArrayList<Flights>();
		
		List<DailyFlight> dlist =null;
			if (airline.equals("0")) {
		 dlist = bdao.fsearch(source, destination, jdate, class_type);
		}
			else
		if (!(airline.equals("0"))) {
		
			 dlist = bdao.fsearch(source, destination, jdate, class_type,airline);
			}
	%>

	<div id="flight-search" class="container rounded mt-3 p-0">
		<div
			class="row w-100 ml-0 py-4 border-bottom text-center bg-dark text-white">
			<div class="col-md-2">Source</div>
			<div class="col-md-2">Destination</div>
			<div class="col-md-2">Date</div>
			<div class="col-md-2">Travelers</div>
		</div>
		<div class="w-100 ml-0 pt-2">
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-2">
					<p><%=source%></p>
				</div>
				<div class="col-md-2">
					<p><%=destination%></p>
				</div>
				<div class="col-md-2">
					<p><%=jdate%></p>
				</div>
				<div class="col-md-2">
					<p><%=passengers%></p>
				</div>
			</div>
		</div>
		<div
			class="row w-100 ml-0 py-4 border-bottom text-center bg-dark text-white">
			<div class="col-md-2">Airline</div>
			<div class="col-md-2">Depart</div>
			<div class="col-md-2">Arrival</div>
			<div class="col-md-2">Travel Class</div>
			<div class="col-md-2">Seats</div>
			<div class="col-md-2">Price</div>
		</div>
		<%
			if(dlist.size()==0){
		%>
			<h3 align="center">No flights available</h3>
		<%
			}
				
			for (DailyFlight b : dlist) {
				System.out.println("Flight Id:"+b.getFlight_id());
			
				String imagename = "images/" + b.getAirline_name().toLowerCase().trim().replace(" ", "") + ".jpg";
		%>
		<div class="w-100 ml-0 pt-2">
			<div class="alert alert-warning">
				<span class="badge badge-success">Hot Deal</span> Book with ICICI
				netbanking and get instant cashback. <a href="">Click here</a>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-2">
					<p>
						<img src=<%=imagename%> alt="logo"
							style="width: 50px; border-radius: 0.5rem;">
					</p>
					<p><%=b.getAirline_name()%> - <%=b.getFlight_id() %></p>
				</div>
				<div class="col-md-2">
					<p><%=b.getDeparture_time()%></p>
					<p class="text-muted"><%=b.getSource()%></p>
					
				</div>
				<div class="col-md-2">
					<p><%=b.getArrival_time()%></p>
					<p class="text-muted"><%=b.getDestination()%></p>
					<p>
						<a href="FareRules.jsp" target="new">Fare rules</a>
					</p>
				</div>
				<div class="col-md-2">
					<p><%=b.getDays_available()%></p>
					 <p class="text-muted"><%=class_type%></p>
					<p>
						<a href="BagInfo.jsp" target="new">Baggage Information</a>
					</p>
				</div>
				<div class="col-md-2">
					<span class="badge badge-warning"><%=b.getSeats_available()%></span><br> 
					<span class="text-warning font-weight-bold">Left</span>
				</div>
				<div class="col-md-2">
					<p><%=b.getSeat_cost() * Integer.parseInt(passengers)%></p> 
					<p>
					<form action="OneWayBooking.jsp" id="flight-search">
					<input type="hidden" name="airline" value="<%=b.getAirline_name().replace(" ","")%>">
					<input type="hidden" name="class_type" value="<%=b.getClass_type()%>"> 
					<input type="hidden" name="flightid" value="<%=b.getFlight_id()%>">
					
					<input type="hidden" name="source" value="<%=b.getSource()%>">
					<input type="hidden" name="destination" value="<%=b.getDestination()%>">
					<input type="hidden" name="departure_time" value="<%=b.getDeparture_time()%>">
					<input type="hidden" name="arrival_time" value="<%=b.getArrival_time()%>">
					
					<input type="hidden" name="jdate" value="<%=request.getParameter("date")%>">
					<input type="hidden" name="adult" value="<%=request.getParameter("adult")%>">
					<input type="hidden" name="child" value="<%=request.getParameter("child")%>">
					
					<input type="hidden" name="charge" value="<%=b.getSeat_cost()%>"> 
					
					
					<button class="btn btn-warning" type="submit">Book now</button>
						<!-- <input type='submit' class='btn btn-warning' value='Book now'> -->
					</form>
					</p>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<%@include file="Footer.jsp" %>

</body>
</html>