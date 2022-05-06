package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	//전체검색
	public List<EocDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from eoc order by eoc_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<EocDto> list = new ArrayList<>();
		while(rs.next()) {
			EocDto eocDto = new EocDto();
			eocDto.setEocNo(rs.getLong("eoc_no"));
			eocDto.setEocExerciseName(rs.getString("exercise_name"));
			eocDto.setEocCenterId(rs.getString("center_id"));
			list.add(eocDto);
		}
		
		con.close();
		
		return list;
	}
	//센터별 담당 운동 조회
	public EocDto selectList (String centerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from eoc where center_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ResultSet rs = ps.executeQuery();
		
		EocDto eocDto = new EocDto();
		if(rs.next()) {
			eocDto = new EocDto();
			eocDto.setEocNo(rs.getLong("eoc_no"));
			eocDto.setEocExerciseName(rs.getString("exercise_name"));
			eocDto.setEocCenterId(rs.getString("center_name"));
		}
		else {
			eocDto = null;
		}
		
		con.close();
		
		return eocDto;
	}

}
