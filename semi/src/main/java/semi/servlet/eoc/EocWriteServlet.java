package semi.servlet.eoc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.EocDao;
import semi.servlet.DtoDao.EocDto;
@WebServlet(urlPatterns = "/eoc/write.kh")
public class EocWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			EocDto eocDto = new EocDto();
			eocDto.setEocCenterId(req.getParameter("centerId"));
			eocDto.setEocExerciseName(req.getParameter("exerciseName"));
			
			EocDao eocDao = new EocDao();
			eocDto.setEocNo(eocDao.getSequence());
			//처리
			EocDto findDto = eocDao.selectOne(eocDto.getEocExerciseName() ,eocDto.getEocCenterId());
			boolean isExist = findDto !=null;
			if(isExist) {
			//출력
			resp.sendRedirect(req.getContextPath()+"/eoc/detail.jsp?centerId="+eocDto.getEocCenterId()+"&error");
			}else {
			resp.sendRedirect(req.getContextPath()+"/eoc/detail.jsp?centerId="+eocDto.getEocCenterId());
			eocDao.insert1(eocDto);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
