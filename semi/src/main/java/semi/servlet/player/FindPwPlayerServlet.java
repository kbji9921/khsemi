package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/findPw.player")
public class FindPwPlayerServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			PlayerDto playerDto = new PlayerDto();
			playerDto.setPlayerId(req.getParameter("playerId"));
			playerDto.setPlayerName(req.getParameter("playerName"));
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto findDto = playerDao.findPw(playerDto);
			
			if(findDto != null) {
				resp.sendRedirect(getServletInfo());
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
