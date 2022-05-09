package semi.servlet.grade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.GradeDao;
@WebServlet("/grade/delete.grade")
public class gradeDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			int gradeNo = Integer.parseInt(req.getParameter("gradeNo"));
			String gradeTarget = req.getParameter("gradeTarget");
			
			//처리
			GradeDao gradeDao = new GradeDao();
			boolean success = gradeDao.delete(gradeTarget);
			
			//출력
			if(success) {
				//GradeDao gradeDao = new GradeDao();
				resp.sendRedirect("detail.jsp?="+gradeTarget);
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
