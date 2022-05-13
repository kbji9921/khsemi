package semi.servlet.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.AttachmentDao;
import semi.servlet.DtoDao.AttachmentDto;

@WebServlet(urlPatterns = "/file/download.kh")
public class FileDownloadServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비: attachmentNo가 필요하다.
				int attachmentNo = Integer.parseInt(req.getParameter("attachmentNo"));
			
			
			//처리
			AttachmentDao attachmentDao = new AttachmentDao();
			AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
			if(attachmentDto==null) {
				resp.sendError(404);
				return;
			}
			//실제 파일의 객체를 생성
			File target = new File(AttachmentDao.path,attachmentDto.getAttachmentSavename()); //실제 위치의 실제 파일이름 알려줌
			
			//파일 전송을 위한 준비
			
			//사용자(브라우저)에게 현재 서버에서 주려고 하는 것이 무엇인지 알려준다.
			resp.setHeader("Content-Type", "application/octet-stream"); 
			//사용자(브라우저)에게 현재 서버에서 주려고 하는 데이터의 인코딩 방식을 알려준다.
			resp.setHeader("Content-Encoding","UTF-8");
			//사용자(브라우저)에게 현재 서버에서 주려고 하는 데이터의 크기를 알려준다.
			resp.setHeader("Content-Length", String.valueOf(attachmentDto.getAttachmentSize()));
			//사용자(브라우저)에게 접근해야할 파일의 이름과 접근방식을 알려준다.
			//= 이름에 띄어쓰기가 있을 수 있으므로 파일명을 ""로 감싸야 한다.
			//= 이름에 유니코드가 있을수 있으므로 URLEncoder로 변환해야 한다.
			String filename = URLEncoder.encode(attachmentDto.getAttachmentUploadName(),"UTF-8");
			resp.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");

			
			//출력
			//사용자에게 파일을 출력
			byte [] buffer = new byte[8182];
			FileInputStream in = new FileInputStream(target);
			
			while(true) {
				int size = in.read(buffer);
				if(size==-1)break;
				resp.getOutputStream().write(buffer,0,size);
			}
			in.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	
	
	}

}
