package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CenterDao {
	//전체목록
	public List<CenterDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from center order by center_pay desc, center_open desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<CenterDto> list = new ArrayList<>();
		while(rs.next()) {
			CenterDto centerDto = new CenterDto();
			centerDto.setCenterNo(rs.getLong("center_no"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterWeekStime(rs.getString("center_week_stime"));
			centerDto.setCenterWeekFtime(rs.getString("center_week_ftime"));
			centerDto.setCenterWkndStime(rs.getString("center_wknd_stime"));
			centerDto.setCenterWkndFtime(rs.getString("center_wknd_ftime"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterOpen(rs.getDate("center_open"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
			//센터 비용, 개월 추가
			centerDto.setCenterPay(rs.getInt("center_pay"));
			centerDto.setCenterMonth(rs.getInt("center_month"));
			
			list.add(centerDto);
		}
		
		con.close();
		
		return list;
		
	}
	//상세 조회
	public CenterDto selectOne (long centerNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from center where center_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, centerNo);
		ResultSet rs = ps.executeQuery();
		
		CenterDto centerDto;
		if(rs.next()) {
			centerDto = new CenterDto();
			centerDto.setCenterNo(rs.getLong("center_no"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterWeekStime(rs.getString("center_week_stime"));
			centerDto.setCenterWeekFtime(rs.getString("center_week_ftime"));
			centerDto.setCenterWkndStime(rs.getString("center_wknd_stime"));
			centerDto.setCenterWkndFtime(rs.getString("center_wknd_ftime"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterOpen(rs.getDate("center_open"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
			//센터 비용, 개월 추가
			centerDto.setCenterPay(rs.getInt("center_pay"));
			centerDto.setCenterMonth(rs.getInt("center_month"));
		}
		else {
			centerDto = null;
		}
		
		con.close();
		
		return centerDto;
	}
	//검색(센터명, 주소)
	
	//등록
	public void insert (CenterDto centerDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into center(center_no, center_name, center_week_stime, center_week_ftime, center_wknd_stime, center_wknd_ftime, center_phone, center_introduction, center_pay, center_month) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, centerDto.getCenterNo());
		ps.setString(2, centerDto.getCenterName());
		ps.setString(3, centerDto.getCenterWeekStime());
		ps.setString(4, centerDto.getCenterWeekFtime());
		ps.setString(5, centerDto.getCenterWkndStime());
		ps.setString(6, centerDto.getCenterWkndFtime());
		ps.setString(7, centerDto.getCenterPhone());
		ps.setString(8, centerDto.getCenterIntroduction());
		ps.setInt(9, centerDto.getCenterPay());
		ps.setInt(10, centerDto.getCenterMonth());
		
		ps.execute();
		
		con.close();
	}
	
	//수정
	public boolean update (CenterDto centerDto) throws Exception{
		Connection con =JdbcUtils.getConnection();
		
		String sql = "update center set center_name=?, center_week_stime=?, center_week_ftime=?, "
				+ "center_wknd_stime=?, center_wknd_ftime=?, center_phone=?, center_introduction=?, "
				+ "center_pay=?, center_month=? where center_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerDto.getCenterName());
		ps.setString(2, centerDto.getCenterWeekStime());
		ps.setString(3, centerDto.getCenterWeekFtime());
		ps.setString(4, centerDto.getCenterWkndStime());
		ps.setString(5, centerDto.getCenterWkndFtime());
		ps.setString(6, centerDto.getCenterPhone());
		ps.setString(7, centerDto.getCenterIntroduction());
		ps.setLong(8, centerDto.getCenterNo());
		ps.setInt(9, centerDto.getCenterPay());
		ps.setInt(10, centerDto.getCenterMonth());
		
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	//삭제
	public boolean delete (long centerNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete center where center_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, centerNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
