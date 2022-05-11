package semi.servlet.center;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.CenterDao;
@WebServlet(urlPatterns = "/center/delete.kh")
public class CenterDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			String centerId= req.getParameter("centerId");
			
			//처리
			CenterDao centerDao = new CenterDao();
			centerDao.delete(centerId);
			
			//출력
			resp.sendRedirect(req.getContextPath()+"/center/list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
