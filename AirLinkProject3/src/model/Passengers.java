package model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Passengers")
public class Passengers {
	@Id
	private String ticket_id;
	
	@NotNull(message = "Please enter Passenger Name")
	private String pName;
	
	@NotNull(message = "Please enter Age")
	private int age;
	
	@NotNull(message = "Please enter Gender")
	private String gender;
	private String pType;
	
	@NotNull(message = "Please choose category")
	private String category;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "passenger_service_id")
	private PassengerService passenger_service;
	
	
	//@OneToOne
	//@JoinColumn(name = "ticket_id")
	//@OneToOne(fetch = FetchType.LAZY, mappedBy = "passengers", cascade = CascadeType.ALL)
	/*@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "booking_id")
	private Passenger_service passenger_service;*/



	/*public Passenger_service getPassenger_service() {
		return passenger_service;
	}

	public void setPassenger_service(Passenger_service passenger_service) {
		this.passenger_service = passenger_service;
	}*/

	public PassengerService getPassenger_service() {
		return passenger_service;
	}


	public void setPassenger_service(PassengerService passenger_service) {
		this.passenger_service = passenger_service;
	}


	/*
	 * @ManyToOne
	 * 
	 * @JoinColumn(name = "booking_id") private Booking booking;
	 * 
	 * public Booking getBooking() { return booking; }
	 * 
	 * public void setBooking(Booking booking) { this.booking = booking; }
	 */
	public String getTicket_id() {
		return ticket_id;
	}
	

	public void setTicket_id(String ticket_id) {
		this.ticket_id = ticket_id;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
