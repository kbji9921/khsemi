package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/password.player")
public class PlayerChagePwServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String currentPw = req.getParameter("currentPw");
			String changePw = req.getParameter("changePw");
			
			String playerId = (String) req.getSession().getAttribute("login");
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectOne(playerId);
			
			boolean isCorrectPassword = currentPw.equals(playerDto.getPlayerPw());
			if(!isCorrectPassword) {
				resp.sendRedirect("changePw.jsp?error=3");
				return;
			}
			
			boolean isChecckPassword = changePw.length() >= 8;
			if(!isChecckPassword) {
				resp.sendRedirect("changePw.jsp?error=2");
				return;
			}
			
			boolean isSamePassword = currentPw == null || changePw == null || currentPw.equals(changePw);
			if(isSamePassword) {
				resp.sendRedirect("changePw.jsp?error=1");
				return;
			}
			
			
			playerDao.changePassword(playerId, changePw);
			
			
			resp.sendRedirect("mypage.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
