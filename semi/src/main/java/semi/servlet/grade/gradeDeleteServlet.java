package semi.servlet.grade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/grade/delete.grade")
public class gradeDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			
			
			//처리
			
			//출력
		
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}