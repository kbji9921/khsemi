package semi.servlet.player;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.MatchingDao;
import semi.servlet.DtoDao.MatchingDto;

@WebServlet(urlPatterns = "/player/matching.insert")
public class MatchingInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			MatchingDto matchingDto = new MatchingDto();
			matchingDto.setStudentId(req.getParameter("studentId"));
			matchingDto.setCoachId(req.getParameter("coachId"));
			matchingDto.setMatchingDays(Integer.parseInt(req.getParameter("matchingDays")));
			
			
			MatchingDao matchingDao = new MatchingDao();
			matchingDao.insert(matchingDto);
			
			resp.sendRedirect("matchingList.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
