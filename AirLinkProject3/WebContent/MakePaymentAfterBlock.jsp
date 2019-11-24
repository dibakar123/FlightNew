<%@page import="model.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

#passenger-details {
	background: #fff;
	min-height: 50vh;
}

#fare-summary {
	background: #fff;
	min-height: 50vh;
}

.div-headers {
	font-size: 1.3rem;
}

.description {
	font-size: 0.6em;
}

.booking-radio {
	display: inline-block !important;
	opacity: 1 !important;
	width: 20px;
}

.radio-text {
	margin-top: -1rem;
}

.booking-checkbox {
	display: inline-block !important;
	opacity: 1 !important;
	width: 20px;
}

.checkbox-text {
	margin-top: -1rem;
}
</style>

</head>
<body>
<%@include file="navbar.jsp"%>

<%
		Booking	booking = (Booking)request.getAttribute("booking")	;
		String airline = booking.getFlight().getAirline_name();
		String class_type = booking.getSeat_type();
		System.out.println("Class Type:"+class_type);
		String flightid = booking.getFlight().getFlight_id();

		String source = booking.getFlight().getSource();
		String destination = booking.getFlight().getDestination();
		String departure_time = booking.getFlight().getDeparture_time();
		String arrival_time = booking.getFlight().getArrival_time();
		int otherCharge=booking.getOther_charge();

		Date jdate = booking.getDtOfJourney();
		int adult = booking.getPadult();
		int child = booking.getpChild();
		int passengers = adult + child;
		
		//int mcharge=(int)request.getAttribute("mcharge");
		
		String bookid= booking.getBooking_id();

		int totalcharge = booking.getTotalFare();
		
		
		System.out.println("Total Before : "+totalcharge);

		String imagename = "images/" + airline.toLowerCase().trim().replace(" ", "") + ".jpg";
		
		Date d2=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
		/* String d3=sdf.format(d2); */
		
		System.out.println("date "+d2);
		try
		{
			Date dateBefore = jdate;
	       	Date dateAfter = d2;
	       long difference = dateBefore.getTime()- dateAfter.getTime();
	       
	       float days= (difference / (1000*60*60*24));
	       System.out.println("Days : "+days);
	       
	       if(days>=30){
	    	   totalcharge=(int)(0.75*totalcharge);
	    	   System.out.println("Total After : "+totalcharge);
	    	   }
	       }
		catch(Exception e)
		{
			  e.printStackTrace();
		}


	%>

	<div id="fare-summary" class="container rounded mt-3 p-5">
		<div class="w-100 ml-0 pt-2">
			<div class="col-md-12">
				<h3 style="color: #007bff">Fare Summary</h3>
				<hr color="#007bff">
				<div class="alert alert-primary">
					<span class="badge badge-primary">Note:</span> Please Make Sure
					Your Details is as per your Govt. Id
				</div>
			</div>

			<form method="post" action="MakePayment" class="bg-white">
				<div class="row w-100 ml-0 py-2 text-center">
					<div class="col-md-4 pt-2">
						<p>No Of Travelers</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100"
								name="nooftravelers" value="<%=passengers%>" disabled>
						</p>
					</div>
					<div class="col-md-4 pt-2">
						<p></p>

					</div>
					<div class="col-md-4 pt-2">
						<p>Adults</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="adults"
								value="<%=adult%>" disabled>
						</p>
					</div>

					<div class="col-md-4 pt-3">
						<p></p>
					</div>

					<div class="col-md-4 pt-2">
						<p>Child</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="child"
								value="<%=child%>" disabled>
						</p>
					</div>
					<div class="col-md-4 pt-3">
						<p></p>
					</div>
					<div class="col-md-4 pt-2">
						<p>Base Fare</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="basefare"
								value="<%=totalcharge%>" disabled>
						</p>
					</div>
					<div class="col-md-4 pt-3">
						<p></p>
					</div>
					<div class="col-md-4 pt-2">
						<p>Other Charges</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="basefare"
								value="<%=otherCharge%>" disabled>
						</p>
					</div>
					

<!-- 					<div class="col-md-4 pt-3">
						<p></p>
					</div>
					<div class="col-md-4 pt-2">
						<p>Discount</p>

					</div>
					<div class="col-md-4 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="discount"
								value="30% for Children" disabled>
						</p>
					</div> -->
					<div class="col-md-4 pt-3">
						<p></p>
					</div>
					<div class="col-md-4 pt-2">
						<p>Total Fare +18% GST</p>

					</div>
					<div class="col-md-3 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="totalfare"
								value="<%=totalcharge%>" readonly="readonly">
						</p>
					</div>
					<div class="col-md-1 pt-2">
						<p>=</p>
					</div>
					<div class="col-md-3 pt-2">
						<p>
							<input type="text" class="form-control w-100" name="totalfaregst"
								value="<%=totalcharge * 1.18%>" readonly="readonly">
						</p>
					</div>
					<div class="col-md-12 pt-2">
						<p>
						<input type="hidden" name="bookid" value="<%=bookid%>">
							<button class="btn btn-success" type="Submit">Proceed
								For Payment</button>
						</p>
					</div>
				</div>
			</form>

		</div>

	</div>
	<%@include file="Footer.jsp"%>

</body>
</html>