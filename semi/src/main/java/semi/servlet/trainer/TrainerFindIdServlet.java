package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns ="/trainer/findId.trainer")
public class TrainerFindIdServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			TrainerDto trainerDto =  new TrainerDto();
			trainerDto.setTrainerName(req.getParameter("trainerName"));
			trainerDto.setTrainerPhone(req.getParameter("trainerPhone"));
			trainerDto.setTrainerEmail(req.getParameter("trainerEmail"));
			//처리
			TrainerDao trainerDao = new TrainerDao();
			String trainerId = trainerDao.findId(trainerDto);
			
			
			if(trainerId==null) {
				resp.sendRedirect(req.getContextPath()+"/trainer/trainerFindId.jsp?error");
			}else {
				resp.sendRedirect(req.getContextPath()+"/trainer/trainerFindIdResult.jsp?trainerId="+trainerId);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

		
		
		
		//출력
	}
}
