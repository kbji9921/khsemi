package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.MatchingDao;
import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/pay.player")
public class MatchingPayServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerId = req.getParameter("playerId");
			String trainerId = req.getParameter("trainerId");
			int minusPoint = Integer.parseInt(req.getParameter("playerPoint"));
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectOne(playerId);
			
			MatchingDao matchingDao = new MatchingDao();
			
			
			
			boolean isPayCheck = playerDto.getPlayerPoint() >= minusPoint;
			
			
			if(!isPayCheck){
				resp.sendRedirect(req.getContextPath()+"/player/matchingDetail.jsp?playerId="+playerId+"&coachId="+trainerId+"&error");
			}else if( isPayCheck) {
				playerDao.minusPoint(playerId, minusPoint);
				matchingDao.changeMathcingState(playerId,trainerId);
				resp.sendRedirect(req.getContextPath()+"/player/matchingList.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
