package semi.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/ajax/player.id")
public class PlayerIdCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerId = req.getParameter("playerId");
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectOne(playerId);
			
			resp.setContentType("text/plain; charset=UTF-8");
			if(playerDto != null) {
				resp.getWriter().print("N");
			}else {
				resp.getWriter().print("Y");	
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
