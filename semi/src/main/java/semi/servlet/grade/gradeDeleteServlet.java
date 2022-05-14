package semi.servlet.grade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.GradeDao;
@WebServlet(urlPatterns ="/grade/gradeDelete.grade")
public class gradeDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			int gradeNo = Integer.parseInt(req.getParameter("gradeNo"));
			String trainerId = req.getParameter("trainerId");
			
			//처리
			GradeDao gradeDao = new GradeDao();
			boolean success = gradeDao.delete(gradeNo);
			
			
			
			
			//출력
			if(success) {

			resp.sendRedirect(req.getContextPath()+"/trainer/trainerDetail.jsp?trainerId="+trainerId);
				
			}else {
				resp.sendError(404);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}
