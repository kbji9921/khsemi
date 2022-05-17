package semi.servlet.trainer;

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
import semi.servlet.DtoDao.TrainerAttachmentDao;
import semi.servlet.DtoDao.TrainerAttachmentDto;
import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;

@WebServlet(urlPatterns ="/trainer/profile.trainer")
public class TrainerFileUploadServlet extends HttpServlet{
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
		
		TrainerDto trainerDto = new TrainerDto();
		trainerDto.setTrainerId(mRequest.getParameter("trainerId"));
		trainerDto.setTrainerPw(mRequest.getParameter("trainerPw"));
		trainerDto.setTrainerName(mRequest.getParameter("trainerName"));
		trainerDto.setTrainerPhone(mRequest.getParameter("trainerPhone"));
		trainerDto.setTrainerEmail(mRequest.getParameter("trainerEmail"));
		trainerDto.setTrainerBirth(mRequest.getParameter("trainerBirth"));
		trainerDto.setTrainerGender(mRequest.getParameter("trainerGender"));
		trainerDto.setTrainerSports(mRequest.getParameter("trainerSports"));

		//처리
		TrainerDao trainerDao = new TrainerDao();
		trainerDao.join(trainerDto);
		
		//첨부파일 정보 추가
		if(mRequest.getFile("trainerAttachment")!=null) {
			//첨부파일 등록
			AttachmentDao attachmentDao = new AttachmentDao();
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDto.setAttachmentUploadName(mRequest.getOriginalFileName("trainerAttachment"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("trainerAttachment"));
			attachmentDto.setAttachmentType(mRequest.getContentType("trainerAttachment"));
			File target = mRequest.getFile("trainerAttachment");
			attachmentDto.setAttachmentSize(target.length());
			
			attachmentDao.insert(attachmentDto);
			
			TrainerAttachmentDto trainerAttachmentDto = new TrainerAttachmentDto();
			trainerAttachmentDto.setTrainerId(trainerDto.getTrainerId());
			trainerAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
			
			TrainerAttachmentDao trainerAttachmentDao = new TrainerAttachmentDao();
			trainerAttachmentDao.insert(trainerAttachmentDto);
		}
		
		
		
//		TrainerDao trainerDao = new TrainerDao();
//		trainerDao.join(trainerDto);
		//출력
		resp.sendRedirect(req.getContextPath()+"/trainer/trainerJoinSuccess.jsp?trainerId="+trainerDto.getTrainerId());
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
