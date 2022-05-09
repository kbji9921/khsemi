package semi.servlet.player;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

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
import semi.servlet.DtoDao.PlayerDao;
import semi.servlet.DtoDao.PlayerDto;

@WebServlet(urlPatterns ="/player/insert.kh")
public class PlayerFileUploadServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		//준비
		//파일 업로드
		String path = System.getProperty("user.home")+"/upload"; //업로드 경로
		
		File dir = new File(path);
		dir.mkdirs();
		
		int max = 5*1024*1024;//최대 크기 제한(byte)
		String encoding = "UTF-8"; //인코딩 방식
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//이름 충돌 정책
		
		MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
		
		PlayerDto playerDto = new PlayerDto();
		playerDto.setPlayerId(mRequest.getParameter("playerId"));
		playerDto.setPlayerPw(mRequest.getParameter("playerPw"));
		playerDto.setPlayerName(mRequest.getParameter("playerName"));
		playerDto.setPlayerBirth(Date.valueOf(mRequest.getParameter("playerBirth")));
		playerDto.setPlayerPhone(mRequest.getParameter("playerPhone"));
		playerDto.setPlayerEmail(mRequest.getParameter("playerEmail"));


		//처리
		PlayerDao playerDao = new PlayerDao();
		playerDao.insert(playerDto);
		
		//첨부파일 정보 추가
		if(mRequest.getFile("playerProfile")!=null) {
			//첨부파일 등록
			AttachmentDao attachmentDao = new AttachmentDao();
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDto.setAttachmentUploadName(mRequest.getOriginalFileName("playerProfile"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("playerProfile"));
			attachmentDto.setAttachmentType(mRequest.getContentType("playerProfile"));
			File target = mRequest.getFile("playerProfile");
			attachmentDto.setAttachmentSize(target.length());
			
			attachmentDao.insert(attachmentDto);
			
			PlayerAttachmentDto playerAttachmentDto = new PlayerAttachmentDto();
			playerAttachmentDto.setPlayerId(playerDto.getPlayerId());
			playerAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
			
			PlayerAttachmentDao playerAttachmentDao = new PlayerAttachmentDao();
			playerAttachmentDao.insert(playerAttachmentDto);
		}
		
		
		

		
		
	}catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
