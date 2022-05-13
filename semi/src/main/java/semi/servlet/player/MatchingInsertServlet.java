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
			
			MatchingDao matchingDao = new MatchingDao();
			int matchingNo = matchingDao.getSequence();
			
			MatchingDto matchingDto = new MatchingDto();
			matchingDto.setMatchingNo(matchingNo);
			matchingDto.setStudentId(req.getParameter("playerId"));
			matchingDto.setCoachId(req.getParameter("trainerId"));
			matchingDto.setMatchingDays(Integer.parseInt(req.getParameter("matchingDays")));
			
			boolean isEmpty = matchingDao.selectOne(matchingDto) == null;
			if(!isEmpty) {
				resp.sendRedirect("matchingInsert.jsp?error");
			}else {
				matchingDao.insert(matchingDto);
				resp.sendRedirect("matchingList.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
