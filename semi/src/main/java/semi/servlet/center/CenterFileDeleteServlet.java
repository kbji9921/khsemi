package semi.servlet.center;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.AttachmentDao;

@WebServlet(urlPatterns = "/profile/profileDelete.center")
public class CenterFileDeleteServlet extends HttpServlet {
	@SuppressWarnings("deprecation")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 준비
			int attachmentNo = Integer.parseInt(req.getParameter("attachmentNo"));
			String centerId = req.getParameter("centerId");
	
			AttachmentDao attachmentDao = new AttachmentDao();
	
			String root = req.getSession().getServletContext().getRealPath("/");

			String path = "D:/upload/kh94";
	        String fileName = attachmentDao.selectName(attachmentNo);
	        String filePath = path+File.separator+fileName;
	        System.out.println(fileName);
	        File file = new File(filePath);
	        attachmentDao.delete(attachmentNo);
	        if(file.exists()) {    
	            file.delete();
	        }

			// 출력
			resp.sendRedirect(
					req.getContextPath() + "/center/update.jsp?centerId=" + centerId);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
