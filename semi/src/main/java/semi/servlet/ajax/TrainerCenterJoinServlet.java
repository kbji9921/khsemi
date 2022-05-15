package semi.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.CenterDto;
@WebServlet(urlPatterns = "/ajax/trainer-center.join")
public class TrainerCenterJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			String centerId = req.getParameter("centerId");
			
			//처리
			CenterDao centerDao = new CenterDao();
			CenterDto centerDto = centerDao.selectOne(centerId);
			
			//출력
			resp.setContentType("text/plain; charset=UTF-8");
			if(centerDto != null) {
				resp.getWriter().print("YY");
			}
			else {
				resp.getWriter().print("NN");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
