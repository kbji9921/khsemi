package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CenterAttachmentDao {
	
	public void insert(CenterAttachmentDto centerAttachmentDto)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into center_attachment (center_id, attachment_no) values (?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerAttachmentDto.getCenterId());
		ps.setInt(2, centerAttachmentDto.getAttachmentNo());
		ps.execute();
		
		
		con.close();
	}
}
