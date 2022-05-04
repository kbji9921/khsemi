package semi.servlet.trainer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns = "/trainer/list.kh")
public class TrainerListServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int p = Integer.parseInt(req.getParameter("p"));
			int s = Integer.parseInt(req.getParameter("s"));
			
			//처리
			TrainerDao trainerDao = new TrainerDao();
			List<TrainerDto> list = trainerDao.selectListByPaging(p,s);
			
			
			
			//출력
		//	resp.getWriter().print(list); //자바스크립트에서 알아들을 수 없는 형태
			
			//Jackson-databind 라는 라이브러리를 이용하여 list를 JSON형태로 변환 후 출력
			//1. ObjectMapper라는 클래스의 객체를 생성한다.
			ObjectMapper mapper = new ObjectMapper();
			//2. 명령을 사용하여 객체를 JSON으로 변환한다.
			String jsonString = mapper.writeValueAsString(list);
			//3. client에게 변환된 데이터 전송
			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(jsonString);
			
		}catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
