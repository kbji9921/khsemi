package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.MatchingDao;
import semi.servlet.DtoDao.MatchingDto;

@WebServlet(urlPatterns = "/player/matchingDelete.player")
public class MatchingDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String studentId = req.getParameter("playerId");
			String coachId = req.getParameter("trainerId");
			
			MatchingDao matchingDao = new MatchingDao();
			
			MatchingDto matchingDto = matchingDao.selectCheck(studentId, coachId);
			boolean matchingStateCheck = matchingDto.getMatchingState().length() == 4;
			boolean matchingDaysCheck = matchingDto.getMatchingDays() == 0;
			if(!matchingStateCheck || matchingDaysCheck) {
				matchingDao.delete(studentId, coachId);
				resp.sendRedirect(req.getContextPath()+"/player/matchingList.jsp");
			}else {
				resp.sendRedirect(req.getContextPath()+"/player/matchingList.jsp?error");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
