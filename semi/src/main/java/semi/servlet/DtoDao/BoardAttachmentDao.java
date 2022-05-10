package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BoardAttachmentDao {

	public void insert(BoardAttachmentDto boardAttachmentDto)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into board_attachment (board_no, attachment_no) values (?,?)";
		PreparedStatement ps = con.prepareStatement(sql); 
		ps.setInt(1, boardAttachmentDto.getBoardNo());
		ps.setInt(2, boardAttachmentDto.getAttachmentNo());
		ps.execute();
		
		
		con.close();
	}
}
