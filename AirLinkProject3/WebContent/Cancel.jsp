<%@page import="model.Passengers"%>
<%@page import="model.Booking"%>
<%@page import="dao.BookingDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel Ticket</title>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<style>
#booking {
	background: #fff;
	min-height: 19vh;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div id="booking" class="container rounded mt-3 py-3 px-5">
		<div class="w-100 ml-0">
			<div class="row w-100 ml-0 py-2 ">
				<div class="col-md-12">
					<h3 style="color: #007bff">Cancel Ticket</h3>
					<hr color="#007bff">
				</div>
			</div>
			<form action="" method="post" class="bg-white">
				<div class="row w-100 ml-0 py-2">
					<div class="col-md-4">
						<p>Enter Your Booking Reference Id</p>
					</div>
					<div class="col-md-3">
						<input type="text" class="form-control w-100" name="bookid"
							value="">
					</div>
					<div class="col-md-3">
						<p>
							<button class="btn btn-success" type="Submit">Search</button>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>


	<%
		String bookid = request.getParameter("bookid");
			System.out.println("Bookid:" + bookid);
			if (bookid != null) {
		BookingDao bdao = new BookingDao();
		Booking b = bdao.searchBookingById(bookid);
		String imagename = "images/" + b.getFlight().getAirline_name().toLowerCase().trim().replace(" ", "")
				+ ".jpg";

		if (b != null) {
	%>
	<div id="booking" class="container rounded mt-3 py-3 px-5">
		<div class="w-100 ml-0">
			<div class="row w-100 ml-0 py-2 ">
				<div class="col-md-12">
					<h3 style="color: #007bff">Details</h3>
					<hr color="#007bff">
				</div>
			</div>
			<form action="CancelFlight" method="post" class="bg-white">
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-2">
						<p>
							<img src=<%=imagename%> alt="logo"
								style="width: 50px; border-radius: 0.5rem;">
						</p>

						<p><%=b.getFlight().getAirline_name()%>
							-
							<%=b.getFlight().getFlight_id()%></p>
					</div>
					<div class="col-md-2">
						<p><%=b.getFlight().getDeparture_time()%></p>
						<p class="text-muted"><%=b.getFlight().getSource()%></p>
					</div>
					<div class="col-md-2">
						<p><%=b.getFlight().getArrival_time()%></p>
						<p class="text-muted"><%=b.getFlight().getDestination()%></p>

					</div>
					<div class="col-md-2">
						<p>1 Day</p>

					</div>
					<div class="col-md-2">
						<p><%=b.getSeat_type()%></p>
					</div>
					<div class="col-md-2">
						<p>Travelers</p>
						<p><%=b.getPadult() + b.getpChild()%></p>
					</div>
				</div>
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-3">
						<p>Booking ID</p>
					</div>
					<div class="col-md-3">
						<p>
							<input type="text" name="bookid" class="form-control"
								value=<%=b.getBooking_id()%> readonly="readonly">
						</p>
					</div>
					<div class="col-md-3">
						<p>Booking Status</p>
					</div>
					<div class="col-md-3">
						<p>
							<input type="text" class="form-control" name="bookstatus"
								value=<%=b.getStatus()%> readonly="readonly">
						</p>
					</div>
				</div>
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-3">
						<p>Date Of Booking</p>
					</div>
					<div class="col-md-3">
						<p>
							<input type="text" name="dtOfBooking" class="form-control"
								value=<%=b.getDtOfBooking()%> readonly="readonly">
						</p>
					</div>
					<div class="col-md-3">
						<p>Date Of Journey</p>
					</div>
					<div class="col-md-3">
						<p>
							<input type="text" class="form-control" name="jdate"
								value=<%=b.getDtOfJourney()%> readonly="readonly">
						</p>
					</div>
				</div>

				<div class="card mt-2 mx-3">
					<div class="card-header bg-dark text-white text-capitalize">Passenger
						Details</div>
					<div class="card-body">
						<div class="row w-100 ml-0 py-2 text-center">
							<div class="col-md-3">
								<p>Contact No</p>
							</div>
							<div class="col-md-3">
								<p>
									<input type="text" class="form-control" name="contactNo"
										value=<%=b.getContactNo()%> readonly="readonly">
								</p>
							</div>
							<div class="col-md-3">
								<p>Email Id</p>
							</div>
							<div class="col-md-3">
								<p>
									<input type="text" class="form-control" name="email"
										value=<%=b.getEmail()%> readonly="readonly">
								</p>
							</div>
						</div>
						<div class="row w-100 ml-0 py-2 text-center">
							<div class="col-md-3">
								<p>Adults</p>
							</div>
							<div class="col-md-3">
								<p>
									<input type="text" name="adult" class="form-control"
										value=<%=b.getPadult()%> readonly="readonly">
								</p>
							</div>
							<div class="col-md-3">
								<p>Children</p>
							</div>
							<div class="col-md-3">
								<p>
									<input type="text" name="child" class="form-control"
										value=<%=b.getpChild()%> readonly="readonly">
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row w-100 ml-0 py-2 text-center  ">
					<div class="col-md-4">
						<p>
							Total Fare :
							<%=b.getTotalFare() * 1.18%></p>
					</div>
					<%
						Date journeyDate = b.getDtOfJourney();
								//String departureTime = booking.getFlight().getDeparture_time();
								Date d2 = new Date();
								SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

								long difference = journeyDate.getTime() - d2.getTime();
								float days = (difference / (60 * 60 * 1000 * 24) + 1);
								long diffHours = difference / (60 * 60 * 1000) % 24;
								System.out.println(diffHours);
								System.out.println(days);
								if (days < 0) {
									//result = false;
									System.out.println("Cancel not possible");
								} else {
									double netFare = b.getTotalFare() * 1.18;
									int refundFare = 0;

									if (days >= 7 && days <= 21) {
										refundFare = (int) (netFare * 0.90);
										System.out.println("You get 90% dicount in your ticket");

									} else if (days >= 3 && days <= 6) {
										refundFare = (int) (netFare * 0.50);
										System.out.println("You get 50% dicount in your ticket");
									} else if (days >= 1 && days <= 2) {
										refundFare = (int) (netFare * 0.25);
										System.out.println("You get 25% dicount in your ticket");
									} else if (days == 0) {
										refundFare = (int) (netFare * 0.10);
										System.out.println("You get 10% dicount in your ticket");
									}
					%>
					<div class="col-md-4">
						<p>
							Refund Amount :
							<%=refundFare%></p>
						<p>
							Cancellation Charges:
							<%=b.getTotalFare() * 1.18 - refundFare%></p>
					</div>
					<div class="col-md-4">
						<p>
							<button type="Submit" name="submit" class="btn btn-success">Cancel
								Booking</button>
						</p>
						<p>
							<button type="Submit" name="submit" class="btn btn-success">Make
								Payment</button>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%
		}
			}
		}
	%>

</body>
</html>