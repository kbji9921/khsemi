package semi.servlet.eoc;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.EocDao;
import semi.servlet.DtoDao.EocDto;
import semi.servlet.DtoDao.ExerciseDao;
import semi.servlet.DtoDao.ExerciseDto;

@WebServlet(urlPatterns = "/eoc/edit.kh")
public class EocEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			EocDto eocDto = new EocDto();
			eocDto.setEocNo(Long.parseLong(req.getParameter("eocNo")));
			eocDto.setEocExerciseName(req.getParameter("exerciseName"));
			eocDto.setEocCenterId(req.getParameter("centerId"));
			
			//처리
			EocDao eocDao = new EocDao();
			boolean success = eocDao.update(eocDto);
			
			//출력
			if(success) {
				resp.sendRedirect("/semi/eoc/detail.jsp?centerId="+eocDto.getEocCenterId());
			}
			else {
				resp.sendError(404);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
