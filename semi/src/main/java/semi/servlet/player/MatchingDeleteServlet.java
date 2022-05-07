package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.MatchingDao;

@WebServlet(urlPatterns = "/player/matchingDelete.player")
public class MatchingDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String studentId = req.getParameter("playerId");
			String coachId = req.getParameter("coachId");
			
			MatchingDao matchingDao = new MatchingDao();
			matchingDao.delete(studentId, coachId);
			
			resp.sendRedirect("matchingList.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
