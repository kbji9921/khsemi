package semi.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.BoardDao;
import semi.servlet.DtoDao.BoardDto;

@WebServlet(urlPatterns = "/board/write.kh")
public class boardWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardType(req.getParameter("boardType"));
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardContent(req.getParameter("boardContent"));
			
			String playerId = (String)req.getSession().getAttribute("login");
			boardDto.setBoardWriter(playerId);
			
			BoardDao boardDao = new BoardDao();
			boardDto.setBoardNO(boardDao.getSequence());
			boardDao.insert(boardDto);
			
			resp.sendRedirect("boardDetail.jsp?boardNo="+boardDto.getBoardNO());
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
