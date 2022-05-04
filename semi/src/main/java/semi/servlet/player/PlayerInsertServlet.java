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

@WebServlet(urlPatterns = "/player/insert.player")
public class PlayerInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			PlayerDto playerDto = new PlayerDto();
			playerDto.setPlayerId(req.getParameter("playerId"));
			playerDto.setPlayerPw(req.getParameter("playerPw"));
			playerDto.setPlayerName(req.getParameter("playerName"));
			playerDto.setPlayerPhone(Integer.parseInt(req.getParameter("playerPhone")));
			playerDto.setPlayerEmail(req.getParameter("playerEmail"));
			
			
			PlayerDao playerDao = new PlayerDao();
			playerDao.insert(playerDto);
			
			resp.getWriter().print("등록성공");
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
