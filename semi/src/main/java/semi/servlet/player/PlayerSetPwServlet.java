package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/set_pw.player")
public class PlayerSetPwServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerId = req.getParameter("playerId");
			String changePw = req.getParameter("changePw");
			String checkPw = req.getParameter("checkPw");	
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectOne(playerId);
			
			boolean isCheckPassword1 = playerDto.getPlayerPw() != changePw;
			boolean isCheckPassword2 = changePw == checkPw;
			
			if(!isCheckPassword1) {
				resp.sendRedirect("set_pw.jsp?error=1");
				return;
			}
			
			
			
			playerDao.changePassword(playerId, changePw);
			resp.sendRedirect("set_pw_finish.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}