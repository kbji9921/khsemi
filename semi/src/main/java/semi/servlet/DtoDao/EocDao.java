package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class EocDao {
	//등록
	public void insert (EocDto eocDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "inset into eoc (eoc_no,exercise_name, center_id) values (eoc_seq.nexval,?,?);";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, eocDto.getEocExerciseName());
		ps.setString(2, eocDto.getEocCenterId());
		ps.execute();
		
		con.close();
	}
	//수정
	public boolean update (EocDto eocDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update eoc set exercise_name=? center_id=? where eoc_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, eocDto.getEocExerciseName());
		ps.setString(2, eocDto.getEocCenterId());
		ps.setLong(3, eocDto.getEocNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	//삭제
	public boolean delete (long eocNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete eoc where eoc_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, eocNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
