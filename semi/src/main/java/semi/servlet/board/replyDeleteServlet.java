package semi.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.BoardReplyDao;

@WebServlet(urlPatterns = "/board/replyDelete.kh")
public class replyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			BoardReplyDao boardReplyDao = new BoardReplyDao();
			
			boolean success = boardReplyDao.delete(replyNo);
			
			if(success) {
				resp.sendRedirect("boardDetail.jsp?boardNo="+boardNo);
			}else {
				resp.sendError(404);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
