package semi.servlet.grade;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.GradeDao;
import semi.servlet.DtoDao.GradeDto;
@WebServlet(urlPatterns = "/grade/insert.grade")
public class gradeInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			GradeDto gradeDto = new GradeDto();
			gradeDto.setGradeNo(Integer.parseInt(req.getParameter("gradeNo")));
			gradeDto.setGradeTarget(req.getParameter("gradeTarget"));
			gradeDto.setGradeWriter(req.getParameter("gradeWriter"));
			gradeDto.setGradeTime(Date.valueOf(req.getParameter("gradeTime")));
			gradeDto.setGradeContent(req.getParameter("gradeContent"));
			gradeDto.setGradeRate(Integer.parseInt(req.getParameter("gradeRate")));
			
			GradeDao gradeDao = new GradeDao();
			gradeDao.insert(gradeDto);
			
			//resp.getWriter().print("성공");
			//resp.sendRedirect(req.getContextPath()+"/trainer/trainer_detail.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
