package pack;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingDao;
import model.Booking;


@WebServlet("/CancelFlight")
public class CancelFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public CancelFlight() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String bookid = request.getParameter("bookid");
				
		BookingDao bookdao= new BookingDao();
		Booking booking = bookdao.searchBookingById(bookid);
		Date journeyDate = booking.getDtOfJourney();
		//String departureTime = booking.getFlight().getDeparture_time();
		Date d2=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		
		long difference = journeyDate.getTime() - d2.getTime();
		float days= (difference / (60*60*1000*24)+1);
		long diffHours = difference / (60 * 60 * 1000) % 24;
		System.out.println(diffHours);
	       System.out.println(days);
	    if(days<0)
	    {
	    	RequestDispatcher rd1 = request.getRequestDispatcher("PaymentStatus.jsp");
	    	request.setAttribute("msg", "Cancel not possible");
	    	request.setAttribute("bookid", bookid);
	    	rd1.forward(request, response);
	   
	    System.out.println("Cancel not possible");	
	    }
	    else
		if(booking.getStatus().equalsIgnoreCase("blocked")||booking.getStatus().equalsIgnoreCase("pending"))
		{
				RequestDispatcher rd = request.getRequestDispatcher("MakePaymentAfterBlock.jsp");
				request.setAttribute("booking", booking);
				rd.forward(request, response);
		    
		}
		else if(booking.getStatus().equalsIgnoreCase("booked"))
		{
		boolean flag = bookdao.flightCancel(bookid);
		if (flag) {
			System.out.println("Cancel done");
			RequestDispatcher rd = request.getRequestDispatcher("PaymentStatus.jsp");
			request.setAttribute("bookid", bookid);
			request.setAttribute("msg",
					"The Cancellation is Successfully done and seat is Cancelled.");
			rd.forward(request, response);
		} else {
			System.out.println("Cancell failed");
			RequestDispatcher rd = request.getRequestDispatcher("PaymentStatus.jsp");
			request.setAttribute("bookid", bookid);
			request.setAttribute("msg",
					"The Cancellation failed . Try Again Later..");
			
			rd.forward(request, response);
		}
		}
		else {
			System.out.println("Already Cancelled");
			RequestDispatcher rd = request.getRequestDispatcher("PaymentStatus.jsp");
			request.setAttribute("bookid", bookid);
			request.setAttribute("msg",
					"The Cancellation is already done.");
			
			rd.forward(request, response);
		}
		
	}

}
