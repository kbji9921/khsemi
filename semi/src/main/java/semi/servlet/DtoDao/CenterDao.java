package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CenterDao {
	//센터 등록
	public void insert(CenterDto centerDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into center (center_id,center_name,center_phone,center_weektime,"
				+ "center_wkndtime,center_post,center_basic_address, center_detail_address, "
				+ "center_introduction) values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerDto.getCenterId());
		ps.setString(2, centerDto.getCenterName());
		ps.setString(3, centerDto.getCenterPhone());
		ps.setString(4, centerDto.getCenterWeektime());
		ps.setString(5, centerDto.getCenterWkndtime());
		ps.setString(6, centerDto.getCenterPost());
		ps.setString(7, centerDto.getCenterBasicAddress());
		ps.setString(8, centerDto.getCenterDetailAddress());
		ps.setString(9, centerDto.getCenterIntroduction());
		ps.execute();
		
		con.close();
	}
	//수정
	public boolean update (CenterDto centerDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update center set center_name=?,center_phone=?,center_weektime=?,"
				+ "center_wkndtime=?,center_post=?,center_basic_address=?,center_detail_address=?,"
				+ "center_introduction=? where center_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerDto.getCenterName());
		ps.setString(2, centerDto.getCenterPhone());
		ps.setString(3, centerDto.getCenterWeektime());
		ps.setString(4, centerDto.getCenterWkndtime());
		ps.setString(5, centerDto.getCenterPost());
		ps.setString(6, centerDto.getCenterBasicAddress());
		ps.setString(7, centerDto.getCenterDetailAddress());
		ps.setString(8, centerDto.getCenterIntroduction());
		ps.setString(9, centerDto.getCenterId());
		
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	//삭제
	public boolean delete (String centerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete center where center_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
