package pack;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDao;
import model.Payment;

@WebServlet("/MakePayment")
public class MakePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MakePayment() {
		super();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		//String mcharge= request.getParameter("mcharge");
		String charge = request.getParameter("totalfare"); // fare with gst
		System.out.println("cHAGERE:" + charge);
		String bookid = request.getParameter("bookid");

		//System.out.println("mcharge "+mcharge);
		String actualCharge=(Integer.parseInt(charge)*1.18)+"";
		
		Payment payment = new Payment();
		payment.setBooking_id(bookid);
		payment.setActualAmount(actualCharge);
		payment.setNetAmount(charge);
		payment.setDtOfPayment(new Date());
		payment.setStatus("Booked");
		payment.setDescription(charge + " is same as Actual Fare");
		//payment.setMeals_charge(Integer.parseInt(mcharge));

		BookingDao bookdao = new BookingDao();
		boolean flag = bookdao.makePayment(payment);
		if (flag) {
			System.out.println("payment done");
			RequestDispatcher rd = request.getRequestDispatcher("PaymentStatus.jsp");
			request.setAttribute("bookid", bookid);
			request.setAttribute("msg",
					"The Payment is Successfully done and seat is Booked.");
			rd.forward(request, response);
		} else {
			System.out.println("payment failed");
			RequestDispatcher rd = request.getRequestDispatcher("PaymentStatus.jsp");
			request.setAttribute("bookid", bookid);
			request.setAttribute("msg",
					"The Payment failed and seat is Blocked.");
			
			rd.forward(request, response);
		}

	}

}
