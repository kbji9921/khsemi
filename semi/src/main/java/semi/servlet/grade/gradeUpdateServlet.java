package semi.servlet.grade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.GradeDao;
import semi.servlet.DtoDao.GradeDto;
@WebServlet(urlPatterns = "/grade/gradeUpdate.grade")
public class gradeUpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비 : 
			GradeDto gradeDto = new GradeDto();
			gradeDto.setGradeNo(Integer.parseInt(req.getParameter("grade_no")));
			gradeDto.setGradeRate(Integer.parseInt(req.getParameter("grade_rate")));
			gradeDto.setGradeContent(req.getParameter("gradeContent"));
			
			
			GradeDao gradeDao = new GradeDao();
			boolean success = gradeDao.update(gradeDto);
			
			if(success) {
				resp.sendRedirect(gradeDto.getGradeTarget());
				
			}
			else {
				resp.sendError(404);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

		
		
		
	}

}
