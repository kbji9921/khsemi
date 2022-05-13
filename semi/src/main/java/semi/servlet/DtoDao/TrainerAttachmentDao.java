package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TrainerAttachmentDao {
	
	public void insert(TrainerAttachmentDto trainerAttachmentDto)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into trainer_attachment (trainer_id, attachment_no) values (?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, trainerAttachmentDto.getTrainerId());
		ps.setInt(2, trainerAttachmentDto.getAttachmentNo());
		ps.execute();
		
		
		con.close();
	}
	public int selectOne(String trainerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select attachment_no from trainer_attachment where trainer_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, trainerId);
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
	public boolean delete(int attachmentNo) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "delete from trainer_attachment where attachment_no= ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, attachmentNo);
		int count = ps.executeUpdate();

		con.close();

		return count > 0;

	}
}

