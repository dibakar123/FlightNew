<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

		<nav class="navbar navbar-expand-lg navbar-light bg-light" style="opacity: 0.7">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
  		</button>
  		<a class="navbar-brand" href="#"><img src="images/logo_edited.jpg"  ></a>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
    			<li class="nav-item active">
        			<a class="nav-link" href="Home.jsp">Home</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="PnrStatus.jsp">Booking Status</a>
      			</li>
            <li class="nav-item">
              <a class="nav-link" href="Cancel.jsp">Cancel Ticket</a>
            </li>

    		</ul>
    		
    		<form class="bg-white" action="searchByFNo.jsp">
      			
      			<input class="form-control mr-sm-2" name="flightno" type="search" placeholder="Search By Flight No." aria-label="Search">
      			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    		</form>
  		</div>
		</nav>
