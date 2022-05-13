package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {

	//등록, 수정, 삭제, 조회, 전체조회
	
	//전체 조회(최신순)
	public List<ReservationDto> insert()throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from reservation order by reservation_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List <ReservationDto> list = new ArrayList();
		while(rs.next()) {
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setReservationNo(rs.getInt("reservation_no"));
			reservationDto.setPlayerId(rs.getString("player_id"));
			reservationDto.setTrainerId(rs.getString("trainer_id"));
			reservationDto.setReservationDate(rs.getDate("reservation_date"));
			reservationDto.setReservationTime(rs.getNString("reservation_time"));
			reservationDto.setPtCount(rs.getInt("pt_count"));
			list.add(reservationDto);
		}
		con.close();
		return list;
	}
	
	//시퀀스
	public int getSequence() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select resv_sequence.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
				
				
		con.close();
		
		return number;
	}
	//등록
	public void insert(ReservationDto reservationDto)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into reservation (reservation_no, player_id, trainer_id, reservation_date, reservation_time) "
					+ " values (?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reservationDto.getReservationNo());
		ps.setString(2, reservationDto.getPlayerId());
		ps.setString(3, reservationDto.getTrainerId());
		ps.setDate(4, reservationDto.getReservationDate());
		ps.setString(5, reservationDto.getReservationTime());
		
		ps.execute();
		
		
		con.close();
	}
	//이용자 일정	
	public ReservationDto selectPlayer(String playerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from reservation where player_id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerId);
		ResultSet rs = ps.executeQuery();
		ReservationDto reservationDto = new ReservationDto();
		if(rs.next()) {
			reservationDto.setReservationNo(rs.getInt("reservation_no"));
			reservationDto.setPlayerId(rs.getString("player_id"));
			reservationDto.setTrainerId(rs.getString("trainer_id"));
			reservationDto.setReservationDate(rs.getDate("reservation_date"));
			reservationDto.setReservationTime(rs.getNString("reservation_time"));
		}else {
			reservationDto =null;
		}
		con.close();
		return reservationDto;
	}
	
	//강사 일정
	public List<ReservationDto> selectTrainer(String trainerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from reservation where trainer_id =? order by reservation_date desc, reservation_time desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, trainerId);
		ResultSet rs = ps.executeQuery();
		List<ReservationDto> list = new ArrayList<>();
		while(rs.next()) {
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setReservationNo(rs.getInt("reservation_no"));
			reservationDto.setPlayerId(rs.getString("player_id"));
			reservationDto.setTrainerId(rs.getString("trainer_id"));
			reservationDto.setReservationDate(rs.getDate("reservation_date"));
			reservationDto.setReservationTime(rs.getNString("reservation_time"));
			list.add(reservationDto);
		}
		con.close();
		return list;
	}
	//수정
	public boolean update (ReservationDto reservationDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update reservation set reservation_date =?, reservation_time=? where player_id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setDate(1, reservationDto.getReservationDate());
		ps.setString(2, reservationDto.getReservationTime());
		ps.setString(3, reservationDto.getPlayerId());

		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	//삭제
	public boolean delete (String playerId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete reservation where player_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerId);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

	public List<ReservationDto> selectDate(String reservationDate) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql ="select * from reservation where reservation_date = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reservationDate);
		ResultSet rs = ps.executeQuery();
		List<ReservationDto> list = new ArrayList<>();
		while(rs.next()) {
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setReservationNo(rs.getInt("reservation_no"));
			reservationDto.setPlayerId(rs.getString("player_id"));
			reservationDto.setTrainerId(rs.getString("trainer_id"));
			reservationDto.setReservationDate(rs.getDate("reservation_date"));
			reservationDto.setReservationTime(rs.getString("reservation_time"));
			list.add(reservationDto);
		}
		con.close();
		return list;
	}
	public List<ReservationDto> select(String playerId, String trainerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reservation where player_id =? and trainer_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerId);
		ps.setString(2, trainerId);
		
		ResultSet rs = ps.executeQuery();
		List<ReservationDto> list = new ArrayList<>();
		while(rs.next()) {
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setReservationNo(rs.getInt("reservation_no"));
			reservationDto.setPlayerId(rs.getString("player_id"));
			reservationDto.setTrainerId(rs.getString("trainer_id"));
			reservationDto.setReservationDate(rs.getDate("reservation_date"));
			reservationDto.setReservationTime(rs.getString("reservation_time"));
			list.add(reservationDto);
		}
		con.close();
		return list;
	}
	public List<ReservationDto> selectOnePlayer(String playerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reservation where player_id =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerId);
		
		
		ResultSet rs = ps.executeQuery();
		List<ReservationDto> list = new ArrayList<>();
		while(rs.next()) {
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setReservationNo(rs.getInt("reservation_no"));
			reservationDto.setPlayerId(rs.getString("player_id"));
			reservationDto.setTrainerId(rs.getString("trainer_id"));
			reservationDto.setReservationDate(rs.getDate("reservation_date"));
			reservationDto.setReservationTime(rs.getString("reservation_time"));
			list.add(reservationDto);
		}
		con.close();
		return list;
	}
				
}
