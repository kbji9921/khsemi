package semi.servlet.reservation;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.MatchingDao;
import semi.servlet.DtoDao.ReservationDao;
import semi.servlet.DtoDao.ReservationDto;

@WebServlet(urlPatterns = "/reservation/reservation.Delete")
public class ReservationDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setPlayerId(req.getParameter("playerId"));
			reservationDto.setTrainerId(req.getParameter("trainerId"));
			reservationDto.setReservationDate(Date.valueOf(req.getParameter("reservationDate")));
			reservationDto.setReservationTime(req.getParameter("reservationTime"));
			
			MatchingDao matchingDao = new MatchingDao();
			
			ReservationDao reservationDao = new ReservationDao();
			boolean isEmpty = reservationDao.selectDto(reservationDto) == null;
			if(!isEmpty) {
				reservationDao.delete(reservationDto);
				matchingDao.plusPt(reservationDto);
				resp.sendRedirect(req.getContextPath()+"/player/matchingList.jsp");
			}else {
				resp.sendRedirect(req.getContextPath()+"/reservation/reservationListPlayer.jsp?error");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
