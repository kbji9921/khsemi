package semi.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.BoardReplyDao;
import semi.servlet.DtoDao.BoardReplyDto;

@WebServlet(urlPatterns = "/board/replyWrite.kh")
public class replyWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BoardReplyDto boardReplyDto = new BoardReplyDto();
			boardReplyDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			boardReplyDto.setReplyContent(req.getParameter("replyContent"));
			
			String memberId = (String) req.getSession().getAttribute("login");
			boardReplyDto.setReplyWriter(memberId);
			
			BoardReplyDao boardReplyDao = new BoardReplyDao();
			boardReplyDto.setReplyNo(boardReplyDao.getSequence());
			boardReplyDao.insert(boardReplyDto);
			
			resp.sendRedirect("boardDetail.jsp?boardNo="+boardReplyDto.getBoardNo());
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
