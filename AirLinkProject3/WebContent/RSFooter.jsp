<style>
	#book-now-button{
		background: #F86810;
		color: #fff;
		margin-top: 1.5rem;
	}
	#price-total{
		color: #fff;
		font-size: 1.5rem;
	}
	.price-one{
		color: #fff;
		font-size: 1.5rem;
	}
	.location-code{
		font-size: 1.5rem;
	}
	#footer-div{
		background: #222;
	}
	.flight-logo{
		width: 40px;
		margin-top: -2rem;
	}
	.flight-name{
		padding-top: 2rem;
	}
	.details-time{
		padding-top: 0.7rem;
	}
</style>
<body>
</body>
<footer>
	<div class="card-footer fixed-bottom w-100 text-white" id="footer-div">
		<div class="row w-100 ml-0">
			<div class="col-lg-4">
				<div class="flight-one">
					<div class="row w-100 ml-0">
						<div class="col-lg-4 text-white">
							<div class="d-inline-block">
								<img src="images/indigo.jpg" alt="indigo" class="flight-logo">
							</div>
							<div class="ml-2 d-inline-block pt-3">
								<span class="flight-name">Indigo</span>
								<br>
								6E-2127
							</div>
						</div>
						<div class="col-lg-2 text-center text-white details-time">
							<span>01:30</span><br>
							<span class="location-code text-muted">BBI</span>
						</div>
						<div class="col-lg-1 text-center text-white">
							<p class="mt-4"><i class="fa fa-arrow-right"></i></p>
						</div>
						<div class="col-lg-2 text-center text-white details-time">
							<span>04:05</span><br>
							<span class="location-code text-muted">DEL</span>
						</div>
						<div class="col-lg-3 text-center text-white pt-2">
							<span class="price-one">$25</span><br>
							<span><a href="javascript:void(0)">Details</a></span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="flight-two">
					<div class="row w-100 ml-0">
						<div class="col-lg-4 text-white">
							<div class="d-inline-block">
								<img src="images/indigo.jpg" alt="indigo" class="flight-logo">
							</div>
							<div class="ml-2 d-inline-block pt-3">
								<span class="flight-name">IndiGo</span>
								<br>
								6E-2214
							</div>
						</div>
						<div class="col-lg-2 text-center text-white details-time">
							<span>02:35</span><br>
							<span class="location-code text-muted">DEL</span>
						</div>
						<div class="col-lg-1 text-center text-white">
							<p class="mt-4"><i class="fa fa-arrow-right"></i></p>
						</div>
						<div class="col-lg-2 text-center text-white details-time">
							<span>04:45</span><br>
							<span class="location-code text-muted">BBI</span>
						</div>
						<div class="col-lg-3 text-center text-white pt-2">
							<span class="price-one">$25</span><br>
							<span><a href="javascript:void(0)">Details</a></span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 text-center">
				<p class="text-white mb-0 pb-0">Total Amount</p>
				<p class="mb-0 pb-0">
					<span id="price-total">$50</span>
					<br>
					<a href="javascript:void(0)">Fare Details</a>
				</p>
			</div>
			<div class="col-lg-2 text-center">
				<!-- <button class="btn" id="book-now-button">Book now</button> -->
				<input type="submit" value="Booking">
			</div>
			</form>
		</div>
	</div>
</footer>