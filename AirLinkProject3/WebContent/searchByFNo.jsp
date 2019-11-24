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
<title>Flight Search</title>
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
	min-height: 50vh;
}
</style>
	<%
		String flightno = request.getParameter("flightno");
			System.out.println(flightno);
			Flights b = null;
			FlightDao bdao = new FlightDao();
			b=bdao.fsearch(flightno);
			System.out.println(b);
	%>

	<div id="flight-search" class="container rounded mt-3 p-0">
		
		
		<div
			class="row w-100 ml-0 py-4 border-bottom text-center bg-dark text-white">
			<div class="col-md-3">Airline</div>
			<div class="col-md-3">Depart</div>
			<div class="col-md-3">Arrival</div>
			<div class="col-md-3">Days Available</div>
		</div>
		<%
		
			if (b==null) {
		%>
		<h3 align="center">No flights available</h3>
		<%
			}
			else{
			
				String imagename = "images/" + b.getAirline_name().toLowerCase().trim().replace(" ", "") + ".jpg";
		%>
		<div class="w-100 ml-0 pt-2">
			<div class="alert alert-warning">
				<span class="badge badge-success">Hot Deal</span> Book with ICICI
				netbanking and get instant cashback. <a href="">Click here</a>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-3">
					<p>
						<img src=<%=imagename%> alt="logo"
							style="width: 50px; border-radius: 0.5rem;">
					</p>
					<p><%=b.getAirline_name()%> - <%= b.getFlight_id() %></p>
				</div>
				<div class="col-md-3">
					<p><%=b.getDeparture_time()%></p>
					<p class="text-muted"><%=b.getSource()%></p>
					<p>
						<a href="#">Flight Itenerary</a>
					</p>
				</div>
				<div class="col-md-3">
					<p><%=b.getArrival_time()%></p>
					<p class="text-muted"><%=b.getDestination()%></p>
					<p>
						<a href="">Fare rules</a>
					</p>
				</div>
				<div class="col-md-3">
					<p><%=b.getDays_available()%></p>
					<%-- <p class="text-muted"><%=b.getSeat().getClass_type()%></p> --%>
					<p>
						<a href="">Baggage Information</a>
					</p>
				</div>
				
			</div>
		</div>
		<%
			}
		%>
	</div>
	<%@include file="Footer.jsp"%>

</body>
</html>