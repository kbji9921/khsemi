package semi.servlet.player;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/findId.player")
public class FindIdPlayerServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			PlayerDto playerDto = new PlayerDto();
			playerDto.setPlayerName(req.getParameter("playerName"));
			playerDto.setPlayerPhone(req.getParameter("playerPhone"));
			playerDto.setPlayerEmail(req.getParameter("playerEmail"));
			
			PlayerDao playerDao = new PlayerDao();
			String playerId = playerDao.findId(playerDto);
			
			resp.sendRedirect(req.getContextPath()+"/player/idFindSuccess.jsp?playerId="+ playerId);
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
