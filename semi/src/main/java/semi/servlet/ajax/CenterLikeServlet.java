package semi.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.CenterDto;

@WebServlet(urlPatterns = "/ajax/center-like.kh")
public class CenterLikeServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			String centerId = req.getParameter("centerId");
			
			//처리
			CenterDao centerDao = new CenterDao();
			int count = centerDao.likeCount(centerId);
			
			//출력
			resp.getWriter().print(count);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
