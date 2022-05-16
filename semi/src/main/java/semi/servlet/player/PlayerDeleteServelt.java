package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns = "/player/delete.player")
public class PlayerDeleteServelt extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String playerId= req.getParameter("playerId");
			String playerPw = req.getParameter("playerPw");
			
			PlayerDao playerDao = new PlayerDao();
			PlayerDto playerDto = playerDao.selectOne(playerId);
			
			boolean isPasswordCorrect = playerPw != null && playerPw.equals(playerDto.getPlayerPw());
			if(!isPasswordCorrect) {
				resp.sendRedirect("delete.jsp?error");
				return;
			}
			
			playerDao.delete(playerId);
			
			req.getSession().removeAttribute("login");
			
			resp.sendRedirect(req.getContextPath());
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
