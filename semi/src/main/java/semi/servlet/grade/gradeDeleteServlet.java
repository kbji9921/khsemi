package semi.servlet.grade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.GradeDao;
@WebServlet(urlPatterns ="/trainer/grade_delete.grade")
public class gradeDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			int gradeNo = Integer.parseInt(req.getParameter("gradeNo"));
//			String gradeTarget = Integer.parseInt(req.getParameter("gradeTarget"));
			
			//처리
			GradeDao gradeDao = new GradeDao();
			boolean success = gradeDao.delete(gradeNo);
			
			
			
			
			//출력
			if(success) {
//				BoardDao boardDao = new BoardDao();
//				boardDao.updateReplycount(replyTarget); //댓글 수 갱신작업
//				resp.sendRedirect("detail.jsp?boardNo="+replyTarget);
				
			}else {
				resp.sendError(404);
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}
