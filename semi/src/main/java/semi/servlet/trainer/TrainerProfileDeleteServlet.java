package semi.servlet.trainer;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.AttachmentDao;

@WebServlet(urlPatterns = "/profile/profile.delete")
public class TrainerProfileDeleteServlet extends HttpServlet {
	@SuppressWarnings("deprecation")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 준비
			int attachmentNo = Integer.parseInt(req.getParameter("attachmentNo"));
			String trainerId = req.getParameter("trainerId");
	
			// 실제로는 이전 사진 이름을 DB에서 불러온다
			AttachmentDao attachmentDao = new AttachmentDao();
	
			String root = req.getSession().getServletContext().getRealPath("/");

			String path = "D:/upload/kh94";
	        String fileName = attachmentDao.selectName(attachmentNo);
	        String filePath = path+File.separator+fileName;
	        System.out.println(fileName);
	        File file = new File(filePath);
	        attachmentDao.delete(attachmentNo);
	        if(file.exists()) {    //삭제하고자 하는 파일이 해당 서버에 존재하면 삭제시킨다
	            file.delete();
	        }

			// 출력
			resp.sendRedirect(
					req.getContextPath() + "/trainer/trainerMyPage.jsp?trainerId=" + trainerId);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
