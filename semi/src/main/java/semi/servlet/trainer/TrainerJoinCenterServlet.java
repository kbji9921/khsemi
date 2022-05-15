	package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;


@WebServlet(urlPatterns = "/trainer/join.center")
public class TrainerJoinCenterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			//준비: 센터 아이디, 트레이너 아이디
			req.setCharacterEncoding("UTF-8");
			TrainerDto trainerDto = new TrainerDto();
			trainerDto.setTrainerId(req.getParameter("trainerId"));
			trainerDto.setCenterId(req.getParameter("centerId"));
			//처리
			TrainerDao trainerDao = new TrainerDao();
			trainerDao.trainerJoinCenter(trainerDto);
			//출력
			resp.sendRedirect(req.getContextPath()+"/trainer/trainerMyPage.jsp?trainerId="+trainerDto.getTrainerId());
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
