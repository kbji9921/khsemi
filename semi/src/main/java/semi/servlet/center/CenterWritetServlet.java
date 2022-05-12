package semi.servlet.center;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.CenterDto;
import semi.servlet.DtoDao.EocDao;
import semi.servlet.DtoDao.EocDto;

@WebServlet(urlPatterns = "/center/write.kh")
public class CenterWritetServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			CenterDto centerDto = new CenterDto();
			EocDto eocDto = new EocDto();
			centerDto.setCenterId(req.getParameter("centerId"));
			centerDto.setCenterName(req.getParameter("centerName"));
			centerDto.setCenterPhone(req.getParameter("centerPhone"));
			centerDto.setCenterWeektime(req.getParameter("centerWeektime"));
			centerDto.setCenterWkndtime(req.getParameter("centerWkndtime"));
			centerDto.setCenterPost(req.getParameter("centerPost"));
			centerDto.setCenterBasicAddress(req.getParameter("centerBasicAddress"));
			centerDto.setCenterDetailAddress(req.getParameter("centerDetailAddress"));
			centerDto.setCenterIntroduction(req.getParameter("centerIntroduction"));
			
			eocDto.setEocExerciseName(req.getParameter("exerciseName"));
			eocDto.setEocCenterId(req.getParameter("centerId"));
			
			//처리
			CenterDao centerDao = new CenterDao();
			EocDao eocDao = new EocDao();
			//센터별운동번호 시퀀스 불러와서 등록
			eocDto.setEocNo(eocDao.getSequence());
			centerDao.insert(centerDto);
			eocDao.insert1(eocDto);
			
			//출력
//			resp.sendRedirect("/semi/center/detail.jsp?centerId="+centerDto.getCenterId());
			resp.sendRedirect(req.getContextPath());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
