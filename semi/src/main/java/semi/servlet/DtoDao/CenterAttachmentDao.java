package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	public int selectOne(String centerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select attachment_no from center_attachment where center_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
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
