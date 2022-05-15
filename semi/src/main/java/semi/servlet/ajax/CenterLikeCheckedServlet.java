package semi.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.CenterLikeDao;
@WebServlet(urlPatterns = "/ajax/likechecked.kh")
public class CenterLikeCheckedServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			String centerId = req.getParameter("centerId");
			String playerId = req.getParameter("playerId");
			
			CenterLikeDao centerLikeDao = new CenterLikeDao();
			
			//이전 추천 여부 검색
			int result = centerLikeDao.selectLike(centerId, playerId);
			
			//출력
			resp.getWriter().print(result);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
