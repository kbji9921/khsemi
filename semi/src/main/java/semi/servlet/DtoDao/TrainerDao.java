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
		String sql = "select * from trainer order by trainer_logindate";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<TrainerDto> list = new ArrayList<>();
		while (rs.next()) {
			TrainerDto trainerDto = new TrainerDto();
			trainerDto.setTrainerId(rs.getString("trainer_id"));
			trainerDto.setTrainerName(rs.getString("trainer_name"));
			trainerDto.setTrainerSports(rs.getString("trainer_sports"));
			list.add(trainerDto);
		}
		con.close();
		return list;
	}

	// 강사 회원가입
	public void insert(TrainerDto trainerDto) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "insert into trainer (trainer_id, trainer_pw, trainer_name, trainer_gender, trainer_email, trainer_birth, trainer_sports, trainer_phone, trainer_price) values "
				+ " (?,?,?,?,?,?,?,?,?) ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, trainerDto.getTrainerId());
		ps.setString(2, trainerDto.getTrainerPw());
		ps.setString(3, trainerDto.getTrainerName());
		ps.setString(4, trainerDto.getTrainerGender());
		ps.setString(5, trainerDto.getTrainerEmail());
		ps.setString(6, trainerDto.getTrainerBirth());
		ps.setString(7, trainerDto.getTrainerSports());
		ps.setString(8, trainerDto.getTrainerPhone());
		ps.setInt(9, trainerDto.getTrainerPrice());
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
			trainerDto.setCenterNo(rs.getInt("center_no"));
			trainerDto.setTrainerId(rs.getString("trainer_id"));
			trainerDto.setTrainerPw(rs.getString("trainer_pw"));
			trainerDto.setTrainerName(rs.getString("trainer_name"));
			trainerDto.setTrainerGender(rs.getString("trainer_gender"));
			trainerDto.setTrainerPhone(rs.getString("trainer_phone"));
			trainerDto.setTrainerEmail(rs.getString("trainer_email"));
			trainerDto.setTrainerJoindate(rs.getDate("member_joindate"));
			trainerDto.setTrainerLogindate(rs.getDate("member_logindate"));
			trainerDto.setTrainerPrice(rs.getInt("trainer_price"));
		} else {
			trainerDto = null;
		}
		con.close();
		return trainerDto;
	}

	// 삭제
	public boolean exit(String id, String pw) throws Exception {
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
	public boolean changePassword(String trainerId, String changePw) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "update trainer set trainer_pw = ? where trainer_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, changePw);
		ps.setString(2, trainerId);
		int count = ps.executeUpdate();

		con.close();

		return count > 0;
	}

	//개인정보 변경 (전화번호, 이메일, 종목, 가격)
	public boolean changeInformation(TrainerDto trainerDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "update member set trainer_phone =?, trainer_email=?, "
				+ " trainer_sports=?,trainer_price=? where trainer_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, trainerDto.getTrainerPhone());
		ps.setString(2, trainerDto.getTrainerEmail());
		ps.setString(3, trainerDto.getTrainerSports());
		ps.setInt(4, trainerDto.getTrainerPrice());
		ps.setString(5, trainerDto.getTrainerId());
	
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
		String sql = "select trainer_id from trainer where trainer_name=? and trainer_phone =? and trainer_birth=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, trainerDto.getTrainerName());
		ps.setString(2, trainerDto.getTrainerPhone());
		ps.setString(3, trainerDto.getTrainerBirth());
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
			findDto.setCenterNo(rs.getInt("center_no"));
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

}
