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
import semi.servlet.DtoDao.CenterDao;
import semi.servlet.DtoDao.CenterDto;
import semi.servlet.DtoDao.EocDao;
import semi.servlet.DtoDao.EocDto;

@WebServlet(urlPatterns = "/center/write.kh")
public class CenterWritetServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = "D:/upload/kh84";
			
			File dir = new File(path);
			dir.mkdirs();
			
			int max = 2 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding,policy);
			
			
			//준비
			CenterDto centerDto = new CenterDto();
			EocDto eocDto = new EocDto();
			centerDto.setCenterId(mRequest.getParameter("centerId"));
			centerDto.setCenterName(mRequest.getParameter("centerName"));
			centerDto.setCenterPhone(mRequest.getParameter("centerPhone"));
			centerDto.setCenterWeektime(mRequest.getParameter("centerWeektime"));
			centerDto.setCenterWkndtime(mRequest.getParameter("centerWkndtime"));
			centerDto.setCenterPost(mRequest.getParameter("centerPost"));
			centerDto.setCenterBasicAddress(mRequest.getParameter("centerBasicAddress"));
			centerDto.setCenterDetailAddress(mRequest.getParameter("centerDetailAddress"));
			centerDto.setCenterIntroduction(mRequest.getParameter("centerIntroduction"));
			
			eocDto.setEocExerciseName(mRequest.getParameter("exerciseName"));
			eocDto.setEocCenterId(mRequest.getParameter("centerId"));
			
			//처리
			CenterDao centerDao = new CenterDao();
			EocDao eocDao = new EocDao();
			//센터별운동번호 시퀀스 불러와서 등록
			eocDto.setEocNo(eocDao.getSequence());
			centerDao.insert(centerDto);
			eocDao.insert1(eocDto);
			
			//파일 등록
			if(mRequest.getFile("centerPics")!=null) {
				AttachmentDto attachmentDto = new AttachmentDto();
				AttachmentDao attachmentDao = new AttachmentDao();
				attachmentDto.setAttachmentNo(attachmentDao.getSequence());
				attachmentDto.setAttachmentUploadName(mRequest.getOriginalFileName("centerPics"));
				attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("centerPics"));
				attachmentDto.setAttachmentType(mRequest.getContentType("centerPics"));
				File target = mRequest.getFile("centerPics");
				attachmentDto.setAttachmentSize(target.length());
				
				attachmentDao.insert(attachmentDto);
				
				CenterAttachmentDto centerAttachmentDto = new CenterAttachmentDto();
				CenterAttachmentDao centerAttachmentDao = new CenterAttachmentDao();
				centerAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
				centerAttachmentDto.setCenterId(centerDto.getCenterId());
				
				centerAttachmentDao.insert(centerAttachmentDto);
			}
			
			//출력
			resp.sendRedirect(req.getContextPath()+"/center/detail.jsp?centerId="+centerDto.getCenterId()+
					"&exerciseName="+eocDto.getEocExerciseName());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
