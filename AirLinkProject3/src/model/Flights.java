package model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Flights")
public class Flights {
	@Id
	private String flight_id;
	private String airline_name;
	private String source;
	private String destination;
	private String departure_time;
	private String arrival_time;
	private String days_available;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="flight_id")
	private List<Booking> bookings;
	
	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="flight_id")
	private List<Seats> seats;
	
	public List<Seats> getSeats() {
		return seats;
	}

	public void setSeats(List<Seats> seats) {
		this.seats = seats;
	}	

	/*public Flights(String flight_id, String airline_name, String source, String destination, String departure_time,
			String arrival_time, String days_available, List<Booking> bookings, List<Seat> seats) {
		super();
		this.flight_id = flight_id;
		this.airline_name = airline_name;
		this.source = source;
		this.destination = destination;
		this.departure_time = departure_time;
		this.arrival_time = arrival_time;
		this.days_available = days_available;
		this.bookings = bookings;
		this.seats = seats;
	}*/

	public Flights() {
		super();
	}

	public String getFlight_id() {
		return flight_id;
	}

	public void setFlight_id(String flight_id) {
		this.flight_id = flight_id;
	}

	public String getAirline_name() {
		return airline_name;
	}

	public void setAirline_name(String airline_name) {
		this.airline_name = airline_name;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDeparture_time() {
		return departure_time;
	}

	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}

	public String getArrival_time() {
		return arrival_time;
	}

	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}

	public String getDays_available() {
		return days_available;
	}

	public void setDays_available(String days_available) {
		this.days_available = days_available;
	}

	

}
