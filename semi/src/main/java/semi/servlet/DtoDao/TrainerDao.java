package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TrainerDao {
   // 목록
   public List<TrainerDto> selectList() throws Exception {
      Connection con = JdbcUtils.getConnection();
      String sql = "select * from trainer";
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      List<TrainerDto> list = new ArrayList<>();
      while (rs.next()) {
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

   // 강사 회원가입
   public void join(TrainerDto trainerDto) throws Exception {
      Connection con = JdbcUtils.getConnection();

      String sql = "insert into trainer (trainer_id, trainer_pw, trainer_name, trainer_gender, trainer_email, trainer_birth, trainer_sports, trainer_phone) values "
            + " (?,?,?,?,?,?,?,?) ";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, trainerDto.getTrainerId());
      ps.setString(2, trainerDto.getTrainerPw());
      ps.setString(3, trainerDto.getTrainerName());
      ps.setString(4, trainerDto.getTrainerGender());
      ps.setString(5, trainerDto.getTrainerEmail());
      ps.setString(6, trainerDto.getTrainerBirth());
      ps.setString(7, trainerDto.getTrainerSports());
      ps.setString(8, trainerDto.getTrainerPhone());
      ps.execute();

      con.close();
   }

   // 강사 상세조회
   public TrainerDto selectOne(String trainerId) throws Exception {
      Connection con = JdbcUtils.getConnection();
      String sql = "select * from trainer where trainer_id=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, trainerId);
      ResultSet rs = ps.executeQuery();
      TrainerDto trainerDto;

      if (rs.next()) {
         trainerDto = new TrainerDto();
         trainerDto.setCenterId(rs.getString("center_id"));
         trainerDto.setTrainerId(rs.getString("trainer_id"));
         trainerDto.setTrainerPw(rs.getString("trainer_pw"));
         trainerDto.setTrainerBirth(rs.getString("trainer_birth"));
         trainerDto.setTrainerSports(rs.getString("trainer_sports"));;
         trainerDto.setTrainerName(rs.getString("trainer_name"));
         trainerDto.setTrainerGender(rs.getString("trainer_gender"));
         trainerDto.setTrainerPhone(rs.getString("trainer_phone"));
         trainerDto.setTrainerEmail(rs.getString("trainer_email"));
         trainerDto.setTrainerJoindate(rs.getDate("trainer_joindate"));
         trainerDto.setTrainerLogindate(rs.getDate("trainer_logindate"));
         trainerDto.setTrainerPrice(rs.getInt("trainer_price"));
      } else {
         trainerDto = null;
      }
      con.close();
      return trainerDto;
   }

   // 삭제
   public boolean delete(String id, String pw) throws Exception {
      Connection con = JdbcUtils.getConnection();
      String sql = "delete trainer where trainer_id =? and trainer_pw=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, id);
      ps.setString(2, pw);
      int count = ps.executeUpdate();

      con.close();
      return count > 0;
   }


   // 비밀번호 변경
   public boolean changePassword(String id, String pw) throws Exception {
      Connection con = JdbcUtils.getConnection();
		String sql = "update trainer set trainer_pw = ? where trainer_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setString(2, id);
		int count = ps.executeUpdate();

      con.close();

      return count > 0;
   }

   //개인정보 변경 (전화번호, 이메일, 종목, 가격)
   public boolean changeInformation(TrainerDto trainerDto) throws Exception {
      Connection con = JdbcUtils.getConnection();
      String sql = "update trainer set trainer_phone =?, trainer_email=?,"
            + " trainer_sports=?,trainer_price=?, trainer_name=?, trainer_birth=? where trainer_id = ? and trainer_pw=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, trainerDto.getTrainerPhone());
      ps.setString(2, trainerDto.getTrainerEmail());
      ps.setString(3, trainerDto.getTrainerSports());
      ps.setInt(4, trainerDto.getTrainerPrice());
      ps.setString(5, trainerDto.getTrainerName());
      ps.setString(6, trainerDto.getTrainerBirth());
      ps.setString(7, trainerDto.getTrainerId());
      ps.setString(8, trainerDto.getTrainerPw());
      int count = ps.executeUpdate();

      con.close();

      return count > 0;


   }
   // 접속일시 갱신
   public boolean updateLogindate(String trainerId) throws Exception {
      Connection con = JdbcUtils.getConnection();
      String sql = "update trainer set trainer_logindate = sysdate where trainer_id=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, trainerId);
      int count = ps.executeUpdate();


      con.close();
      return count > 0;
   }
   //아이디 찾기
   public String findId(TrainerDto trainerDto) throws Exception {
      Connection con = JdbcUtils.getConnection();
      String sql = "select trainer_id from trainer where trainer_name=? and trainer_phone =? and trainer_email=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, trainerDto.getTrainerName());
      ps.setString(2, trainerDto.getTrainerPhone());
      ps.setString(3, trainerDto.getTrainerEmail());
      ResultSet rs = ps.executeQuery();
      // null or data
      String trainerId;
      if (rs.next()) {
         trainerId = rs.getString("trainer_id");

      } else {
         trainerId = null;
      }

      con.close();
      return trainerId;
   }
   // 비밀번호 찾기(아이디, 이름, 전화번호, 생년월일)
   public TrainerDto findPw(TrainerDto trainerDto) throws Exception {
      Connection con = JdbcUtils.getConnection();
      String sql = "select * from trainer where trainer_id=? and trainer_name =? and trainer_phone=? and trainer_birth=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, trainerDto.getTrainerId());
      ps.setString(2, trainerDto.getTrainerName());
      ps.setString(3, trainerDto.getTrainerPhone());
      ps.setString(4, trainerDto.getTrainerBirth());
      ResultSet rs = ps.executeQuery();
      TrainerDto findDto;

      if (rs.next()) {
         findDto = new TrainerDto();
         findDto.setCenterId(rs.getString("center_Id"));
         findDto.setTrainerId(rs.getString("trainer_id"));
         findDto.setTrainerPw(rs.getString("trainer_pw"));
         findDto.setTrainerName(rs.getString("trainer_name"));
         findDto.setTrainerBirth(rs.getString("trainer_birth"));
         findDto.setTrainerGender(rs.getString("trainer_gender"));
         findDto.setTrainerPhone(rs.getString("trainer_phone"));
         findDto.setTrainerEmail(rs.getString("trainer_email"));
         findDto.setTrainerSports(rs.getString("trainer_sports"));
         findDto.setTrainerJoindate(rs.getDate("trainer_joindate"));
         findDto.setTrainerLogindate(rs.getDate("trainer_logindate"));
         findDto.setTrainerPrice(rs.getInt("trainer_price"));
      } else {
         findDto = null;
      }
      con.close();
      return findDto;

	}
	//강사 페이징 조회
	public List<TrainerDto> selectListByPaging(int p, int s) throws Exception{
		int end = p *s;
		int begin = end -(s-1);
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
				+ "select * from trainer order by trainer_joindate asc)TMP ) where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<TrainerDto> list = new ArrayList<>();
		while (rs.next()) {
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
	//강사 찾기
	public List<TrainerDto> selectTrainerList(String centerId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from trainer where center_id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, centerId);
		ResultSet rs = ps.executeQuery();
		List<TrainerDto> list = new ArrayList<>();
		while (rs.next()) {
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

   //센터 페이징 검색
      public List<TrainerDto> selectListByPaging(int p,int s, String type,String keyword) throws Exception{
         int end = p*s;
         int begin = end-(s-1);
         
         Connection con= JdbcUtils.getConnection();
         
         String sql = "select * from ("
               + "select rownum rn, TMP.* from ("
               + "select * from trainer where instr(#1,?)>0 order by trainer_name asc)TMP ) where rn between ? and ?";
         sql = sql.replace("#1", type);
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, keyword);
         ps.setInt(2, begin);
         ps.setInt(3, end);
         ResultSet rs = ps.executeQuery();
         
         List<TrainerDto> list = new ArrayList<>();
         while(rs.next()) {
            TrainerDto trainerDto = new TrainerDto();
            trainerDto.setTrainerId(rs.getString("trainer_id"));
            trainerDto.setTrainerName(rs.getString("trainer_name"));
            trainerDto.setTrainerPw(rs.getString("trainer_pw"));
            trainerDto.setTrainerPhone(rs.getString("trainer_phone"));
            trainerDto.setTrainerBirth(rs.getString("trainer_birth"));
            trainerDto.setTrainerSports(rs.getString("trainer_sports"));
            trainerDto.setTrainerEmail(rs.getString("trainer_email"));
            trainerDto.setTrainerGender(rs.getString("trainer_gender"));
            trainerDto.setTrainerPrice(rs.getInt("trainer_price"));
            trainerDto.setTrainerJoindate(rs.getDate("trainer_joindate"));
            trainerDto.setTrainerLogindate(rs.getDate("trainer_logindate"));
            trainerDto.setCenterId(rs.getString("center_id"));
            list.add(trainerDto);
         }
         
         con.close();
         
         return list;
      }

      
  	//센터 상세페이지 내 강사 페이징
  	public List<TrainerDto> centerTrainerByPaging(int p, int s, String centerId) throws Exception{
  		int end = p * s;
  		int begin = end -(s-1);
  		
  		Connection con = JdbcUtils.getConnection();
  		
  		String sql = "select * from ("
  				+ "select rownum rn, TMP.* from ("
  				+ "select * from trainer where center_id =? order by trainer_id desc)TMP ) where rn between ? and ?";
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


	
	//운동 종목(trainerSports)으로 찾기
	public List<TrainerDto> selectTrainerSportsList(String trainerSports) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from trainer where trainer_sports =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, trainerSports);
		ResultSet rs = ps.executeQuery();
		List<TrainerDto> list = new ArrayList<>();
		while (rs.next()) {
			TrainerDto trainerDto = new TrainerDto();
			
			trainerDto.setCenterId(rs.getString("center_id"));
			trainerDto.setTrainerId(rs.getString("trainer_id"));
			trainerDto.setTrainerPw(rs.getString("trainer_pw"));
			trainerDto.setTrainerName(rs.getString("trainer_name"));
			trainerDto.setTrainerBirth(rs.getString("trainer_birth"));
			trainerDto.setTrainerGender(rs.getString("trainer_gender"));
			trainerDto.setTrainerPhone(rs.getString("trainer_phone"));
			trainerDto.setTrainerEmail(rs.getString("trainer_email"));
			trainerDto.setTrainerSports(rs.getString("trainer_sports"));
			trainerDto.setTrainerLogindate(rs.getDate("trainer_logindate"));
			trainerDto.setTrainerPrice(rs.getInt("trainer_price"));
			list.add(trainerDto);
		}
		con.close();
		return list;
	}	


	//게시글 수(조회)
	public int countByPaging() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from trainer";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt("count(*)");
		
		con.close();
		
		return count;
	}
	//게시글 수 검색
	public int countByPaging(String type, String keyword) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from trainer where instr (#1,?) > 0";
		sql= sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt("count(*)");
		
		con.close();
		
		return count;
	}
	//센터 아이디로 센터 이름 찾기
		public CenterDto selectList(String trainerId) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select C.*, C.center_name from center C inner join trainer T on C.center_id = T.center_id where T.trainer_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, trainerId);
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
		public List<GradeDto> selectGrade(String trainerId) throws Exception{
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select G.*, G.grade_rate from grade G inner join trainer T on G.grade_target = T.trainer_id where T.trainer_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, trainerId);
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

		public TrainerDto findByNickname(String trainerId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from trainer where trainer_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, trainerId);
			ResultSet rs = ps.executeQuery();
			
			TrainerDto trainerDto;
			if (rs.next()) {
				trainerDto = new TrainerDto();
				trainerDto.setCenterId(rs.getString("center_Id"));
				trainerDto.setTrainerId(rs.getString("trainer_id"));
				trainerDto.setTrainerPw(rs.getString("trainer_pw"));
				trainerDto.setTrainerName(rs.getString("trainer_name"));
				trainerDto.setTrainerBirth(rs.getString("trainer_birth"));
				trainerDto.setTrainerGender(rs.getString("trainer_gender"));
				trainerDto.setTrainerPhone(rs.getString("trainer_phone"));
				trainerDto.setTrainerEmail(rs.getString("trainer_email"));
				trainerDto.setTrainerSports(rs.getString("trainer_sports"));
				trainerDto.setTrainerJoindate(rs.getDate("trainer_joindate"));
				trainerDto.setTrainerLogindate(rs.getDate("trainer_logindate"));
				trainerDto.setTrainerPrice(rs.getInt("trainer_price"));
			} else {
				trainerDto = null;
			}
			con.close();
			return trainerDto;
		}
}