package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;


@WebServlet(urlPatterns = "/trainer/join.kh")
public class TrainerJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			//준비: 아이디, 비번, 이름, 전화번호, 이메일, 생년월일, 가격, 성별, 종목
			req.setCharacterEncoding("UTF-8");
			TrainerDto trainerDto = new TrainerDto();
			trainerDto.setTrainerId(req.getParameter("trainerId"));
			trainerDto.setTrainerPw(req.getParameter("trainerPw"));
			trainerDto.setTrainerName(req.getParameter("trainerName"));
			trainerDto.setTrainerPhone(req.getParameter("trainerPhone"));
			trainerDto.setTrainerEmail(req.getParameter("trainerEmail"));
			trainerDto.setTrainerBirth(req.getParameter("trainerBirth"));
			trainerDto.setTrainerGender(req.getParameter("trainerGender"));
			trainerDto.setTrainerSports(req.getParameter("trainerSports"));
			//처리
			TrainerDao trainerDao = new TrainerDao();
			trainerDao.join(trainerDto);
			//출력
//			resp.sendRedirect(req.getContextPath()+"/trainer/join_finish.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
