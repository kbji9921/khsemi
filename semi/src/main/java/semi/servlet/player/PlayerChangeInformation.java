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

@WebServlet(urlPatterns = "/player/chageinformation.player")
public class PlayerChangeInformation extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			PlayerDto playerDto = new PlayerDto();
			
			playerDto.setPlayerId((String) req.getSession().getAttribute("login"));
			
			playerDto.setPlayerName(req.getParameter("playerName"));
			playerDto.setPlayerGender(req.getParameter("playerGender"));
			playerDto.setPlayerBirth(Date.valueOf(req.getParameter("playerBirth")));
			playerDto.setPlayerPhone(req.getParameter("playerPhone"));
			playerDto.setPlayerEmail(req.getParameter("playerEmail"));
			playerDto.setPlayerPw(req.getParameter("playerPw"));
			
			PlayerDao playerDao = new PlayerDao();
			
			PlayerDto findDto = playerDao.selectOne(playerDto.getPlayerId());
			boolean isPasswordCorrect = playerDto.getPlayerPw().equals(findDto.getPlayerPw());
			
			if(!isPasswordCorrect) {
				resp.sendRedirect("myinformation.jsp?error");
				return;
			}
			
			playerDao.changeInformation(playerDto);
			
			resp.sendRedirect("mypage.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
