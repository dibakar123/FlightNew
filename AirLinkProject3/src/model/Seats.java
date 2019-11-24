package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SEATS")
public class Seats {
	
	@Id
	private int id;
	//private String flight_id;
	private String class_type;
	private int seat_cost, seats_available;

	public String getClass_type() {
		return class_type;
	}

	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}

	public int getSeat_cost() {
		return seat_cost;
	}

	public void setSeat_cost(int seat_cost) {
		this.seat_cost = seat_cost;
	}

	public int getSeats_available() {
		return seats_available;
	}

	public void setSeats_available(int seats_available) {
		this.seats_available = seats_available;
	}

	public Seats() {
		super();
	}
/*
	public String getFlight_id() {
		return flight_id;
	}

	public void setFlight_id(String flight_id) {
		this.flight_id = flight_id;
	}*/

	/*public Seat(String flight_id, String class_type, int seat_cost, int seats_available) {
		super();
		this.flight_id = flight_id;
		this.class_type = class_type;
		this.seat_cost = seat_cost;
		this.seats_available = seats_available;
	}*/

}
