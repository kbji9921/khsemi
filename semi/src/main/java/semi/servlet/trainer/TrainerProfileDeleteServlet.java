package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.AttachmentDao;

@WebServlet(urlPatterns = "/profile/profile.delete")
public class TrainerProfileDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 준비
			int attachmentNo = Integer.parseInt(req.getParameter("attachmentNo"));
			String trainerId = req.getParameter("trainerId");
	
			// 실제로는 이전 사진 이름을 DB에서 불러온다
			AttachmentDao attachmentDao = new AttachmentDao();
	
			attachmentDao.delete(attachmentNo);
	
		    

			// 출력
			resp.sendRedirect(
					req.getContextPath() + "/trainer/trainerMyPage.jsp?trainerId=" + trainerId);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
