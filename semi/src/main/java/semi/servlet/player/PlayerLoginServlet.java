package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/login.player")
public class PlayerLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerId = req.getParameter("playerId");
			String playerPw = req.getParameter("playerPw");
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectOne(playerId);
			
			boolean isLogin = playerDto != null && playerDto.getPlayerPw().equals(playerPw);
			
			if(isLogin) {
				playerDao.updateLogindate(playerId);
				
				resp.sendRedirect("loginSuccess.jsp");
			}else {
				resp.sendRedirect("login.jsp?error");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
