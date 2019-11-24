package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "payment")

public class Payment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int p_id;
	private String booking_id;
	private String netAmount;
	private String actualAmount;

	@Temporal(TemporalType.DATE)
	private Date dtOfPayment;
	private String status;
	private String Description;
	
	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}

	public String getNetAmount() {
		return netAmount;
	}

	public void setNetAmount(String netAmount) {
		this.netAmount = netAmount;
	}

	public String getActualAmount() {
		return actualAmount;
	}

	public void setActualAmount(String actualAmount) {
		this.actualAmount = actualAmount;
	}

	public Date getDtOfPayment() {
		return dtOfPayment;
	}

	public void setDtOfPayment(Date dtOfPayment) {
		this.dtOfPayment = dtOfPayment;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Payment(int p_id, String booking_id, String netAmount, String actualAmount, Date dtOfPayment, String status,
			String description) {
		super();
		this.p_id = p_id;
		this.booking_id = booking_id;
		this.netAmount = netAmount;
		this.actualAmount = actualAmount;
		this.dtOfPayment = dtOfPayment;
		this.status = status;
		Description = description;
	}

	public Payment() {
		super();
	}

}
