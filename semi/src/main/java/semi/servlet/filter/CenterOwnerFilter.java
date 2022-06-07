package semi.servlet.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.servlet.DtoDao.TrainerDao;
import semi.servlet.DtoDao.TrainerDto;
//@WebFilter(filterName = "f4",urlPatterns = {
//		"/center/update.jsp","/center/update.kh",
//		"/center/delete.kh","/eoc/*"
//})
public class CenterOwnerFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			String playerGrade = (String)req.getSession().getAttribute("auth");
			if(playerGrade.equals("관리자")) {
				chain.doFilter(req, resp);
				return;
			}
			String trainerId = (String)req.getSession().getAttribute("trainer");
			String centerId = req.getParameter("centerId");
			
			TrainerDao trainerDao = new TrainerDao();
			TrainerDto trainerDto = trainerDao.selectOne(trainerId);
			if(centerId.equals(trainerDto.getCenterId())) {
				chain.doFilter(request, response);
			}
			else {
				resp.sendError(403);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
