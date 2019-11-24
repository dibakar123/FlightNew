<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AirLink</title>

<link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/responsive.css">


<link rel="stylesheet" href="css/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
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
<script type="application/x-javascript">
	
	 
			addEventListener("load", function() 
					{ 
						setTimeout(hideURLbar, 0);
					},
					false); 
					function hideURLbar()
					{
						window.scrollTo(0,1);
					} 
		

</script>

<script type="text/javascript">
	function adultChange() {
		var val = document.getElementById("adult").value;
		//alert(val);
		document.getElementById("outad").innerHTML = "<font color=white>Adult :"
				+ val + "</font>";

	}
	function adultChange2() {
		var val = document.getElementById("adult2").value;
		//alert(val);
		document.getElementById("outad2").innerHTML = "<font color=white>Adult :"
				+ val + "</font>";

	}
	function childChange() {
		var val = document.getElementById("child").value;
		document.getElementById("outch").innerHTML = "<font color=white>Child :"
				+ val + "</font>";
		//document.getElementById("outch").text=val;
		//alert(val);
	}
	function childChange2() {
		var val = document.getElementById("child2").value;
		document.getElementById("outch2").innerHTML = "<font color=white>Child :"
				+ val + "</font>";
		//document.getElementById("outch").text=val;
		//alert(val);
	}
	function validate() {
		var curdate = new Date();
		var curdate1 = new Date();
		var from = document.getElementById("from").value;
		var to = document.getElementById("to").value;
		//var source = document.getElementById("source").value; 
		//var destination = document.getElementById("destination").value;
		curdate1.setMonth(curdate1.getMonth() + 6);
	    var bdate = document.getElementById("datepicker2").value;
		part = bdate.split('/');
		var temp ,curtemp;
	    temp = new Date(part[2], part[0]-1, part[1]);
	    curtemp=new Date(curdate.getUTCFullYear(),curdate.getUTCMonth(), curdate.getUTCDate());
	    
	    if (temp.getTime()<curtemp.getTime() ) 
	    {
	    	alert('Booking date older than current date.');
	    	return false;
	    }
	    
	    else
	    	if ( temp.getTime()>= curdate1.getTime()) 
	    { 
	        alert('Booking date can not be more than 6 months.');
	        return false; 
	    }
	  /*   if(source.equals(destination))
		    id1.innerHTML= "<font color=white>Source and Destination are same.</font>";
		else
			{ id1.innerHTML= ""; count++;}
	    
	     */
	     if(from==to){
	    	   alert('Source & Destination can not be same');
		        return false; 
		   
	    }
	
	    {
	    	return true;
	    }
	}

</script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="main-agileinfo">
		<div class="sap_tabs">
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
				<li class="resp-tab-item"><span>One way</span></li>
					<li class="resp-tab-item"><span>Round Trip</span></li>
					
				</ul>
				<div class="clearfix"></div>
				<div class="resp-tabs-container">
					<div class="tab-1 resp-tab-content oneway">
						<form action="SearchResult.jsp" onsubmit="return validate();">
							<div class="from">
								<h3>From</h3>
								<select class="form-control" id="from" name="source">
									<option value="Delhi">Delhi</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Chennai">Chennai</option>
									<option value="Pune">Pune</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Chandigarh">Chandigarh</option>
								</select>
							</div>
							<div class="to">
								<h3>To</h3>
								<select class="form-control" id="to" name="destination">
									<option value="Mumbai">Mumbai</option>
									<option value="Delhi">Delhi</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Chennai">Chennai</option>
									<option value="Pune">Pune</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Chandigarh">Chandigarh</option>
								</select>
							</div>
							<div class="clear"></div>
							<div class="date">
								<div class="depart">
									<h3>Depart</h3>
									<input class="date" id="datepicker2" type="text" placeholder="mm/dd/yyyy"
										value="" name="date" onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}"
										required="required"> <span class="checkbox1" > 
									</span>
								</div>
							</div>
							<div class="class">
								<h3>Class</h3>
								<select id="w3_country1" name="class_type"
									onchange="change_country(this.value)"
									class="frm-field required">
									<option value="Economy">Economy</option>
									<option value="Premium Economy">Premium Economy</option>
									<option value="Business">Business</option>
									<option value="First Class">First Class</option>
								</select>
							</div>
							<div class="clear"></div>
							<div class="numofppl">
								<div class="adults">
									<h5>Adult:(12+ yrs)</h5>
									<div class="quantity">
										<div class="quantity-select">
											<input type="range" class="custom-range" min="1" max="4" value="1"
												id="adult" name="adult" onchange="adultChange()">
											<div id='outad'>
												<font color=white>Adult : 1</font>
											</div>
										</div>

									</div>
								</div>

								<div class="child">
									<h5>Child:(2-11 yrs)</h5>
									<div class="quantity">
										<div class="quantity-select">
											<input type="range" class="custom-range" min="0" max="4" value="0"
												id="child" name="child" onchange="childChange()"> <label
												id=outch><font color=white>Child : 0</font></label>
										</div>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
								<div class="input-group mb-3">
									<select class="custom-select" id="inputGroupSelect02"
										name="airline">
										<option selected value="0">Preferred
											Airlines(Optional)</option>
										<option value="Indigo">IndiGo</option>
										<option value="Air Asia">Air Asia</option>
										<option value="Jet Airways">Jet Airways</option>
										<option value="Air India">Air India</option>
										<option value="Vistara">Vistara</option>
										<option value="Go Air">Go Air</option>
										<option value="Spice Jet">Spicejet</option>
									</select>
								</div>
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
							<input type="submit" value="Search Flights">
						</form>

					</div>
										<div class="tab-1 resp-tab-content roundtrip">
						<form action="RoundTripSearch.jsp">
							<div class="from">
								<h3>From</h3>
								<select class="form-control" id="from" name="source">
									<option value="Delhi">Delhi</option>
									<option value="Mumbai">Mumbai</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Chennai">Chennai</option>
									<option value="Pune">Pune</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Chandigarh">Chandigarh</option>
								</select>
							</div>
							<div class="to">
								<h3>To</h3>
								<select class="form-control" id="from" name="destination">

									<option value="Mumbai">Mumbai</option>
									<option value="Delhi">Delhi</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Chennai">Chennai</option>
									<option value="Pune">Pune</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Chandigarh">Chandigarh</option>
								</select>
							</div>
							<div class="clear"></div>
							<div class="date">
								<div class="depart">
									<h3>Depart</h3>
									<input id="datepicker" name="date" type="text"
										value="mm/dd/yyyy" onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}"
										required=""> <span class="checkbox1"> <label
										class="checkbox"><input type="checkbox" name=""
											checked=""><i> </i>Flexible with date</label>
									</span>
								</div>
								<div class="return">
									<h3>Return</h3>
									<input id="datepicker1" name="date2" type="text"
										value="mm/dd/yyyy" onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = 'mm/dd/yyyy';}"
										required=""> <span class="checkbox1"> <label
										class="checkbox"><input type="checkbox" name=""
											checked=""><i> </i>Flexible with date</label>
									</span>
								</div>
								<div class="clear"></div>
							</div>
							<div class="class">
								<h3>Class</h3>
								<select id="w3_country1" name="class_type"
									onchange="change_country(this.value)"
									class="frm-field required">
									<option value="Economy">Economy</option>
									<option value="Premium Economy">Premium Economy</option>
									<option value="Business">Business</option>
									<option value="First Class">First Class</option>
								</select>

							</div>
							<div class="clear"></div>
							<div class="numofppl">
								<div class="adults">
									<h5>Adult:(12+ yrs)</h5>
									<div class="quantity">
										<div class="quantity-select">
											<input type="range" class="custom-range" min="1" max="4"
												id="adult2" name="adult"  onchange="adultChange2()">
												<div id='outad2'>
												<font color=white>Adult : 3</font>
											</div>
										</div>

									</div>
								</div>

								<div class="child">
									<h5>Child:(2-11 yrs)</h5>
									<div class="quantity">
										<div class="quantity-select">
											<input type="range" class="custom-range" min="0" max="4"
												id="child2" name="child"  onchange="childChange2()">
												 <label
												id=outch2><font color=white>Child : 2</font></label>
										</div>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
								<div class="input-group mb-3">
									<select class="custom-select" id="inputGroupSelect02"
										name="airline">
										<option selected value="0">Preferred
											Airlines(Optional)</option>
										<option value="Indigo">IndiGo</option>
										<option value="Air Asia">Air Asia</option>
										<option value="Jet Airways">Jet Airways</option>
										<option value="Air India">Air India</option>
										<option value="Vistara">Vistara</option>
										<option value="Go Air">Go Air</option>
										<option value="Spice Jet">Spicejet</option>
									</select>
								</div>
								<div class="clear"></div>
							</div>
							<div class="clear"></div>
							<input type="submit" value="Search Flights">
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
		<%@include file="MoreHome.jsp"%>
	<%@include file="Footer.jsp"%>
	<script src="js/jquery.min.js">
		
	</script>
	<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true
			// 100% fit in a container
			});
		});
	</script>
	<link rel="stylesheet" href="css/jquery-ui.css" />
	<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker,#datepicker1,#datepicker2,#datepicker3")
					.datepicker();
		});
	</script>
	<!-- //Calendar -->
	<!--quantity-->
	<script>
		$('.value-plus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) + 1;
							divUpd.text(newVal);
						});

		$('.value-minus')
				.on(
						'click',
						function() {
							var divUpd = $(this).parent().find('.value'), newVal = parseInt(
									divUpd.text(), 10) - 1;
							if (newVal >= 1)
								divUpd.text(newVal);
						});
	</script>
	<!--//quantity-->
	<!--load more-->
	<script>
		$(document).ready(function() {
			size_li = $("#myList li").size();
			x = 1;
			$('#myList li:lt(' + x + ')').show();
			$('#loadMore').click(function() {
				x = (x + 1 <= size_li) ? x + 1 : size_li;
				$('#myList li:lt(' + x + ')').show();
			});
			$('#showLess').click(function() {
				x = (x - 1 < 0) ? 1 : x - 1;
				$('#myList li').not(':lt(' + x + ')').hide();
			});
		});
	</script>
	<!-- //load-more -->
	
</body>
</html>