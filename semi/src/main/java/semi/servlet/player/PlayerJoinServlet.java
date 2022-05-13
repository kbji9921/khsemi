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
public class PlayerJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			PlayerDto playerDto = new PlayerDto();
			playerDto.setPlayerId(req.getParameter("playerId"));
			playerDto.setPlayerPw(req.getParameter("playerPw"));
			playerDto.setPlayerName(req.getParameter("playerName"));
			playerDto.setPlayerGender(req.getParameter("playerGender"));
			playerDto.setPlayerBirth(Date.valueOf(req.getParameter("playerBirth")));
			playerDto.setPlayerPhone(req.getParameter("playerPhone"));
			playerDto.setPlayerEmail(req.getParameter("playerEmail"));
			
			
			PlayerDao playerDao = new PlayerDao();
			boolean phoneCheck = playerDto.getPlayerPhone().length() > 11;
			
			if(phoneCheck) {
				resp.sendRedirect(req.getContextPath()+"/player/joing.jsp?error=1");
				return;
			}
			
			playerDao.insert(playerDto);
			
			boolean success = playerDao.selectOne(playerDto.getPlayerId()) != null;
			if(success) {
				resp.sendRedirect(req.getContextPath()+"/player/joinSuccess.jsp?playerId="+playerDto.getPlayerId());
			}else {
				resp.sendRedirect(req.getContextPath()+"/player/joing.jsp?error=2");
				return;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
