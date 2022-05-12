package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GradeDao {
	public int getSequence() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select grade_sequence.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
				
				
		con.close();
		
		return number;
	}
	//등록
	public void insert(GradeDto gradeDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into grade (grade_no, grade_target, grade_writer, grade_content, grade_rate) values"
				+ "(?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, gradeDto.getGradeNo());
		ps.setString(2, gradeDto.getGradeTarget());
		ps.setString(3, gradeDto.getGradeWriter());
		ps.setString(4, gradeDto.getGradeContent());
		ps.setInt(5, gradeDto.getGradeRate());
		ps.execute();
		
		con.close();
	}	
	
	public List<StatisticVO> statistic() throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "select grade_target, count(*) 숫자, min(grade_rate) 최저점, max(grade_rate) 최고점, avg(grade_rate) 평균점수 from grade group by grade_target";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<StatisticVO> list = new ArrayList<>();
		while (rs.next()) {
			StatisticVO statisticVO = new StatisticVO();
			statisticVO.setCount(rs.getInt("숫자"));// 별칭 사용
			statisticVO.setMin(rs.getInt("최저점"));// 별칭 사용
			statisticVO.setMax(rs.getInt("최고점"));// 별칭 사용
			statisticVO.setAverage(rs.getDouble("평균점수"));// 별칭 사용

			list.add(statisticVO);
		}

		con.close();

		return list;
	}
	//목록
	public List<GradeDto> selectList(String gradeTarget) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from grade where grade_target = ? order by grade_target desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, gradeTarget);
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
	
	//상세조회(grade_target(trainer_id))
	public GradeDto selectOne(String gradeTarget) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql= "select * from center where grade_target = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, gradeTarget);
		ResultSet rs = ps.executeQuery();
		
		GradeDto gradeDto = new GradeDto();
		if(rs.next()) {
			gradeDto.setGradeNo(rs.getInt("grade_no"));
			gradeDto.setGradeTarget(rs.getString("grade_target"));
			gradeDto.setGradeWriter(rs.getString("grade_writer"));
			gradeDto.setGradeTime(rs.getDate("grade_time"));
			gradeDto.setGradeContent(rs.getString("grade_content"));
			gradeDto.setGradeRate(rs.getInt("grade_rate"));
		}
		else {
			gradeDto = null;
		}
		con.close();
		
		return gradeDto;
	}
	
	
	//삭제(gradeWriter 작성자)
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
		
		String sql = "update grade set grade_content = ? grade_rate = ? where grade_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, gradeDto.getGradeContent());
		ps.setInt(2, gradeDto.getGradeRate());
		ps.setInt(3, gradeDto.getGradeNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	

	


}