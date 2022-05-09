package semi.servlet.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import semi.servlet.DtoDao.ReservationDao;
import semi.servlet.DtoDao.ReservationDto;


@WebServlet(urlPatterns = "/reservedTime.kh")
public class ReservedAjaxServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비 : 아이디
			String reservationDate = req.getParameter("reservationDate");
			
			//처리 : 아이디 검색
			ReservationDao reservationDao = new ReservationDao();
			List<ReservationDto> list = reservationDao.selectDate(reservationDate);
			
			//출력
			//Jackson-databind 라는 라이브러리를 이용하여 list를 JSON형태로 변환 후 출력
			//1. ObjectMapper라는 클래스의 객체를 생성한다.
			ObjectMapper mapper = new ObjectMapper();
			//2. 명령을 사용하여 객체를 JSON으로 변환한다.
			String jsonString = mapper.writeValueAsString(list);
			//3. client에게 변환된 데이터 전송
			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(jsonString);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}



