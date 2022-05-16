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

@WebFilter(filterName="f3", urlPatterns = {
		"/trainer/logout.trainer",
		"/trainer/trainerMyPage.jsp", "/trainer/trainerSetPw.jsp",
		"/trainer/trainerJoinCenter","/trainer/delete.trainer", 
		"/trainer/Information.trainer","/trainer/join.center",
		"/trainer/join.center","/trainer/logout.trainer",
		"/profile/profile.delete","/profile/profile.insert",
		"/trainer/setPw1.trainer", "/player/allMatchingList.jsp",	
		"/player/MatchinigDeleteTrainerServlet",
		"/player/deleteTrainer.matching",
		"/center/write.jsp","/center/update.jsp",
		"/profile/trainerProfileDelete.jsp","/profile/trainerProfileInsert.jsp"
		
})

public class LoginTrainerFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			
			String trainerId = (String) req.getSession().getAttribute("trainer");
			
			if(trainerId == null) {
				resp.sendRedirect("trainerLogin.jsp");
			}else {
				chain.doFilter(req, resp);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
