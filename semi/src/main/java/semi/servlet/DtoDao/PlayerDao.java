package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PlayerDao {
	public void insert(PlayerDto playerDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into player(player_id, player_pw, player_name, player_birth, player_phone, player_email, player_grade, player_point, player_joindate) values(?,?,?,?,?,?,'일반회원',0,sysdate)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerDto.getPlayerId());
		ps.setString(2, playerDto.getPlayerPw());
		ps.setString(3, playerDto.getPlayerName());
		ps.setDate(4, playerDto.getPlayerBirth());
		ps.setInt(5, playerDto.getPlayerPhone());
		ps.setString(6, playerDto.getPlayerEmail());

		ps.execute();
		
		con.close();
	}
	
	public PlayerDto selectOne(String playerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from player where player_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerId);
		
		ResultSet rs = ps.executeQuery();
		PlayerDto playerDto = null;
		if(rs.next()) {
			playerDto = new PlayerDto();
			playerDto.setPlayerId(rs.getString("player_id"));
			playerDto.setPlayerPw(rs.getString("player_pw"));
			playerDto.setPlayerName(rs.getString("player_name"));
			playerDto.setPlayerBirth(rs.getDate("player_birth"));
			playerDto.setPlayerPhone(rs.getInt("player_phone"));
			playerDto.setPlayerEmail(rs.getString("player_email"));
			playerDto.setPlayerGrade(rs.getString("player_grade"));
			playerDto.setPlayerPoint(rs.getInt("player_point"));
			playerDto.setPlayerJoindate(rs.getDate("player_joindate"));
			playerDto.setPlayerLogindate(rs.getDate("player_logindate"));
			
		}
		
		con.close();
		return playerDto;
	}
	
	public boolean update(PlayerDto playerDto)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update player set player_name,  player_phone,player_email where player_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerDto.getPlayerName());
		ps.setInt(3, playerDto.getPlayerPhone());
		ps.setString(4, playerDto.getPlayerEmailString());
		ps.setString(5, playerDto.getPlayerId());
		
		int count = ps.executeUpdate();
		
		
		con.close();
		return count > 0;
	}
	
	public boolean delete(String playderId)throws Exception{
		Connection con = JdbcUtils.getConnection();
			
		String sql = "delete player where player_id = ?";
		PreparedStatement ps  = con.prepareStatement(sql);
		
		ps.setString(1, playderId);

		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}

	public boolean updateLogindate(String playerId)throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update player set player_logindate = sysdate where player_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerId);
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}

	public PlayerDto selectId(String playerName, int playerPhone)throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select player_id from player where player_name = ? and playerPhone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerName);
		ps.setInt(2, playerPhone);
	
		ResultSet rs = ps.executeQuery();
		PlayerDto playerDto = null;
		if(rs.next()) {
			playerDto = new PlayerDto();
			playerDto.setPlayerId(rs.getString("playerId"));
		}
		con.close();
		return playerDto;
	}

	public PlayerDto findPw(PlayerDto playerDto)throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from player where player_id = ? and player_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerDto.getPlayerId());
		ps.setString(2, playerDto.getPlayerName());
		
		ResultSet  rs = ps.executeQuery();
		
		PlayerDto findDto = null;
		if(rs.next()) {
			findDto = new PlayerDto();
			playerDto.setPlayerId(rs.getString("player_id"));
			playerDto.setPlayerPw(rs.getString("player_pw"));
			playerDto.setPlayerName(rs.getString("player_name"));
			playerDto.setPlayerBirth(rs.getDate("player_birth"));
			playerDto.setPlayerPhone(rs.getInt("player_phone"));
			playerDto.setPlayerEmail(rs.getString("player_email"));
			playerDto.setPlayerGrade(rs.getString("player_grade"));
			playerDto.setPlayerPoint(rs.getInt("player_point"));
			playerDto.setPlayerJoindate(rs.getDate("player_joindate"));
			playerDto.setPlayerLogindate(rs.getDate("player_logindate"));
		}
		
		con.close();
		return findDto;
	}

}
