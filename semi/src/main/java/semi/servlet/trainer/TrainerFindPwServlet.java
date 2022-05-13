package semi.servlet.trainer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns = "/trainer/findPw.trainer")
public class TrainerFindPwServlet extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         
         req.setCharacterEncoding("UTF-8");
         String trainerId = req.getParameter("trainerId");
//         PlayerDto playerDto = new PlayerDto();
//         playerDto.setPlayerId(req.getParameter("playerId"));
//         playerDto.setPlayerName(req.getParameter("playerName"));
//         playerDto.setPlayerPhone(req.getParameter("playerPhone"));
          
         
         TrainerDao trainerDao = new TrainerDao();
         TrainerDto trainerDto = trainerDao.selectOne(trainerId);
//         PlayerDto findDto = playerDao.findPw(playerDto);
         
         boolean isPass =trainerDto.getTrainerId() != null;
         
         if(isPass) {
            resp.sendRedirect("trainerSetPw2.jsp?trainerId="+trainerDto.getTrainerId());
         }else {
            resp.sendRedirect("trainerFindPw.jsp?error");         
         }
         
      }catch(Exception e){
         e.printStackTrace();
         resp.sendError(500);
      }
   }
}