package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CenterLikeDao {
	
	//좋아요 등록
	public void like(String centerId, String playerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into center_like (no,center_id,player_id,like_check) values (no_seq.nextval, ?,?,1)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ps.setString(2, playerId);
		ps.execute();
		
		con.close();
		
	}
	
	//좋아요 여부 조회
	public int selectLike(String centerId, String playerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select like_check from center_like where center_id=? and player_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ps.setString(2, playerId);
		ResultSet rs = ps.executeQuery();
		
		int count;
		if(rs.next()) {
			count = rs.getInt("like_check");
		}
		else {
			count = 0;
		}
		
		con.close();
		return count;
	}	
	
	//좋아요 취소(-1)
	public boolean dislike(String centerId, String playerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete center_like where center_id = ? and player_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ps.setString(2, playerId);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
