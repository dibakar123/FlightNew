package dao;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import model.DailyFlight;
import model.DailyStatus;
import model.Flights;
import model.Seats;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class FlightDao {

	
	public List<DailyFlight> fsearch(String source, String destination, String jdate, String class_type,String airline)
			throws ParseException {
		System.out.println("jdate:" + jdate);
		List<Flights> flightList = new ArrayList<Flights>();
		List<DailyFlight> dflightList = new ArrayList<DailyFlight>();

		Connection con = null;
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("EEE");
		Date day = sdf.parse(jdate);
		System.out.println("day:" + day);
		java.sql.Date date = new java.sql.Date(day.getTime());
		System.out.println(
				"date:" + date + " Source " + source + "  dest " + destination + "  " + jdate + "  " + class_type);
		String stringDate = sdf1.format(day);
		try {

			Session session = new SessionDao().getSession();
			System.out.println("fligt:" + flightList);
			Query query = session.createQuery("from Flights where source=:source and destination=:dest and airline_name=:aname");
			query.setParameter("source", source);
			query.setParameter("dest", destination);
			query.setParameter("aname", airline);
			System.out.println("flightList1:" + flightList);
			flightList = query.list();
			System.out.println("flightList2:" + flightList);
			System.out.println("flightList:" + flightList.size());

			for (Flights flight : flightList) {
				System.out.println("flight.getDays_available():" + flight.getDays_available());
				System.out.println("stringDate:" + stringDate);
				if (flight.getDays_available().indexOf(stringDate) != -1) {

					Seats seat = null;
					System.out.println("Seat Length:" + flight.getSeats() + "  " + flight.getSeats().size());
					for (Seats s : flight.getSeats()) {
						if (class_type.equalsIgnoreCase(s.getClass_type())) {
							seat = s;
							break;
						}
					}
					System.out.println("seat=" + seat);
					Query statusQuery= session.createQuery("from DailyStatus  where flight_id=:fid and fdate=:fdt and seatType=:st");
					statusQuery.setParameter("fid", flight.getFlight_id());
					statusQuery.setParameter("fdt", date);
					statusQuery.setParameter("st", class_type);
					System.out.println("day:" + jdate);

					int booked = 0;
					DailyStatus daily_status=(DailyStatus)statusQuery.uniqueResult();
					if(daily_status!=null) {
						booked=daily_status.getBookedSeat();
					}System.out.println("booked=" + booked + " Total Seat=" + seat.getSeats_available() + " Booked rest:"
							+ (seat.getSeats_available() - booked));
					DailyFlight f = new DailyFlight();
					f.setSource(flight.getSource());
					f.setDestination(flight.getDestination());
					f.setDeparture_time(flight.getDeparture_time());
					f.setArrival_time(flight.getArrival_time());
					f.setAirline_name(flight.getAirline_name());
					f.setFlight_id(flight.getFlight_id());
					f.setDays_available(flight.getDays_available());
					f.setClass_type(seat.getClass_type());
					f.setSeats_available(seat.getSeats_available() - booked);
					f.setSeat_cost(seat.getSeat_cost());
					dflightList.add(f);

				}
			}
			System.out.println("Length:" + flightList.size());
			session.close();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return dflightList;
	}


	public List<DailyFlight> fsearch(String source, String destination, String jdate, String class_type)
			throws ParseException {
		System.out.println("jdate:" + jdate);
		List<Flights> flightList = new ArrayList<Flights>();
		List<DailyFlight> dflightList = new ArrayList<DailyFlight>();

		Connection con = null;
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("EEE");
		Date day = sdf.parse(jdate);
		System.out.println("day:" + day);
		java.sql.Date date = new java.sql.Date(day.getTime());
		System.out.println(
				"date:" + date + " Source " + source + "  dest " + destination + "  " + jdate + "  " + class_type);
		String stringDate = sdf1.format(day);
		try {

			Session session = new SessionDao().getSession();
			System.out.println("fligt:" + flightList);
			Query query = session.createQuery("from Flights where source=:source and destination=:dest");
			query.setParameter("source", source);
			query.setParameter("dest", destination);
			System.out.println("flightList1:" + flightList);
			flightList = query.list();
			System.out.println("flightList2:" + flightList);
			System.out.println("flightList:" + flightList.size());

			for (Flights flight : flightList) {
				System.out.println("flight.getDays_available():" + flight.getDays_available());
				System.out.println("stringDate:" + stringDate);
				if (flight.getDays_available().indexOf(stringDate) != -1) {

					Seats seat = null;
					System.out.println("Seat Length:" + flight.getSeats() + "  " + flight.getSeats().size());
					for (Seats s : flight.getSeats()) {
						if (class_type.equalsIgnoreCase(s.getClass_type())) {
							seat = s;
							break;
						}
					}
					System.out.println("seat=" + seat);
					Query statusQuery= session.createQuery("from DailyStatus  where flight_id=:fid and fdate=:fdt and seatType=:st");
					statusQuery.setParameter("fid", flight.getFlight_id());
					statusQuery.setParameter("fdt", date);
					statusQuery.setParameter("st", class_type);
					System.out.println("day:" + jdate);
					int booked = 0;
					DailyStatus daily_status=(DailyStatus)statusQuery.uniqueResult();
					if(daily_status!=null) {
						booked=daily_status.getBookedSeat();
					}
					System.out.println("booked=" + booked + " Total Seat=" + seat.getSeats_available() + " Booked rest:"
							+ (seat.getSeats_available() - booked));
					DailyFlight f = new DailyFlight();
					f.setSource(flight.getSource());
					f.setDestination(flight.getDestination());
					f.setDeparture_time(flight.getDeparture_time());
					f.setArrival_time(flight.getArrival_time());
					f.setAirline_name(flight.getAirline_name());
					f.setFlight_id(flight.getFlight_id());
					f.setDays_available(flight.getDays_available());
					f.setClass_type(seat.getClass_type());
					f.setSeats_available(seat.getSeats_available() - booked);
					f.setSeat_cost(seat.getSeat_cost());
					dflightList.add(f);

				}
			}
			System.out.println("Length:" + flightList.size());
			session.close();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return dflightList;
	}

	
	public Flights fsearch(String flightno) throws ParseException {
		Flights flight = null;
		try {

			Session session = new SessionDao().getSession();
			flight = (Flights) session.get(Flights.class, flightno);
			session.close();
		}

		catch (Exception e) {
			System.out.println(e);
		}
		return flight;

	}

}
