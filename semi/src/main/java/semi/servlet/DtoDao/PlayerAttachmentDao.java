package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
