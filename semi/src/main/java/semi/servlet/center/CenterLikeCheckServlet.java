package semi.servlet.center;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.CenterLikeDao;
import semi.servlet.DtoDao.CenterLikeDto;
@WebServlet(urlPatterns = "/ajax/likecheck.kh")
public class CenterLikeCheckServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			
			String centerId = req.getParameter("centerId");
			String playerId = req.getParameter("playerId");
			
			CenterLikeDao centerLikeDao = new CenterLikeDao();
			CenterDao centerDao = new CenterDao();
			
			//이전 추천 여부 검색
			int result = centerLikeDao.selectLike(centerId, playerId);
			
			if(result==1) {
				centerLikeDao.dislike(centerId, playerId);
				centerDao.dislike(centerId);
				resp.getWriter().print(1);
			}
			else { 
				centerLikeDao.like(centerId, playerId);
				centerDao.like(centerId);
				resp.getWriter().print(0);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
