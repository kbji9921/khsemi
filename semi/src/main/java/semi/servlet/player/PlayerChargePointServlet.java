package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/chargePoint.player")
public class PlayerChargePointServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		String playerId = (String) req.getSession().getAttribute("login");
			
		int chargePoint = Integer.parseInt(req.getParameter("playerPoint"));
		
		PlayerDao playerDao = new PlayerDao();
		
		PlayerDto playerDto = new PlayerDto();
		playerDto = playerDao.selectOne(playerId);
		boolean isIdCorrect = playerDto.getPlayerId().equals(playerId);
		if(isIdCorrect) {
			playerDao.chargePoint(playerId, chargePoint);
			resp.sendRedirect("myinformation.jsp");
		}else {
			resp.sendRedirect("point.jsp?error");
		}
		
		
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
