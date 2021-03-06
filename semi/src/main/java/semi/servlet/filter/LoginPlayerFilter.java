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

@WebFilter(filterName="f2", urlPatterns = {
		"/player/logout.player","/player/changePw.jsp","/player/changeInformation.jsp",
		"/player/deletePlayer.jsp","/player/matchingDetail.jsp",
		"/player/matchingInsert.jsp","/player/mypage.jsp",
		"/player/point.jsp","/player.insert.kh","/player/matchingDelete.player",
		"/player/matching.insert","/player/pay.player","/player/password.player",
		"/player/chageinformation.player","/player/chargePoint.player",
		"/player/matchingList.jsp","/reservation/reservationListPlayer.jsp",
		"/player/returnPoint.jsp","/grade/gradeDelete.grade",
		"/trainer/insert.grade","/grade/gradeUpdate.grade",
		"/board/boardDetail.jsp","/board/boardEdit.jsp",
		"/board/boardList.jsp","/board/boardWrite.jsp",
		"/profile/playerProfileInsert.jsp","/player/insert.kh",
		"/player/returnPoint.player"
})
public class LoginPlayerFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			
			String playerId = (String) req.getSession().getAttribute("login");
			
			if(playerId == null) {
				resp.sendRedirect(req.getContextPath()+"/player/login.jsp");
			}else {
				chain.doFilter(req, resp);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
