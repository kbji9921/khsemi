package semi.servlet.eoc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.EocDao;
@WebServlet(urlPatterns = "/eoc/delete.kh")
public class EocDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			long eocNo = Long.parseLong(req.getParameter("eocNo"));
			String centerId = req.getParameter("centerId");
			
			//처리
			EocDao eocDao = new EocDao();
			boolean success = eocDao.delete(eocNo);
			
			//출력
			if(success) {
				resp.sendRedirect("/semi/eoc/detail.jsp?centerId="+centerId);
			}
			else {
				resp.sendError(400);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
