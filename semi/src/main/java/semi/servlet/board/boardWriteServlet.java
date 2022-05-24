package semi.servlet.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.servlet.DtoDao.BoardDao;
import semi.servlet.DtoDao.BoardDto;

@WebServlet(urlPatterns = "/board/write.kh")
public class boardWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = "D:/upload/kh94";
			  
			File dir = new File(path);
			dir.mkdirs();
			  
			int max = 5*1024*1024;//최대 크기 제한(byte)
			String encoding = "UTF-8"; //인코딩 방식
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//이름 충돌 정책
			  
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);

			BoardDto boardDto = new BoardDto();
			boardDto.setBoardType(mRequest.getParameter("boardType"));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardContent(mRequest.getParameter("boardContent"));
			boardDto.setBoardWriter(mRequest.getParameter("boardWriter"));
		
			BoardDao boardDao = new BoardDao();
			boardDto.setBoardNo(Integer.parseInt(mRequest.getParameter("boardNo")));
			boardDao.insert(boardDto);
			
			resp.sendRedirect("boardDetail.jsp?boardNo="+boardDto.getBoardNo());
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}

	