package semi.servlet.reservation;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.ReservationDao;
import semi.servlet.DtoDao.ReservationDto;

@WebServlet(urlPatterns="/reservation/insert.kh")
public class ReservationInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setPlayerId(req.getParameter("playerId"));
			reservationDto.setTrainerId(req.getParameter("trainerId"));
			reservationDto.setReservationDate(Date.valueOf(req.getParameter("reservationDate")));
			reservationDto.setReservationTime(req.getParameter("reservationTime"));
			
			ReservationDao reservationDao = new ReservationDao();
			int reservationNo = reservationDao.getSequence();
			reservationDto.setReservationNo(reservationNo);
			
			reservationDao.insert(reservationDto);
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
