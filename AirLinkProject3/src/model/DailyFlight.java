package model;


public class DailyFlight {
	private String flight_id;
	private String airline_name;
	private String source;
	private String destination;
	private String departure_time;
	private String arrival_time;
	private String days_available;
	private int seats_available;
	private String class_type;
	private int seat_cost;
	
	
	public int getSeat_cost() {
		return seat_cost;
	}
	public void setSeat_cost(int seat_cost) {
		this.seat_cost = seat_cost;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
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
	public int getSeats_available() {
		return seats_available;
	}
	public void setSeats_available(int seats_available) {
		this.seats_available = seats_available;
	}
	
	
	

}
