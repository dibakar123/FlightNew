package pack;

import java.io.IOException;
//import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDao;
import model.Booking;
import model.PassengerService;
import model.Passengers;

@WebServlet("/FlightBooks")
public class FlightBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FlightBooks() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String class_type = request.getParameter("class_type");
		String flightId = request.getParameter("flightid");
		String jdate = request.getParameter("jdate");
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		String contactNo = request.getParameter("contactNo");
		String email = request.getParameter("email");
		String charge = request.getParameter("charge");
		String status = request.getParameter("status");
		String totalcharge = request.getParameter("totalcharge");

		int passenger = Integer.parseInt(adult) + Integer.parseInt(child);

		List<Passengers> plist = new ArrayList<Passengers>();

		int mcharge = 0;

		for (int i = 1; i <= passenger; i++) {
			System.out.println("Total:" + i);
			Passengers passengers = new Passengers();

			String pName = request.getParameter("pName" + i);
			String age = request.getParameter("age" + i);
			String pType = request.getParameter("pType" + i);
			String gender = request.getParameter("gender" + i);
			String category = request.getParameter("category" + i);

			String meals = request.getParameter("meals" + i);
			String seatType1 = request.getParameter("seatType1" + i);
			String seatType2 = request.getParameter("seatType2" + i);
			String wheelchair = request.getParameter("wheelchair" + i);
			String nurses = request.getParameter("nurses" + i);
			String attendants = request.getParameter("attendants" + i);
			String medicines = request.getParameter("medicines" + i);

			System.out.println("meal" + (i + 1) + " " + meals + "----" + "charge" + (i + 1) + " " + mcharge);

			if (category.equals("Student") && pType.equals("Adult")) {
				totalcharge = (int)(Integer.parseInt(totalcharge) - Integer.parseInt(charge) * (0.1)) + "";
			} else if (category.equals("Seniorcitizen") && pType.equals("Adult")) {
				totalcharge = (int)(Integer.parseInt(totalcharge) - Integer.parseInt(charge) * (0.15)) + "";
			} else if (category.equals("AirlineStaff") && pType.equals("Adult")) {
				totalcharge = (int)(Integer.parseInt(totalcharge) - Integer.parseInt(charge) * (0.3)) + "";
			} else if (category.equals("DefensePersonnel") && pType.equals("Adult")) {
				totalcharge = (int)(Integer.parseInt(totalcharge) -Integer.parseInt(charge) * (0.2)) + "";
			}

			System.out.println(meals);
			if (meals.equals("vmeal")) {
				mcharge += 450;
			} else if (meals.equals("nvmeal")) {
				mcharge += 650;
			}

			String ticket_id = "T" + (int) (Math.random() * 100) + (int) (Math.random() * 100)
					+ (int) (Math.random() * 100);

			PassengerService service = new PassengerService();
			service.setMeals(meals);
			service.setSeatType1(seatType1);
			service.setSeatType2(seatType2);
			service.setWheelchair(Boolean.parseBoolean(wheelchair));
			service.setNurses(Boolean.parseBoolean(nurses));
			service.setAttendants(Boolean.parseBoolean(attendants));
			service.setMedicines(Boolean.parseBoolean(medicines));

			passengers.setAge(Integer.parseInt(age));
			passengers.setCategory(category);
			passengers.setGender(gender);
			passengers.setpName(pName);
			passengers.setpType(pType);
			passengers.setTicket_id(ticket_id);
			passengers.setPassenger_service(service);
			plist.add(passengers);
		}

		// request.setAttribute("mcharge", mcharge);

		String bookid = "B" + (int) (Math.random() * 100) + (int) (Math.random() * 100) + (int) (Math.random() * 100);

		System.out.println(flightId + "---" + jdate + "---" + adult + "---" + child + "--" + contactNo + "--" + email
				+ "--" + charge + "--" + status + "--" + bookid);
		System.out.println("seat_type=" + class_type);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

		int fare = mcharge + Integer.parseInt(totalcharge);
		String tcharge = fare + "";

		Booking booking = new Booking();
		/* booking.setFlight_id(flightId); */
		booking.setBooking_id(bookid);
		booking.setContactNo(contactNo);
		booking.setEmail(email);
		booking.setPadult(Integer.parseInt(adult));
		booking.setpChild(Integer.parseInt(child));
		booking.setTotalFare(Integer.parseInt(tcharge));
		booking.setStatus(status);
		booking.setSeat_type(class_type);
		booking.setPassengerList(plist);
		booking.setBase_charge(Integer.parseInt(charge));
		booking.setOther_charge(mcharge);

		try {
			booking.setDtOfJourney(sdf.parse(jdate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		BookingDao book = new BookingDao();
		boolean flag = book.doBooking(booking, flightId);

		// PrintWriter out= response.getWriter();
		if (flag) {
			if (status.equalsIgnoreCase("blocked") == false) {
				RequestDispatcher rd = request.getRequestDispatcher("MakePayment.jsp");
				request.setAttribute("bookid", bookid);
				request.setAttribute("mcharge", mcharge);
				request.setAttribute("tcharge",tcharge);
				rd.forward(request, response);
				System.out.println("record updated and go for payment");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("PaymentStatus.jsp");
				request.setAttribute("bookid", bookid);
				request.setAttribute("msg", "The Seat is Successfully blocked");
				rd.forward(request, response);
				System.out.println("record updated and seat blocked");
			}
		}

		else {
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
			System.out.println("record not updated");
		}
	}

}
