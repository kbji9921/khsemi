package semi.servlet.center;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.CenterDao;


@WebServlet(urlPatterns = "/ajax/dislikecheck.kh")
public class CenterDislikeServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//처리
			String centerId = req.getParameter("centerId");
			
			//출력
			CenterDao centerDao = new CenterDao();
			boolean success = centerDao.dislike(centerId);
			int count = centerDao.likeCount(centerId);
			
			//처리
			resp.setContentType("text/plain; charset=UTF-8");
			if(success) {
				resp.getWriter().print(count);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
