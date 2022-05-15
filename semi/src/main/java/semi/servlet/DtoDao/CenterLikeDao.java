package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CenterLikeDao {
	//좋아요 추가
	public void like(String centerId,String playerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into center_like(no,center_id,player_id) values (no_seq.nextval,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ps.setString(2, playerId);
		ps.execute();
		
		con.close();
		
	}
	//좋아요 조회
	public CenterLikeDto select(String centerId, String playerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from center_like where centerId=? and player_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ps.setString(2, playerId);
		ResultSet rs = ps.executeQuery();
		
		CenterLikeDto centerLikeDto;
		if(rs.next()) {
			centerLikeDto = new CenterLikeDto();
			centerLikeDto.setNo(rs.getLong("no"));
			centerLikeDto.setCenterId(rs.getString("center_id"));
			centerLikeDto.setPlayerId(rs.getString("player_id"));
		}
		else {
			centerLikeDto = null;
		}
		
		con.close();
		
		return centerLikeDto;
	}
	
	//좋아요 삭제
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
