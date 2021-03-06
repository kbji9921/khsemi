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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			MatchingDao matchingDao = new MatchingDao();
			int matchingNo = matchingDao.getSequence();
			int ptcount = Integer.parseInt(req.getParameter("matchingDays"));
			int ptPoint = Integer.parseInt(req.getParameter("trainerPrice"));
			
			MatchingDto matchingDto = new MatchingDto();
			matchingDto.setMatchingNo(matchingNo);
			matchingDto.setStudentId(req.getParameter("playerId"));
			matchingDto.setCoachId(req.getParameter("trainerId"));
			
			boolean isEmpty = matchingDao.selectOne(matchingDto) == null;
			if(!isEmpty) {
				resp.sendRedirect(req.getContextPath()+"/player/matchingInsert.jsp?trainerId="+matchingDto.getCoachId()+"&error");
			}else {
				matchingDao.insert(matchingDto,ptcount);
				matchingDao.tpTotalInsert(matchingDto,ptPoint,ptcount);
				resp.sendRedirect(req.getContextPath()+"/player/matchingList.jsp?playerid="+matchingDto.getStudentId());
			}
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
