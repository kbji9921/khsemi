package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GradeDao {
	
	//등록
	public void insert(GradeDto gradeDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into grade (grade_no, grade_target, grade_writer, grade_time, grade_content, grade_rate) values"
				+ "(?,?,?,?,?,?);";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, gradeDto.getGradeNo());
		ps.setString(2, gradeDto.getGradeTarget());
		ps.setString(3, gradeDto.getGradeWriter());
		ps.setDate(4, gradeDto.getGradeTime());
		ps.setString(5, gradeDto.getGradeContent());
		ps.setInt(6, gradeDto.getGradeRate());
		ps.execute();
		
		con.close();
	}
	
	
	//별점 조회
	public GradeDto selectAvg(String gradeTarget, int gradeRate) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql="select grade_target, avg(grade_rate) from grade GROUP BY grade_target;";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, gradeTarget);
		ps.setInt(2, gradeRate);
		ResultSet rs = ps.executeQuery();
		GradeDto gradeDto = null;
		if(rs.next()) {
			gradeDto = new GradeDto();
			gradeDto.setGradeRate(rs.getInt("gradeRate"));
		}
		con.close();
		return gradeDto;
	}

	//목록
	public List<GradeDto> selectList(int gradeTarget) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reply where grade_target = ? order by grade_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, gradeTarget);
		ResultSet rs = ps.executeQuery();
		
		List<GradeDto> list = new ArrayList<>();
		
		while(rs.next()) {
			GradeDto gradeDto = new GradeDto();
			
			gradeDto.setGradeNo(rs.getInt("grade_no"));
			gradeDto.setGradeTarget(rs.getString("grade_target"));
			gradeDto.setGradeWriter(rs.getString("grade_writer"));
			gradeDto.setGradeTime(rs.getDate("grade_time"));
			gradeDto.setGradeContent(rs.getString("grade_content"));
			gradeDto.setGradeRate(rs.getInt("grade_rate"));

			list.add(gradeDto);
		}
		
		con.close();
		
		return list;
	}
	//삭제
	public boolean delete(int gradeNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete grade where grade_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, gradeNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
		
	}
	
	//수정
	public boolean update(GradeDto gradeDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update grade set grade_content = ? where grade_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, gradeDto.getGradeContent());
		ps.setInt(2, gradeDto.getGradeNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	

	


}
