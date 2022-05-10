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
			String playerId = req.getParameter("playerId");
//			PlayerDto playerDto = new PlayerDto();
//			playerDto.setPlayerId(req.getParameter("playerId"));
//			playerDto.setPlayerName(req.getParameter("playerName"));
//			playerDto.setPlayerPhone(req.getParameter("playerPhone"));
			 
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectOne(playerId);
//			PlayerDto findDto = playerDao.findPw(playerDto);
			
			boolean isPass =playerDto.getPlayerId() != null;
			
			if(isPass) {
				resp.sendRedirect("set_pw.jsp?playerId="+playerDto.getPlayerId());
			}else {
				resp.sendRedirect("findPwPlayer.jsp?error");			
			}
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
