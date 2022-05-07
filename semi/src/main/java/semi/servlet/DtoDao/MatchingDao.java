package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MatchingDao {
	public List<MatchingDto> selectList(String playerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from matching where student_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerId);
		ResultSet rs = ps.executeQuery();
		List<MatchingDto> list = new ArrayList<>();
		while(rs.next()) {
			MatchingDto matchingDto = new MatchingDto();
			matchingDto.setStudentId(rs.getString("student_id"));
			matchingDto.setCoachId(rs.getString("coach_id"));
			matchingDto.setMatchingDate(rs.getDate("matching_date"));
			matchingDto.setMatchingDays(rs.getInt("matching_days"));
			
			list.add(matchingDto);
		}
		con.close();
		return list;
	}
	
	public void insert(MatchingDto matchingDto)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into matching (student_id,coach_id,matching_date,matching_days) values(?,?,sysdate,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, matchingDto.getStudentId());
		ps.setString(2, matchingDto.getCoachId());
		ps.setInt(3, matchingDto.getMatchingDays());
		
		ps.execute();
		
		con.close(); 
	}
	
	public boolean delete(String studentId, String coachId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete from matching where student_id = ? and coach_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, studentId);
		ps.setString(2, coachId);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	public List<MatchingDto>selectList()throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from matching";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		List<MatchingDto> list = new ArrayList<>();
		while(rs.next()) {
			MatchingDto matchingDto = new MatchingDto();
			matchingDto.setStudentId(rs.getString("student_id"));
			matchingDto.setCoachId(rs.getString("coach_id"));
			matchingDto.setMatchingDate(rs.getDate("matching_date"));
			matchingDto.setMatchingDays(rs.getInt("matching_days"));
			
			list.add(matchingDto);
		}
		
		con.close();
		return list;
	}
	
	public Integer selectOne(String playerId,String trainerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select matching_days from matching where student_id = ? and coach_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerId);
		ps.setString(2, trainerId);

		ResultSet rs = ps.executeQuery();
		int Tpcount;
		if(rs.next()) {
			Tpcount = rs.getInt("matching_days");
		}else {
			Tpcount = 0;
		}
		
		con.close();
		return Tpcount;
	}
	
	
}
