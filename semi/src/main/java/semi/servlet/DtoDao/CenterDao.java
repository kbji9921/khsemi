package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.proxy.annotation.Pre;

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
	//전체 목록
	public List<CenterDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from center order by center_name asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<CenterDto> list = new ArrayList<>();
		while(rs.next()) {
			CenterDto centerDto = new CenterDto();
			centerDto.setCenterId(rs.getString("center_id"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterWeektime(rs.getString("center_weektime"));
			centerDto.setCenterWkndtime(rs.getString("center_wkndtime"));
			centerDto.setCenterPost(rs.getString("center_post"));
			centerDto.setCenterBasicAddress(rs.getString("center_basic_address"));
			centerDto.setCenterDetailAddress(rs.getString("center_detail_address"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
			
			list.add(centerDto);
		}
		
		con.close();
		
		return list;
	}
	
	//동,센터명 검색
	public List<CenterDto> selectList(String type,String keyword,int p, int s,String exerciseName) throws Exception{
		Connection con = JdbcUtils.getConnection();
		int end = p *s;
		int begin = end -(s-1);
		
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from (select * from ("
				+ "select C.*,E.exercise_name from center C inner join eoc E on C.center_id = E.center_id "
				+ "where E.exercise_name= ? order by center_name asc) where "
				+ "instr(#1,upper(?))>=1 )TMP)where rn between ? and ?";
		
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, exerciseName);
		ps.setString(2, keyword);
		ps.setInt(3, begin);
		ps.setInt(4, end);
		ResultSet rs = ps.executeQuery();
		
		List<CenterDto> list = new ArrayList<>();
		while(rs.next()) {
			CenterDto centerDto = new CenterDto();
			centerDto.setCenterId(rs.getString("center_id"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterWeektime(rs.getString("center_weektime"));
			centerDto.setCenterWkndtime(rs.getString("center_wkndtime"));
			centerDto.setCenterPost(rs.getString("center_post"));
			centerDto.setCenterBasicAddress(rs.getString("center_basic_address"));
			centerDto.setCenterDetailAddress(rs.getString("center_detail_address"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
			
			list.add(centerDto);
		}
		
		
		con.close();
		
		return list;
	}
	
	//센터 담당 운동명으로 찾기-
	public List<CenterDto> selectList(int p, int s,String exerciseName) throws Exception{
		int end = p *s;
		int begin = end -(s-1);
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
				+ "select C.*,E.exercise_name from center C inner join eoc E on "
				+ "C.center_id = E.center_id where E.exercise_name=? order by center_name asc)TMP ) where rn between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, exerciseName);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<CenterDto> list = new ArrayList<>(); 
		
		while(rs.next()) {
			CenterDto centerDto = new CenterDto();
			centerDto.setCenterId(rs.getString("center_id"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterWeektime(rs.getString("center_weektime"));
			centerDto.setCenterWkndtime(rs.getString("center_wkndtime"));
			centerDto.setCenterPost(rs.getString("center_post"));
			centerDto.setCenterBasicAddress(rs.getString("center_basic_address"));
			centerDto.setCenterDetailAddress(rs.getString("center_detail_address"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
			
			list.add(centerDto);
		}
		
		
		con.close();
		
		return list;
	}
	//센터 상세조회
	public CenterDto selectOne(String centerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from center where center_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ResultSet rs = ps.executeQuery();
		
		CenterDto centerDto;
		if(rs.next()) {
			centerDto = new CenterDto();
			centerDto.setCenterId(rs.getString("center_id"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterWeektime(rs.getString("center_weektime"));
			centerDto.setCenterWkndtime(rs.getString("center_wkndtime"));
			centerDto.setCenterPost(rs.getString("center_post"));
			centerDto.setCenterBasicAddress(rs.getString("center_basic_address"));
			centerDto.setCenterDetailAddress(rs.getString("center_detail_address"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
		}
		else {
			centerDto = null;
		}
		
		con.close();
		
		return centerDto;
	}
	
	//센터 페이징 조회
	public List<CenterDto> selectListByPaging(int p, int s) throws Exception{
		int end = p *s;
		int begin = end -(s-1);
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
				+ "select * from center order by center_name asc)TMP ) where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<CenterDto> list = new ArrayList<>();
		while(rs.next()) {
			CenterDto centerDto = new CenterDto();
			centerDto.setCenterId(rs.getString("center_id"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterWeektime(rs.getString("center_weektime"));
			centerDto.setCenterWkndtime(rs.getString("center_wkndtime"));
			centerDto.setCenterPost(rs.getString("center_post"));
			centerDto.setCenterBasicAddress(rs.getString("center_basic_address"));
			centerDto.setCenterDetailAddress(rs.getString("center_detail_address"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
			
			list.add(centerDto);
		}
				
		con.close();
		
		return list;
	}
	
	//센터 페이징 검색
	public List<CenterDto> selectListByPaging(int p,int s, String type,String keyword) throws Exception{
		int end = p*s;
		int begin = end-(s-1);
		
		Connection con= JdbcUtils.getConnection();
		
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
				+ "select * from center where instr(#1,?)>0 order by center_name asc)TMP ) where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<CenterDto> list = new ArrayList<>();
		while(rs.next()) {
			CenterDto centerDto = new CenterDto();
			centerDto.setCenterId(rs.getString("center_id"));
			centerDto.setCenterName(rs.getString("center_name"));
			centerDto.setCenterPhone(rs.getString("center_phone"));
			centerDto.setCenterWeektime(rs.getString("center_weektime"));
			centerDto.setCenterWkndtime(rs.getString("center_wkndtime"));
			centerDto.setCenterPost(rs.getString("center_post"));
			centerDto.setCenterBasicAddress(rs.getString("center_basic_address"));
			centerDto.setCenterDetailAddress(rs.getString("center_detail_address"));
			centerDto.setCenterIntroduction(rs.getString("center_introduction"));
			
			list.add(centerDto);
		}
		
		con.close();
		
		return list;
	}
	//센터 전체 개수
	public int countByPaging(String exerciseName) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from ("
				+ "select C.*,E.exercise_name from center C inner join eoc E on C.center_id = E.center_id "
				+ "where E.exercise_name=? order by center_name asc)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, exerciseName);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt("count(*)");
		
		con.close();
		
		return count;
	}
	//센터 검색 개수
	public int countByPaging(String type, String keyword, String exerciseName) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from ("
				+ "select C.*,E.exercise_name from center C inner join eoc E on C.center_id = E.center_id "
				+ "where E.exercise_name= ? order by center_name asc) where instr(#1,upper(?))>=1";
		sql= sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, exerciseName);
		ps.setString(2, keyword);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt("count(*)");
		
		con.close();
		
		return count;
	}
	
	//센터 상세페이지 내 강사 페이징
		public List<TrainerDto> centerTrainerByPaging(int p, int s, String centerId) throws Exception{
			int end = p * s;
			int begin = end -(s-1);
			
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
					+ "select * from trainer where center_id =? order by trainer_name asc)TMP ) where rn between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, centerId);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			List<TrainerDto> list = new ArrayList<>();
			while(rs.next()) {
				TrainerDto trainerDto = new TrainerDto();
				trainerDto.setCenterId(rs.getString("center_id"));
				trainerDto.setTrainerId(rs.getString("trainer_id"));
				trainerDto.setTrainerPw(rs.getString("trainer_pw"));
				trainerDto.setTrainerName(rs.getString("trainer_name"));
				trainerDto.setTrainerBirth(rs.getString("trainer_birth"));
				trainerDto.setTrainerGender(rs.getString("trainer_gender"));
				trainerDto.setTrainerPhone(rs.getString("trainer_phone"));
				trainerDto.setTrainerEmail(rs.getString("trainer_email"));
				trainerDto.setTrainerJoindate(rs.getDate("trainer_joindate"));
				trainerDto.setTrainerLogindate(rs.getDate("trainer_logindate"));
				trainerDto.setTrainerPrice(rs.getInt("trainer_price"));
				list.add(trainerDto);
			}
			
			con.close();
			
			return list;
		}
}
