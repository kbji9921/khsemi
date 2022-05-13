package semi.servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;
@WebServlet(urlPatterns = "/ajax/center-trainer.kh")
public class CenterTrainerListServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			int p = Integer.parseInt(req.getParameter("p"));
			int s = Integer.parseInt(req.getParameter("s"));
			String centerId = req.getParameter("centerId");
			
			//처리
			TrainerDao trainerDao = new TrainerDao();
			List<TrainerDto> trainerList = trainerDao.centerTrainerByPaging(p, s, centerId);
			
			//출력
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(trainerList);
			
			resp.setContentType("application/json;,charset=UTF-8");
			resp.getWriter().print(jsonString);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
