package semi.servlet.player;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerInsertDao;
import semi.servlet.DtoDao.PlayerInsertDto;

@WebServlet(urlPatterns = "/semi/insert.player")
public class PlayerInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			PlayerInsertDto playerInsertDto = new PlayerInsertDto();
			playerInsertDto.setPlayerId(req.getParameter("playerId"));
			playerInsertDto.setPlayerPw(req.getParameter("playerPw"));
			playerInsertDto.setPlayerName(req.getParameter("playerName"));
			playerInsertDto.setPlayerBirth(Date.valueOf(req.getParameter("playerBirth")));
			playerInsertDto.setPlayerPhone(Integer.parseInt(req.getParameter("playerPhone")));
			playerInsertDto.setPlayerEmail(req.getParameter("playerEmail"));
			playerInsertDto.setPlayerPoint(Integer.parseInt(req.getParameter("playerPoint")));
			playerInsertDto.setPlayerGrade(req.getParameter("playerGrade"));
			playerInsertDto.setPlayerJoin(Date.valueOf(req.getParameter("playerJoin")));
			playerInsertDto.setPlayerLogin(Date.valueOf(req.getParameter("playerLogin")));
			
			
			PlayerInsertDao playerInsertDao = new PlayerInsertDao();
			playerInsertDao.insert(playerInsertDto);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
