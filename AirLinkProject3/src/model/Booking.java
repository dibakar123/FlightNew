package model;

import java.util.Date;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name = "Booking")

public class Booking {
	@Id
	private String booking_id;
	@Email(message = "Please enter valid email")
	@NotEmpty(message = "Please enter email")
	private String email;
	
	@NotEmpty(message = "Please enter status")
	private String status;
	private String seat_type;

	@Temporal(TemporalType.DATE)
	private Date dtOfJourney;

	@Temporal(TemporalType.DATE)
	private Date dtOfBooking;


	@Size(max = 10, min = 10, message = "Contact Number size should be 10")
    @NotEmpty(message = "Please enter phone number")
	private String contactNo;
	private int padult;
	private int pChild;
	private int base_charge;
	private int other_charge;
	private int totalFare;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "booking_id")
	private List<Passengers> passengerList;

	public int getBase_charge() {
		return base_charge;
	}

	public void setBase_charge(int base_charge) {
		this.base_charge = base_charge;
	}

	public int getOther_charge() {
		return other_charge;
	}

	public void setOther_charge(int other_charge) {
		this.other_charge = other_charge;
	}

	public List<Passengers> getPassengerList() {
		return passengerList;
	}

	public void setPassengerList(List<Passengers> passenger) {
		this.passengerList = passenger;
	}

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "booking_id")
	private List<Payment> payments;

	public List<Payment> getPayments() {
		return payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

	@ManyToOne
	@JoinColumn(name = "flight_id")
	private Flights flight;

	public Flights getFlight() {
		return flight;
	}

	public void setFlight(Flights flight) {
		this.flight = flight;
	}

	public String getSeat_type() {
		return seat_type;
	}

	public void setSeat_type(String seat_type) {
		this.seat_type = seat_type;
	}

	public String getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}

	/*
	 * public String getFlight_id() { return flight_id; } public void
	 * setFlight_id(String flight_id) { this.flight_id = flight_id; }
	 */
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDtOfJourney() {
		return dtOfJourney;
	}

	public void setDtOfJourney(Date dtOfJourney) {
		this.dtOfJourney = dtOfJourney;
	}

	public Date getDtOfBooking() {
		return dtOfBooking;
	}

	public void setDtOfBooking(Date dtOfBooking) {
		this.dtOfBooking = dtOfBooking;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public int getPadult() {
		return padult;
	}

	public void setPadult(int padult) {
		this.padult = padult;
	}

	public int getpChild() {
		return pChild;
	}

	public void setpChild(int pChild) {
		this.pChild = pChild;
	}

	public int getTotalFare() {
		return totalFare;
	}

	public void setTotalFare(int totalFare) {
		this.totalFare = totalFare;
	}

	/*
	 * public Booking(String booking_id, String flight_id, String email, String
	 * status, Date dtOfJourney, Date dtOfBooking, int contactNo, int padult, int
	 * pChild, int totalFare) { super(); this.booking_id = booking_id;
	 * this.flight_id = flight_id; this.email = email; this.status = status;
	 * this.dtOfJourney = dtOfJourney; this.dtOfBooking = dtOfBooking;
	 * this.contactNo = contactNo; this.padult = padult; this.pChild = pChild;
	 * this.totalFare = totalFare; }
	 */
	public Booking() {
		super();
	}

}
