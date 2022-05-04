package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/findId.player")
public class FindIdPlayerServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerName = req.getParameter("playerName");
			int playerPhone = Integer.parseInt(req.getParameter("playerPhone"));
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto  playerDto = playerDao.selectId(playerName,playerPhone);
			
			boolean check1 = playerName != null && playerPhone != 0;
			
			if(check1) {
				resp.sendRedirect("idFindSuccess.jsp");
			}else {
				resp.sendRedirect("idFindFalse.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
