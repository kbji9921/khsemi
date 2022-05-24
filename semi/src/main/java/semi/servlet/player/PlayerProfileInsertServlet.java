package semi.servlet.player;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.servlet.DtoDao.AttachmentDao;
import semi.servlet.DtoDao.AttachmentDto;
import semi.servlet.DtoDao.PlayerAttachmentDao;
import semi.servlet.DtoDao.PlayerAttachmentDto;
import semi.servlet.DtoDao.PlayerDto;
import semi.servlet.DtoDao.TrainerAttachmentDao;
import semi.servlet.DtoDao.TrainerAttachmentDto;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns ="/profile/profileInsert.player")
public class PlayerProfileInsertServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		//준비
		//파일 업로드
		String path = "D:/upload/kh94"; //업로드 경로
		
		File dir = new File(path);
		dir.mkdirs();
		
		int max = 5*1024*1024;//최대 크기 제한(byte)
		String encoding = "UTF-8"; //인코딩 방식
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//이름 충돌 정책
		
		MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
		
		String playerId = mRequest.getParameter("playerId");
		
		//첨부파일 정보 추가
		if(mRequest.getFile("playerAttachment")!=null) {
			//첨부파일 등록
			AttachmentDao attachmentDao = new AttachmentDao();
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDto.setAttachmentUploadName(mRequest.getOriginalFileName("playerAttachment"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("playerAttachment"));
			attachmentDto.setAttachmentType(mRequest.getContentType("playerAttachment"));
			File target = mRequest.getFile("playerAttachment");
			attachmentDto.setAttachmentSize(target.length());
			
			attachmentDao.insert(attachmentDto);
			
			PlayerAttachmentDto playerAttachmentDto = new PlayerAttachmentDto();
			playerAttachmentDto.setPlayerId(playerId);
			playerAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
			
			PlayerAttachmentDao playerAttachmentDao = new PlayerAttachmentDao();
			playerAttachmentDao.insert(playerAttachmentDto);
		
		
			resp.sendRedirect(req.getContextPath()+"/player/mypage.jsp?playerId="+playerId);
		//출력
		}else{
	         resp.sendRedirect(req.getContextPath()+"/player/mypage.jsp?playerId="+playerId+"&error");
	   }
		
		
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
