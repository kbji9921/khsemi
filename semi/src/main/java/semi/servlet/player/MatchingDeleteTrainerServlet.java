package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.MatchingDao;
import semi.servlet.DtoDao.MatchingDto;

@WebServlet(urlPatterns = "/player/deleteTrainer.matching")
public class MatchingDeleteTrainerServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerId = req.getParameter("playerId");
			String trainerId = req.getParameter("trainerId");
			
			MatchingDao matchingDao = new MatchingDao();
			MatchingDto matchingDto = matchingDao.selectCheck(playerId, trainerId);
			
			boolean matchingStateCheck = matchingDto.getMatchingState().length() == 4;
			if(!matchingStateCheck) {
				matchingDao.delete(playerId,trainerId);
				resp.sendRedirect(req.getContextPath()+"/player/allMatchingList.jsp");
			}else {
				resp.sendRedirect(req.getContextPath()+"/player/allMatchingList.jsp?error");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
