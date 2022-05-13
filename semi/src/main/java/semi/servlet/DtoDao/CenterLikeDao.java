package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CenterLikeDao {
	//좋아요 등록
	public boolean like(long clikeNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update center_like set clike_check = clike_check +1 where clike_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, clikeNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	//좋아요 삭제
	public boolean dislike(long cLikeNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update center_like set clike_check = clike_check -1 where clike_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, cLikeNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
