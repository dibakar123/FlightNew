package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Booking;
import model.DailyStatus;
import model.Flights;
import model.Payment;

public class BookingDao {
	@SuppressWarnings("unchecked")
	public boolean doBooking(Booking book, String flightId) {
		boolean flag = false;
		try {
			book.setDtOfBooking(new Date());
			Session session = new SessionDao().getSession();
			Transaction t = session.beginTransaction();
			
			/*List<Passengers> plist= new ArrayList<Passengers>();
			plist=book.getPassengers();*/
            System.out.println("passe:"+book.getPassengerList().size());
			Flights flight = (Flights) session.get(Flights.class, flightId);
			
			/*for(Passengers p :book.getPassengers()) {
				session.save(p);
			}*/
			
			List<Booking> bookinglist = flight.getBookings();
			if (bookinglist == null)
				bookinglist = new ArrayList<Booking>();
			bookinglist.add(book);
			session.update(flight);

			Query query = session.createQuery(
					"from DailyStatus where flight_id=:flight_id and fDate=:fDate and seatType=:seatType");
			query.setParameter("flight_id", flightId);
			query.setParameter("fDate", book.getDtOfJourney());
			query.setParameter("seatType", book.getSeat_type());

			List<DailyStatus> dailystatus = null;
			try {
				dailystatus = query.list();
			} catch (Exception ee) {
				System.out.println(ee);
			}
			System.out.println("dailystatus:" + dailystatus.size() + " " + dailystatus);
			if (dailystatus.size() == 0) {
				DailyStatus status = new DailyStatus();
				status.setFlight_id(flightId);
				status.setfDate(book.getDtOfJourney());
				status.setSeatType(book.getSeat_type());
				status.setBookedSeat(book.getPadult() + book.getpChild());
				session.persist(status);
			} else {
				int alreadybooked = dailystatus.get(0).getBookedSeat();
				dailystatus.get(0).setBookedSeat(alreadybooked + book.getPadult() + book.getpChild());
				session.update(dailystatus.get(0));
			}

			t.commit();
			session.close();
			flag = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return flag;

	}

	public boolean makePayment(Payment payment) {
		boolean result = false;
		try {
			// book.setDtOfBooking(new Date());
			Session session = new SessionDao().getSession();
			Transaction t = session.beginTransaction();

			Booking booking = (Booking) session.get(Booking.class, payment.getBooking_id());
			System.out.println(booking.getContactNo());
			List<Payment> payments = booking.getPayments();
			System.out.println(payments+"  "+payments.size());
			payments.add(payment);
			booking.setStatus("Booked");
			session.update(booking);
			t.commit();
			session.close();
			result = true;
		} catch (Exception ee) {
			System.out.println(ee);
		}

		return result;
	}
	public Booking searchBookingById(String bookid){
		Booking booking =null;
		Session session= new SessionDao().getSession();
		//Transaction t=session.beginTransaction();  
		try {
		booking= (Booking) session.get(Booking.class,bookid);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		session.close();
		return booking;
		
	}
	public boolean flightCancel(String bookid) {
		boolean result = false;
		try {
			// book.setDtOfBooking(new Date());
			Session session = new SessionDao().getSession();
			Transaction t = session.beginTransaction();

			Booking booking = (Booking) session.get(Booking.class,bookid);
			System.out.println(booking.getContactNo());
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
		    result=false;	
		    System.out.println("Cancel not possible");	
		    }
		    else {
			double netFare = booking.getTotalFare()*1.18;
			int refundFare = 0;
			
			
	    
		       if(days>=7 && days<=21)
		       {
		    	   refundFare = (int) (netFare*0.90);
		    	   System.out.println("You get 90% dicount in your ticket");
		    	   
		       }
		       else if(days>=3 && days<=6)
		       {
		    	   refundFare = (int) (netFare*0.50);
		    	   System.out.println("You get 50% dicount in your ticket");
		       }
		       else if(days>=1 && days<=2)
		       {
		    	   refundFare = (int) (netFare*0.25);
		    	   System.out.println("You get 25% dicount in your ticket");
		       }
		       else if(days==0)
		       {
		    	   refundFare = (int) (netFare*0.10);
		    	   System.out.println("You get 10% dicount in your ticket");
		       }
		       
		       booking.setStatus("Cancelled");
		       Payment payment = new Payment();
				payment.setBooking_id(bookid);
				payment.setActualAmount(refundFare+"");
				payment.setNetAmount(netFare+"");
				payment.setDtOfPayment(new Date());
				payment.setStatus("Cancelled");
				payment.setDescription(refundFare + " is Refunded for Cancellation.");
				List<Payment> payments = booking.getPayments();
				System.out.println(payments+"  "+payments.size());
				payments.add(payment);
				session.update(booking);
				System.out.println("flight_id "+ booking.getFlight().getFlight_id());
				System.out.println("fDate "+booking.getDtOfBooking() );
				System.out.println("seatType "+booking.getSeat_type() );				
				Query query = session.createQuery("from DailyStatus where flight_id=:flight_id and fDate=:fDate and seatType=:seatType");
				query.setParameter("flight_id", booking.getFlight().getFlight_id());
				query.setParameter("fDate",booking.getDtOfJourney() );
				query.setParameter("seatType",booking.getSeat_type() );
			
				List<DailyStatus> dailystatus = null;
				try{
					dailystatus =query.list();
				}
				catch (Exception ee) {
					System.out.println(ee);}
				System.out.println("dailystatus:"+dailystatus.size()+" "+dailystatus);
				//means no daily status found as size 0.. now run it for this date no data
				
				int alreadybooked=dailystatus.get(0).getBookedSeat();
				dailystatus.get(0).setBookedSeat(alreadybooked-booking.getPadult()-booking.getpChild());
				session.update(dailystatus.get(0));
				
				t.commit();
				session.close();
		        result = true;
		    }
			}
			catch(Exception e){
				  e.printStackTrace();
			}
		
      
		return result;
	}

}
