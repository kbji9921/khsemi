package semi.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/ajax/player.phone")
public class PlayerPhoneCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerPhone = req.getParameter("playerPhone");
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectPhone(playerPhone);
			
			resp.setContentType("text/plain; charset=UTF-8");
			if(playerDto != null) {
				resp.getWriter().print("NNNNN");
			}else {
				resp.getWriter().print("NNNNY");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
