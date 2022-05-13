package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;

@WebServlet(urlPatterns = "/trainer/setPw2.trainer")
public class TrainerSetPw2Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				
				//준비
				req.setCharacterEncoding("UTF-8");

				String changePw1 = req.getParameter("changePw1");
				String changePw2 = req.getParameter("changepw2");
				

				String trainerId = req.getParameter("trainerId");
				
				//처리
				
				TrainerDao trainerDao = new TrainerDao();
				
			
				trainerDao.changePassword(trainerId, changePw1);
				resp.sendRedirect("trainerLogin.jsp");
	

				
				//출력
				
				
				
				
			}catch(Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
	}
}
