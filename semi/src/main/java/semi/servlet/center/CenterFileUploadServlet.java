package semi.servlet.center;

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

@WebServlet(urlPatterns ="/profile/profileInsert.center")
public class CenterFileUploadServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		//준비
		//파일 업로드
		String path = "D:/upload/kh84"; //업로드 경로
		
		File dir = new File(path);
		dir.mkdirs();
		
		int max = 5*1024*1024;//최대 크기 제한(byte)
		String encoding = "UTF-8"; //인코딩 방식
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();//이름 충돌 정책
		
		MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
		
		String centerId = mRequest.getParameter("centerId");
		
		//첨부파일 정보 추가
		if(mRequest.getFile("centerAttachment")!=null) {
			//첨부파일 등록
			AttachmentDao attachmentDao = new AttachmentDao();
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDto.setAttachmentUploadName(mRequest.getOriginalFileName("centerAttachment"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("centerAttachment"));
			attachmentDto.setAttachmentType(mRequest.getContentType("centerAttachment"));
			File target = mRequest.getFile("centerAttachment");
			attachmentDto.setAttachmentSize(target.length());
			
			attachmentDao.insert(attachmentDto);
			
			CenterAttachmentDto centerAttachmentDto = new CenterAttachmentDto();
			centerAttachmentDto.setCenterId(centerId);
			centerAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
			
			CenterAttachmentDao centerAttachmentDao = new CenterAttachmentDao();
			centerAttachmentDao.insert(centerAttachmentDto);
		
		
			resp.sendRedirect(req.getContextPath()+"/center/update.jsp?centerId="+centerId);
		//출력
		}else{
	         resp.sendRedirect(req.getContextPath()+"/center/update.jsp?centerId="+centerId+"&error");
	   }
		
		
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
