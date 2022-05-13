package semi.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns = "/trainerId.check")
public class TrainerIdCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			String trainerId = req.getParameter("trainerId");
			
			//처리
			TrainerDao trainerDao = new TrainerDao();
			TrainerDto trainerDto = trainerDao.findByNickname(trainerId);
			
			//출력 - 어쨌든 문자열로 나감
			resp.setContentType("text/plain; charset=UTF-8");
			if(trainerDto.getTrainerId() != null) {//사용중
				resp.getWriter().print("N");
			}
			else {//사용가능
				resp.getWriter().print("Y");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}