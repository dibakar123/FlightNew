package model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "passenger_service")

public class PassengerService {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
//	private String ticket_id;
	private String meals;
	private String seatType1;
	private String seatType2;
	private boolean wheelchair;
	private boolean nurses;
	private boolean attendants;
	private boolean medicines;
	//private Passengers passengers;
	
	
	/*@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	
	public Passengers getPassengers() {
		return passengers;
	}

	public void setPassengers(Passengers passengers) {
		this.passengers = passengers;
	}
*/
	public PassengerService() {
		super();
	}

	/*public Passenger_service(String ticket_id, String meals, String seatType1, String seatType2, boolean wheelchair,
			boolean nurses, boolean attendants, boolean medicines) {
		super();
		this.ticket_id = ticket_id;
		this.meals = meals;
		this.seatType1 = seatType1;
		this.seatType2 = seatType2;
		this.wheelchair = wheelchair;
		this.nurses = nurses;
		this.attendants = attendants;
		this.medicines = medicines;
	}*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/*public String getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(String ticket_id) {
		this.ticket_id = ticket_id;
	}
*/
	public String getMeals() {
		return meals;
	}

	public void setMeals(String meals) {
		this.meals = meals;
	}

	public String getSeatType1() {
		return seatType1;
	}

	public void setSeatType1(String seatType1) {
		this.seatType1 = seatType1;
	}

	public String getSeatType2() {
		return seatType2;
	}

	public void setSeatType2(String seatType2) {
		this.seatType2 = seatType2;
	}

	public boolean isWheelchair() {
		return wheelchair;
	}

	public void setWheelchair(boolean wheelchair) {
		this.wheelchair = wheelchair;
	}

	public boolean isNurses() {
		return nurses;
	}

	public void setNurses(boolean nurses) {
		this.nurses = nurses;
	}

	public boolean isAttendants() {
		return attendants;
	}

	public void setAttendants(boolean attendants) {
		this.attendants = attendants;
	}

	public boolean isMedicines() {
		return medicines;
	}

	public void setMedicines(boolean medicines) {
		this.medicines = medicines;
	}

}
