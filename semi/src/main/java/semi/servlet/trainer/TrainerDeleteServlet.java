package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;


@WebServlet(urlPatterns = "/trainer/delete.kh")
public class TrainerDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//준비
			req.setCharacterEncoding("UTF-8");
			String trainerPw = req.getParameter("trainerPw");
			String trainerId = (String)req.getSession().getAttribute("login");
			
			//처리
			TrainerDao trainerDao = new TrainerDao();
			TrainerDto trainerDto = trainerDao.selectOne(trainerId);
			boolean isPasswordCorrect = trainerPw!=null && trainerPw.equals(trainerDto.getTrainerPw());
			if(!isPasswordCorrect) {
				resp.sendRedirect("delete.jsp?error");
				return;
			}
			
			trainerDao.delete(trainerId,trainerPw); //삭제
			//로그아웃
			req.getSession().removeAttribute("login"); 
			req.getSession().removeAttribute("auth");
			//출력
			resp.sendRedirect("exit_finish.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
}
