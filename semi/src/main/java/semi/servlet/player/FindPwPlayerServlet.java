package semi.servlet.player;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.sql.DATE;
import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/findPw.player")
public class FindPwPlayerServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			//String playerId = req.getParameter("playerId");
			PlayerDto playerDto = new PlayerDto();
			playerDto.setPlayerId(req.getParameter("playerId"));
			playerDto.setPlayerName(req.getParameter("playerName"));
			playerDto.setPlayerBirth(Date.valueOf(req.getParameter("playerBirth")));
			playerDto.setPlayerPhone(req.getParameter("playerPhone"));
			 
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto findDto = playerDao.findPw(playerDto);
//			PlayerDto findDto = playerDao.findPw(playerDto);
			
			boolean isPass =findDto != null;
			
			if(isPass) {
				resp.sendRedirect(req.getContextPath()+"/player/set_pw.jsp?playerId="+findDto.getPlayerId());
			}else {
				resp.sendRedirect(req.getContextPath()+"/player/findPwPlayer.jsp?error");			
			}
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
