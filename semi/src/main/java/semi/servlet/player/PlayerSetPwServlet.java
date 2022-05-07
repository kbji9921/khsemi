package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;

@WebServlet(urlPatterns = "/player/set_pw.player")
public class PlayerSetPwServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerId = req.getParameter("playerId");
			String changePw = req.getParameter("changePw");
			
			PlayerDao playerDao = new PlayerDao();
			playerDao.changePassword(playerId, changePw);
			
			
			resp.sendRedirect("set_pw_finish.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
