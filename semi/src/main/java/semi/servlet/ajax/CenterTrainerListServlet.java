package semi.servlet.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import semi.servlet.DtoDao.AttachmentDao;
import semi.servlet.DtoDao.AttachmentDto;
import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.TrainerAttachmentDao;
import semi.servlet.DtoDao.TrainerAttachmentDto;
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
			
//			List<AttachmentDto> attachmentList = new ArrayList<>();
//			for(TrainerDto trainerDto : trainerList) {
//				TrainerAttachmentDao trainerAttachmentDao = new TrainerAttachmentDao();
//				int attachmentNo = trainerAttachmentDao.selectOne(trainerDto.getTrainerId());
//				AttachmentDao attachmentDao = new AttachmentDao();
//				AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
//				
//				attachmentList.add(attachmentDto);
//			}
			
			//출력
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(trainerList);
//			String jsonString2 = mapper.writeValueAsString(attachmentList);
			
			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(jsonString);
//			resp.getWriter().print(jsonString2);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
