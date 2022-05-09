package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;


@WebServlet(urlPatterns ="/trainer/login.kh")
public class TrainerLoginServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	try {
		//준비
		req.setCharacterEncoding("UTF-8");
		String trainerId = req.getParameter("trainerId");
		String trainerPw = req.getParameter("trainerPw");
		
		//처리
		TrainerDao trainerDao = new TrainerDao();
		TrainerDto trainerDto = trainerDao.selectOne(trainerId);
		boolean isLogin = trainerDto!=null&& trainerDto.getTrainerPw().equals(trainerPw);
		
		if(isLogin) {
			//로그인 시각 업데이트
			trainerDao.updateLogindate(trainerId);
			
			//로그인 처리
			req.getSession().setAttribute("trainer", trainerId);
			resp.sendRedirect(req.getContextPath());//메인페이지로 이동
			

		}else {
			resp.sendRedirect("trainerlogin.jsp?error"); //로그인 페이지(+에러표시)
		}
	
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
