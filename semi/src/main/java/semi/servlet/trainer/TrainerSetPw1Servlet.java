package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns = "/trainer/setPw1.trainer")
public class TrainerSetPw1Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				
				//준비
				req.setCharacterEncoding("UTF-8");

				String currentPw = req.getParameter("trainerPw");
				String changePw1 = req.getParameter("changePw1");
				String changePw2 = req.getParameter("changepw2");
				

				String trainerId = (String)req.getSession().getAttribute("trainer");
				
				//처리
			
				//2. 현재 비밀번호가 db의 비밀번호와 일치하는지 검사
				TrainerDao trainerDao = new TrainerDao();
				TrainerDto trainerDto = trainerDao.selectOne(trainerId);
				
				boolean isCorrectPassword = currentPw.equals(trainerDto.getTrainerPw());
				if(!isCorrectPassword) {
					resp.sendRedirect(req.getContextPath()+"/trainer/trainerSetPw2.jsp?error");
				}
				//3. 변경할 비밀번호가 적합한 형식인지 검사(생략)
				//4. 비밀번호 변경 - 000의 비밀번호를 000로 바꿔
				trainerDao.changePassword(trainerId, changePw1);
				
				//출력
				resp.sendRedirect(req.getContextPath()+"/trainer/trainerMyPage.jsp");
				
				
				
			}catch(Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
	}
}
