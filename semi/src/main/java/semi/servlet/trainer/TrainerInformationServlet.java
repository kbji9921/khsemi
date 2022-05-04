package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns ="/trainer/information.kh")
public class TrainerInformationServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			 TrainerDto trainerDto = new TrainerDto();
			 String id = (String)req.getSession().getAttribute("login");
			 trainerDto.setTrainerId(id);
			 trainerDto.setTrainerPhone(req.getParameter("trainerPhone"));
			 trainerDto.setTrainerSports(req.getParameter("trainerSports"));
			 trainerDto.setTrainerEmail(req.getParameter("trainerEmail"));
			 trainerDto.setTrainerPrice(Integer.parseInt("trainerPrice"));
			 trainerDto.setTrainerName(req.getParameter("trainerName"));
			 trainerDto.setTrainerBirth(req.getParameter("trainerBirth"));
			 
			//처리
			//1. 원래 db의 회원정보를 불러와서 비교
			TrainerDao trainerDao = new TrainerDao();
			TrainerDto findDto = trainerDao.selectOne(trainerDto.getTrainerId());
			boolean isPasswordCorrect = trainerDto.getTrainerPw().equals(findDto.getTrainerPw());
				
			if(!isPasswordCorrect) {
				resp.sendRedirect("information.jsp?error");
				return;
			}
			//2. 개인정보 변경
			trainerDao.changeInformation(trainerDto);
				
				
			//출력
			resp.sendRedirect("mypage.jsp");		 
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
