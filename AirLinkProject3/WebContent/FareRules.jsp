<%@page import="model.Passengers"%>
<%@page import="model.Booking"%>
<%@page import="dao.BookingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fare Rules</title>
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
ul {
  list-style: none;
}
ul li::before {
  content: "\2022";
  color: blue;
  font-weight: bold;
  display: inline-block; 
  width: 2em;
  margin-left: -1em;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div id="booking" class="container rounded mt-3 py-3 px-5">
		<div class="w-100 ml-0">
			<div class="row w-100 ml-0 py-2 ">
				<div class="col-md-12">
					<h2 align="center" style="color: #007bff">Terms & Conditions</h2>
					<hr color="#007bff">
					<div class="container">
						<ul class="list-unstyled" id="tc">
							<li>The charges are per passenger per sector.</li>
							<li>The penalty is subject to 2 hrs before departure. No
								Changes are allowed after that.</li>
							<li>The charges are per passenger per sector and applicable
								only on refundable tickets.</li>
							<li>Rescheduling Charges = Rescheduling/Change Penalty +
								Fare Difference (if applicable).</li>
							<li>Partial cancellation of passengers is not allowed on
								tickets booked under special discounted fares.</li>
							<li>In case of no-show or ticket not cancelled within the
								stipulated time, only statutory taxes are refundable subject to
								Goibibo Service Fee.</li>
							<li>No Baggage Allowance for Infants.</li>
							<li>In case of restricted cases , no amendments
								/cancellation allowed.</li>
							<li>Airline penalty needs to be reconfirmed prior to any
								amendments or cancellation.</li>
							<li>Disclaimer: Airline Penalty changes are indicative and
								can change without prior notice.</li>
							<li>NA means Not Available. Please check with airline for
								penalty information.</li>
							<li>If booking amount is less than default cancellation
								penalty then taxes will be refundable.</li>
						</ul>
					</div>


				</div>
			</div>

		</div>
	</div>



</body>
</html>