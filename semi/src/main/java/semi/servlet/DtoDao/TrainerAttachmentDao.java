package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}

