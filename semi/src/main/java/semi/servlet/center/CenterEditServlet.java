package semi.servlet.center;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.CenterDto;

@WebServlet(urlPatterns = "/center/update.kh")
public class CenterEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			CenterDto centerDto = new CenterDto();
			centerDto.setCenterId(req.getParameter("centerId"));
			centerDto.setCenterName(req.getParameter("centerName"));
			centerDto.setCenterPhone(req.getParameter("centerPhone"));
			centerDto.setCenterWeektime(req.getParameter("centerWeektime"));
			centerDto.setCenterWkndtime(req.getParameter("centerWkndtime"));
			centerDto.setCenterPost(req.getParameter("centerPost"));
			centerDto.setCenterBasicAddress(req.getParameter("centerBasicAddress"));
			centerDto.setCenterDetailAddress(req.getParameter("centerDetailAddress"));
			centerDto.setCenterIntroduction(req.getParameter("centerIntroduction"));
			
			//처리
			CenterDao centerDao = new CenterDao();
			boolean success = centerDao.update(centerDto);
			
			//출력
			if(success) {
				resp.sendRedirect("/semi/center/detail.jsp?centerId="+centerDto.getCenterId());
			}
			else {
				resp.sendError(404);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
