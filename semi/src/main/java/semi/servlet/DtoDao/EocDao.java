package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EocDao {
	//센터별운동 번호 시퀀스 생성
	public long getSequence()throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select eoc_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		long eocNo = rs.getLong("nextval");
		
		con.close();
		
		return eocNo;
	}
	//시퀀스를 생성하는 등록
	public void insert1 (EocDto eocDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into eoc (eoc_no,exercise_name,center_id) values (?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, eocDto.getEocNo());
		ps.setString(2, eocDto.getEocExerciseName());
		ps.setString(3, eocDto.getEocCenterId());
		ps.execute();
		
		con.close();
	}
	
	//시퀀스를 생성하지 않는 등록
	public void insert2 (EocDto eocDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into eoc (eoc_no,exercise_name, center_id) values (eoc_seq.nexval,?,?);";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, eocDto.getEocExerciseName());
		ps.setString(2, eocDto.getEocCenterId());
		ps.execute();
		
		con.close();
	}
	//수정
	public boolean update (EocDto eocDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update eoc set exercise_name=?,center_id=? where eoc_no=?";
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
	public List<EocDto> selectList (String centerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from eoc where center_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ResultSet rs = ps.executeQuery();
		
		List<EocDto>list = new ArrayList<>();
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
	//운동종목별 조회
	public EocDto selectOne(long eocNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from eoc where eoc_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setLong(1, eocNo);
		ResultSet rs = ps.executeQuery();
		
		EocDto eocDto;
		if(rs.next()) {
			eocDto = new EocDto();
			eocDto.setEocNo(rs.getLong("eoc_no"));
			eocDto.setEocExerciseName(rs.getString("exercise_name"));
			eocDto.setEocCenterId(rs.getString("center_id"));
		}
		else {
			eocDto = null;
		}
		
		con.close();
		
		return eocDto;
	}
	
	//운동종목 있는지 확인
	public EocDto selectOne(String exerciseName, String cernterId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select exercise_name from eoc where exercise_name = ? and center_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, exerciseName);
		ps.setString(2, cernterId);
		ResultSet rs = ps.executeQuery();
		EocDto eocDto;
		if(rs.next()) {
			eocDto = new EocDto();
			eocDto.setEocExerciseName(rs.getString("exercise_name"));
		}
		else {
			eocDto = null;
		}
		
		con.close();
		
		return eocDto;
	}
}
