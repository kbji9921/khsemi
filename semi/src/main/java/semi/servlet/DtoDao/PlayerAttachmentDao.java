package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PlayerAttachmentDao {
	
	public void insert(PlayerAttachmentDto playerAttachmentDto)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into player_attachment (player_id, attachment_no) values (?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerAttachmentDto.getPlayerId());
		ps.setInt(2, playerAttachmentDto.getAttachmentNo());
		ps.execute();
		
		con.close();
	}
	
	public int selectOne(String playerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select attachment_no from player_attachment where player_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerId);
		ResultSet rs = ps.executeQuery();
		
		int attachmentNo;
		if(rs.next()) {;
		attachmentNo= rs.getInt("attachment_no");
		}
		else {
			attachmentNo = 0;
		}
		con.close();
		
		return attachmentNo;
	}
}
