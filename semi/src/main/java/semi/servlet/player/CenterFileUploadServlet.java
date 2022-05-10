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
import semi.servlet.DtoDao.CenterAttachmentDao;
import semi.servlet.DtoDao.CenterAttachmentDto;
import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.CenterDto;

@WebServlet(urlPatterns ="/centerFile/insert.kh")
public class CenterFileUploadServlet extends HttpServlet{
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
		
		CenterDto centerDto = new CenterDto();
		centerDto.setCenterId(mRequest.getParameter("centerId"));
		centerDto.setCenterName(mRequest.getParameter("centerPw"));
		centerDto.setCenterPhone(mRequest.getParameter("centerName"));
		centerDto.setCenterWeektime(mRequest.getParameter("centerBirth"));
		centerDto.setCenterWkndtime(mRequest.getParameter("centerPhone"));
		centerDto.setCenterPost(mRequest.getParameter("centerEmail"));
		centerDto.setCenterBasicAddress(mRequest.getParameter("centerBasicAddress"));
		centerDto.setCenterDetailAddress(mRequest.getParameter("centerDetailAddress"));
		centerDto.setCenterIntroduction(mRequest.getParameter("centerIntroduction"));

		//처리
		CenterDao centerDao = new CenterDao();
		centerDao.insert(centerDto);
		
		//첨부파일 정보 추가
		if(mRequest.getFile("centerProfile")!=null) {
			//첨부파일 등록
			AttachmentDao attachmentDao = new AttachmentDao();
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDto.setAttachmentUploadName(mRequest.getOriginalFileName("centerProfile"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("centerProfile"));
			attachmentDto.setAttachmentType(mRequest.getContentType("centerProfile"));
			File target = mRequest.getFile("centerProfile");
			attachmentDto.setAttachmentSize(target.length());
			
			attachmentDao.insert(attachmentDto);
			
			CenterAttachmentDto centerAttachmentDto = new CenterAttachmentDto();
			centerAttachmentDto.setCenterId(centerDto.getCenterId());
			centerAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
			
			CenterAttachmentDao centerAttachmentDao = new CenterAttachmentDao();
			centerAttachmentDao.insert(centerAttachmentDto);
		}
		
		
		

		
		
	}catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
