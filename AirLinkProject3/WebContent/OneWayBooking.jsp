<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>One Way Booking</title>
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
		String airline = request.getParameter("airline");
		String class_type = request.getParameter("class_type");
		//System.out.println("Class Type:"+class_type);
		String flightid = request.getParameter("flightid");

		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String departure_time = request.getParameter("departure_time");
		String arrival_time = request.getParameter("arrival_time");

		String jdate = request.getParameter("jdate");
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		String passengers = (Integer.parseInt(adult) + Integer.parseInt(child)) + "";

		String charge = request.getParameter("charge");
		int totalcharge = Integer.parseInt(charge) * Integer.parseInt(adult);
		totalcharge += ((int) (Integer.parseInt(charge) * .70) * Integer.parseInt(child));

		String imagename = "images/" + airline.toLowerCase().trim().replace(" ", "") + ".jpg";
	%>

	<div id="booking" class="container rounded mt-3 py-3 px-5">
		<div class="w-100 ml-0">
			<div class="row w-100 ml-0 py-2 ">
				<div class="col-md-12">
					<h3 style="color: #007bff">Ticket Details</h3>
					<hr color="#007bff">
				</div>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-2">
					<p>
						<img src=<%=imagename%> alt="logo"
							style="width: 50px; border-radius: 0.5rem;">
					</p>
					<p><%=airline%>
						-
						<%=flightid%></p>
				</div>
				<div class="col-md-2">
					<p><%=departure_time%></p>
					<p class="text-muted"><%=source%></p>
				</div>
				<div class="col-md-2">
					<p><%=arrival_time%></p>
					<p class="text-muted"><%=destination%></p>

				</div>
				<div class="col-md-2">
					<p>1 Day</p>

				</div>
				<div class="col-md-2">
					<p><%=class_type%></p>
				</div>
				<div class="col-md-2">
					<p>Travelers</p>
					<p><%=passengers%></p>
				</div>
			</div>
			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-2">
					<p class="text-muted">
						<i class="fa fa-suitcase"></i>15 Kgs Check-In,7 Kgs Cabin
					</p>
				</div>
			</div>
		</div>
	</div>
<div id="booking" class="container rounded mt-3 py-3 px-5">
			<div class="w-100 ml-0 pt-2">
			<div class="row w-100 ml-0 py-2 ">
 					<div class="col-md-12">
	 					<h3 style="color:#007bff ">Add Ons</h3>
	 					<hr color="#007bff">
	 				</div>
	 			</div>
	 			<%@include file="modal.jsp"%>
 				<div class="row w-100 ml-0 py-2 text-left text-md-center">
	 				<div class="col-md-4">
	 					<div class="div-headers w-100 text-left pl-md-4 pb-4">
	 						<span class="d-inline-block w-25 float-left"><i class="fas fa-mug-hot text-primary fa-3x"></i></span>
	 						<span class="d-inline-block w-75 float-right">
	 							<p class="mb-0 pb-0"><a href="" data-toggle="modal" data-target="#addmealModal">Add meals</a></p>
	 							<span class="description pt-1">
	 								Have your delicious meal.<br> <a href="" data-toggle="modal" data-target="#addmealModal">Learn more</a>
	 							</span>
	 						</span>
	 						<span class="clearfix"></span>
	 					</div>
	 				</div>
	 				
	 				<div class="col-md-4">
	 					<div class="div-headers w-100 text-left pl-md-4 pb-4">
	 						<span class="d-inline-block w-25 float-left"><i class="fas fa-suitcase text-primary fa-3x"></i></span>
	 						<span class="d-inline-block w-75 float-right">
	 							<p class="mb-0 pb-0"><a href="" data-toggle="modal" data-target="#addBaggagesModal">Add Baggages</a></p>
	 							<span class="description pt-1">
	 								Want to add some extra luggage.<br> <a href="" data-toggle="modal" data-target="#addServicesModal">Learn more</a>
	 							</span>
	 						</span>
	 						<span class="clearfix"></span>
	 					</div>
	 				</div>
	 				<div class="col-md-4">
	 					<div class="div-headers w-100 text-left pl-md-4 pb-4">
	 						<span class="d-inline-block w-25 float-left"><i class="fas fa-concierge-bell text-primary fa-3x"></i></span>
	 						<span class="d-inline-block w-75 float-right">
	 							<p class="mb-0 pb-0"><a href="" data-toggle="modal" data-target="#addServicesModal">Add Services</a></p>
	 							<span class="description pt-1">
	 								You can have great experience in extra services.  <a href="" data-toggle="modal" data-target="#addServicesModal">Learn more</a>
	 							</span>
	 						</span>
	 						<span class="clearfix"></span>
	 					</div>
	 				</div>
	 				
	 				
	 			</div>
 			</div> 	
 		</div>

	<form action="FlightBooks" method=post class="container" id="book_flight_form">
	
	

		<div id="booking" class="container rounded mt-3 py-3 px-5" >
			<div class="w-100 ml-0 pt-2">
				<div class="row w-100 ml-0 py-2 ">
					<div class="col-md-12">
						<h3 style="color: #007bff">Booking Type</h3>
						<hr color="#007bff">
					</div>
				</div>
				<div class="row w-100 ml-0 py-2 text-center" >
					<div class="col-md-2">
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="customradio1" name="status" value="Blocked"
								data-toggle="modal" data-target="#blocking" required="required"> <label
								class="custom-control-label" for="customradio1">Blocking</label>
						</div>
					</div>
					
					<div class="col-md-2">
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input"
								id="customradio3" name="status" value="Pending"
								data-toggle="modal" data-target="#earlybooking" required="required"> <label
								class="custom-control-label" for="customradio3">
								Booking</label>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div id="passenger-details" class="container rounded mt-3 p-5">
			<div class="w-100 ml-0">
				<div class="col-md-12">
					<h3 style="color: #007bff">Passenger Details</h3>
					<hr color="#007bff">
					<div class="alert alert-primary">
						<span class="badge badge-primary">Note:</span> Please Make Sure
						Your Details is as per your Govt. Id
					</div>
				</div>


				<%
					for (int i = 0; i < Integer.parseInt(adult); i++) {
				%>
				<script>
/* function takeaction(e,e1){

	 var val=e.value;	
	 if(val=='Handicapped'){
	
		e1.style.display='block';
	 }
	 else{
		
		 e1.style.display='none';
	 }
} */
				function takeaction(e,e1, div_id_by_passenger){
					console.log(div_id_by_passenger);
					$('div#'+div_id_by_passenger).html('');
				 	var val=e.value;
				 	var start = 0;
					var services, service_1, service_2, service_3, service_4, service_5, service_6;
					service_1 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="wheelchair<%=(i + 1)%>" value="true"> <label class="custom-control-label" for="Check_'+div_id_by_passenger+start+'">Wheel Chair</label> </div>';
					start++;
					service_2 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="nurses<%=(i + 1)%>" value="true"> <label class="custom-control-label" for="Check_'+div_id_by_passenger+start+'">Nurse</label> </div>';
					start++;
					service_3 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="attendants<%=(i + 1)%>" value="true"> <label class="custom-control-label" for="Check_'+div_id_by_passenger+start+'">Attendants</label> </div>';
					start++;
					service_4 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="medicines<%=(i + 1)%>" value="true"> <label class="custom-control-label"  for="Check_'+div_id_by_passenger+start+'">Special Medicine</label> </div>';
					start++;
					
					 if(val === 'Handicapped'){
						
						services = service_1+service_2+service_3+service_4;
					 }

					 $('div#'+div_id_by_passenger).append(services);
				}



</script>
	<div class="card mt-2 mx-3" id="passenger_id_<%= (i+1) %>">
				<div class="card-header bg-dark text-white text-capitalize">Passenger<%=(i + 1)%></div>
				<div class="card-body">
					<div class="row w-100 ml-0 py-2 text-center">
						<div class="col-md-6">
							<p>
								<input type="text" class="form-control w-100"
									name="pName<%=(i + 1)%>"
									placeholder="Passanger <%=(i + 1)%> Name" required="required">
							</p>

						</div>

						<div class="col-md-3 ">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="pType<%=(i + 1)%>" disabled="disabled">

									<option selected value="Adult">Adult</option>
									<option value="Child">Child</option>
								</select>
							</p>
						</div>
						<input type="hidden" name="pType<%=(i + 1)%>" value="Adult">

						<div class="col-md-3">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="gender<%=(i + 1)%>">
									<option selected>Gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Others">Prefer not to say</option>
								</select>
							</p>
						</div>

						<div class="col-md-4">
							<p>
								<select class="custom-select w-100" id="category<%=(i + 1)%>"
									name="category<%=(i + 1)%>"
									onchange="takeaction(category<%=(i+1)%>,handicap<%=(i+1)%>,'handicap<%= (i+1) %>')">
									<option selected>Category</option>
									<option value="Student">Student</option>
									<option value="General">General</option>
									<option value="Handicapped">Handicapped</option>
									<option value="SeniorCitizen">Senior Citizen</option>
									<option value="AirlineStaff">Airline Staff</option>
									<option value="DefensePersonnel">Defense Personnel</option>
								</select>
							</p>
						</div>

						<div class="col-md-4">
							<p>
								<input type="text" name="age<%=(i + 1)%>" class="form-control w-100"
									placeholder="Your age" maxlength="3" min="1" id="user_age<%=(i + 1)%>" required="required">
								<span class="age_error_message<%=(i + 1)%> text-danger font-weight-normal"></span>
							</p>
						</div>
						<!-- 1-11 = chilCdHILD
						12-60= ADULT
						60>=sENIOR
						30<= student -->

						<script>
							$(document).ready(function(){
								$('#user_age<%=(i + 1)%>').keypress(function(event){
									var field_info = event.which;
									if(field_info !== 8 && field_info !== 0 && (event.which <48 || event.which > 57)){
										$('.age_error_message<%=(i + 1)%>').html('Please enter numbers only');
										setTimeout(function(){
											$('.age_error_message<%=(i + 1)%>').html('');
										}, 3000);
										return false;
									}
									
								});

								$('#user_age<%=(i + 1)%>').blur(function(event){
									var cata = document.getElementById('category<%=(i + 1)%>').value;
									var age = document.getElementById('user_age<%=(i + 1)%>').value;
									 /* alert(cata+' '+eval(age));  */ 
									if(cata=='Student' && eval(age)>30){
										$('.age_error_message<%=(i + 1)%>').html('Passenger should select age between 11 to 30');
										setTimeout(function(){
											$('.age_error_message<%=(i + 1)%>').html('');
											document.getElementById('user_age<%=(i + 1)%>').value='';
										}, 3000); 
										return false;
									}
									
									else if(cata=='SeniorCitizen' && eval(age)<60){
										
										$('.age_error_message<%=(i + 1)%>').html('Passenger should select age greater than 60');
										setTimeout(function(){
											$('.age_error_message<%=(i + 1)%>').html('');
											document.getElementById('user_age<%=(i + 1)%>').value='';
										}, 3000); 
										return false;
									}
										else if(cata=='DefensePersonnel' && age<21){
										
										$('.age_error_message<%=(i + 1)%>').html('Passenger should select age greater than 21');
										setTimeout(function(){
											$('.age_error_message<%=(i + 1)%>').html('');
											document.getElementById('user_age<%=(i + 1)%>').value='';
										}, 3000); 
										return false;
									}
										else if(cata=='AirlineStaff' && age<21){
											
											$('.age_error_message<%=(i + 1)%>').html('Passenger should select age greater than 21');
											setTimeout(function(){
												$('.age_error_message<%=(i + 1)%>').html('');
												document.getElementById('user_age<%=(i + 1)%>').value='';
											}, 3000); 
											return false;
										}
									 
								});
								
								<%-- $('#user_age<%=(i + 1)%>').keyup(function(event){
									var cata = document.getElementById('category<%=(i + 1)%>').value;
									//alert(cata);
									var age = document.getElementById('user_age<%=(i + 1)%>').value;
									if(cata=='Seniorcitizen' && age>60){
										$('.age_error_message<%=(i + 1)%>').html('Passenger should select age>=60');
										setTimeout(function(){
											$('.age_error_message<%=(i + 1)%>').html('');
											document.getElementById('user_age<%=(i + 1)%>').value='';
										}, 5000); 
										return false;
									}
								});
								 --%>
								 $('#book_flight_form').submit(function(event){
									var passenger_category = $('#category<%=(i + 1)%>').val();
									var passenger_age = $('#user_age<%=(i + 1)%>').val();
									var passenger_group = $('#inputGroupSelect<%=(i + 1)%>').val();

									if (passenger_age <= 11) {
										// child
										if (passenger_group != 'Child') {
											swal('Alert!','Passenger with age within 11 should select age group as Child!', 'warning');
											event.preventDefault();
											return false;
										}

										if (passenger_category == 'Seniorcitizen') {
											swal('Alert!','Passenger with age within 11 cannot select Senior Citizen', 'warning');
											event.preventDefault();
											return false;
										}

										if (passenger_age <= 30){
											// student
											if (passenger_category != 'Student') {
												swal('Alert!','Passenger with age <=30 should select Student', 'warning');
												event.preventDefault();
												return false;
											}
										}
									}

									if (passenger_age >= 12 && passenger_age <= 59) {
										// adult;
										
										if (passenger_group != 'Adult') {
											swal('Alert!','Passenger with age within 12 - 59 should select age group as Adult!', 'warning');
											event.preventDefault();
											return false;
										}

										if (passenger_category == 'Seniorcitizen') {
											swal('Alert!','Passenger with age within 12 - 59 cannot select Senior Citizen', 'warning');
											event.preventDefault();
											return false;
										}

										if (passenger_age <= 30){
											// student
											if (passenger_category != 'Student') {
												swal('Alert!','Passenger with age <=30 should select Student', 'warning');
												event.preventDefault();
												return false;
											}
										}
										
										if(passenger_age > 30 && passenger_category == 'Student'){
											swal('Alert!','Passenger with age >30 should not select Student', 'warning');
											event.preventDefault();
											return false;
										}
									}

									if (passenger_age >= 60){
										// senior citizen
										if (passenger_group != 'Adult') {
											swal('Alert!','Passenger with age >= 60 should select age group as Adult!', 'warning');
											event.preventDefault();
											return false;
										}

										if (passenger_category != 'Seniorcitizen') {
											swal('Alert!','Passenger with age >=60 should select Senior Citizen', 'warning');
											event.preventDefault();
											return false;
										}
									}

								});
							}); 
						</script>
						<div class="col-md-4">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="meals<%=(i + 1)%>">
									<option selected>No Meal Required</option>
									<option value="vmeal">Veg Meal</option>
									<option value="nvmeal">Non-Veg Meal</option>

								</select>
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="seatType1<%=(i + 1)%>">
									<option selected>Seat Location Type 1</option>
									<option value="Window">Window</option>
									<option value="Aisle">Aisle</option>
									<option value="Near Emergency">Near Emergency</option>
								</select>
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="seatType2<%=(i + 1)%>">
									<option selected>Seat Location Type 2</option>
									<option value="Front">Front</option>
									<option value="Middle">Middle</option>
									<option value="back">back</option>
								</select>
							</p>
						</div>
						
						<div class="col-12 text-left">
							<div id='handicap<%=(i+1)%>' class="services_addons">  
								
								
							</div>
						</div> 

<%-- 						<div id='handicap<%=(i + 1)%>' style="display: none">
							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck4">WheelChair</label>
							</div>

							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck3">Nurse</label>
							</div>
							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck2">Attendants</label>
							</div>
							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck1">SpecialMedicine</label>
							</div>
						</div> --%>
					</div>
				</div>
			</div>

			<%
				}
			%>
			
							<%
					for ( int i = Integer.parseInt(adult); i < Integer.parseInt(passengers); i++) {
				%>
				<script>
/* function takeaction(e,e1){

	 var val=e.value;	
	 if(val=='Handicapped'){
	
		e1.style.display='block';
	 }
	 else{
		
		 e1.style.display='none';
	 }
} */
				function takeaction(e,e1, div_id_by_passenger){
					console.log(div_id_by_passenger);
					$('div#'+div_id_by_passenger).html('');
				 	var val=e.value;
				 	var start = 0;
					var services, service_1, service_2, service_3, service_4, service_5, service_6;
					service_1 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="wheelchair<%=(i + 1)%>" value="true"> <label class="custom-control-label" for="Check_'+div_id_by_passenger+start+'">Wheel Chair</label> </div>';
					start++;
					service_2 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="nurses<%=(i + 1)%>" value="true"> <label class="custom-control-label" for="Check_'+div_id_by_passenger+start+'">Nurse</label> </div>';
					start++;
					service_3 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="attendants<%=(i + 1)%>" value="true"> <label class="custom-control-label" for="Check_'+div_id_by_passenger+start+'">Attendants</label> </div>';
					start++;
					service_4 = '<div class="custom-control custom-checkbox d-inline-block mr-2"><input type="checkbox" class="custom-control-input" id="Check_'+div_id_by_passenger+start+'" name="medicines<%=(i + 1)%>" value="true"> <label class="custom-control-label"  for="Check_'+div_id_by_passenger+start+'">Special Medicine</label> </div>';
					start++;
					
					 if(val === 'Handicapped'){
						
						services = service_1+service_2+service_3+service_4;
					 }

					 $('div#'+div_id_by_passenger).append(services);
				}



</script>
	<div class="card mt-2 mx-3" id="passenger_id_<%= (i+1) %>">
				<div class="card-header bg-dark text-white text-capitalize">Passenger<%=(i + 1)%></div>
				<div class="card-body">
					<div class="row w-100 ml-0 py-2 text-center">
						<div class="col-md-6">
							<p>
								<input type="text" class="form-control w-100"
									name="pName<%=(i + 1)%>"
									placeholder="Passanger <%=(i + 1)%> Name" required="required">
							</p>

						</div>

						<div class="col-md-3 ">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="pType<%=(i + 1)%>" disabled="disabled">

									<option value="Adult">Adult</option>
									<option selected value="Child">Child</option>
								</select>
							</p>
						</div>
						<input type="hidden" name="pType<%=(i + 1)%>" value="Child">

						<div class="col-md-3">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="gender<%=(i + 1)%>">
									<option selected>Gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Others">Prefer not to say</option>
								</select>
							</p>
						</div>

						<div class="col-md-4">
							<p>
								<select class="custom-select w-100" id="category<%=(i + 1)%>" 
									name="category<%=(i + 1)%>"
									onchange="takeaction(category<%=(i+1)%>,handicap<%=(i+1)%>,'handicap<%= (i+1) %>')" disabled="disabled">
									<option selected>Category</option>
									<option value="Student">Student</option>
									<option value="General">General</option>
									<option value="Handicapped">Handicapped</option>
									<option value="Seniorcitizen">Senior Citizen</option>
									<option value="AirlineStaff">Airline Staff</option>
									<option value="DefensePersonnel">Defense Personnel</option>
								</select>
							</p>
						</div>
						<input type="hidden" name="category<%=(i + 1)%>" value="None">

						<div class="col-md-4">
							<p>
								<input type="text" name="age<%=(i + 1)%>" class="form-control w-100"
									placeholder="Your age" required="required">
							</p>
						</div>
						<div class="col-md-4">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="meals<%=(i + 1)%>">
									<option selected>No Meal Required</option>
									<option value="vmeal">Veg Meal</option>
									<option value="nvmeal">Non-Veg Meal</option>

								</select>
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="seatType1<%=(i + 1)%>">
									<option selected>Seat Location Type 1</option>
									<option value="Window">Window</option>
									<option value="Aisle">Aisle</option>
									<option value="Near Emergency">Near Emergency</option>
								</select>
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<select class="custom-select w-100" id="inputGroupSelect01" name="seatType2<%=(i + 1)%>">
									<option selected>Seat Location Type 2</option>
									<option value="Front">Front</option>
									<option value="Middle">Middle</option>
									<option value="back">back</option>
								</select>
							</p>
						</div>
						
						<div class="col-12 text-left">
							<div id='handicap<%=(i+1)%>' class="services_addons">  
								
								
							</div>
						</div> 

<%-- 						<div id='handicap<%=(i + 1)%>' style="display: none">
							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck4">WheelChair</label>
							</div>

							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck3">Nurse</label>
							</div>
							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck2">Attendants</label>
							</div>
							<div class="custom-control custom-checkbox col-md-4">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck1">SpecialMedicine</label>
							</div>
						</div> --%>
					</div>
				</div>
			</div>

			<%
				}
			%>

			<div class="row w-100 ml-0 py-2 text-center">
				<div class="col-md-12">
					<div class="alert alert-primary" align="left">
						<span class="badge badge-primary">Note:</span> We Will Send Ticket
						Details In Your Given Email Id and Mobile No.
					</div>
				</div>
				<div class="row w-100 ml-0 py-2 text-center">
					<div>
						<input type="hidden" name="airline" value="<%=airline%>">
						<input type="hidden" name="class_type" value="<%=class_type%>">
						<input type="hidden" name="flightid" value="<%=flightid%>">
						<input type="hidden" name="source" value="<%=source%>"> <input
							type="hidden" name=destination value="<%=destination%>">
						<input type="hidden" name="departure_time"
							value="<%=departure_time%>"> <input type="hidden"
							name="arrival_time" value="<%=arrival_time%>"> <input
							type="hidden" name="jdate" value="<%=jdate%>"> <input
							type="hidden" name="adult" value="<%=adult%>"> <input
							type="hidden" name="charge" value="<%=charge%>"> 
							<input type="hidden" name="child" value="<%=child%>">
							<input type="hidden" name="totalcharge" value="<%=totalcharge%>">
					</div>
					<div class="col-md-6">
						<p>
							<input type="email" name="email" class="form-control"
								placeholder="Email Id" required="required">
						</p>
					</div>
					<div class="col-md-4">
						<p>
							<input type="text" name="contactNo" class="form-control" 
								placeholder="Mobile No." id="user_contact_number" min="10" maxlength="10" required="required">
							<span class="error_contact text-danger font-weight-normal"></span>
						</p>
					</div>





					<!-- VALIDATION FOR MOBILE NUMBER -->
					<script>
						$(document).ready(function(){
							$('#user_contact_number').keypress(function(event){
								var field_info = event.which;
								if(field_info !== 8 && field_info !== 0 && (event.which <48 || event.which > 57)){
									$('.error_contact').html('Please enter numbers only');
									setTimeout(function(){
										$('.error_contact').html('');
									}, 2000);
									return false;
								}
							});

							$('#book_flight_form').submit(function(event){
								var user_contact = $('#user_contact_number').val();
								if ($.trim(user_contact).length < 10) {
									$('.error_contact').html('Please enter atleast 10 digit number');
									event.preventDefault();
									setTimeout(function(){
										$('.error_contact').html('');
									}, 2000);
									return false;
								}
							});
						});
					</script>


					<div class="col-md-2">
						<p>
							<button class="btn btn-success" type="Submit">Submit</button>
						</p>
					</div>
				</div>


			</div>

		</div>
		</div>

	</form>

	<%@include file="Footer.jsp"%>


	<!-- Sweet Java Script -->
	<script>
		$(document)
				.ready(
						function() {
							var message = 'You can take extra luggage after 15kg Check-In and 7kg Cabin upto 10kg only at price Rs 1000/-';
							$('#customCheck2').click(function() {
								if ($(this).prop('checked')) {
									swal('Baggages', '' + message, 'warning');
								}
							});
						});
		$(document)
				.ready(
						function() {
							var message = 'You will  get veg meals or non-veg meals at Rs 400/-';
							$('#customCheck1').click(function() {
								if ($(this).prop('checked')) {
									swal('Meals', '' + message, 'warning');
								}
							});
						});
		$(document).ready(function() {
			var message = 'You can get extra services at price Rs 1000/-';
			$('#customCheck3').click(function() {
				if ($(this).prop('checked')) {
					swal('Services', '' + message, 'warning');
				}
			});
		});
	</script>

</body>
</html>