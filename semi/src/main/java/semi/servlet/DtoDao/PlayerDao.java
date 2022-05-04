package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PlayerDao {
	public void insert(PlayerDto playerDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into player values(?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, playerDto.getPlayerId());
		ps.setString(2, playerDto.getPlayerPw());
		ps.setString(3, playerDto.getPlayerName());
		ps.setInt(4, playerDto.getPlayerPhone());
		ps.setString(5, playerDto.getPlayerEmail());
		
		ps.execute();
		
		con.close();
	}
	
	public PlayerDto selectOne(String playerId)throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * form player where player_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerId);
		
		ResultSet rs = ps.executeQuery();
		PlayerDto playerDto = null;
		if(rs.next()) {
			playerDto = new PlayerDto();
			playerDto.setPlayerId(rs.getString("playerId"));
			playerDto.setPlayerPw(rs.getString("playerPw"));
			playerDto.setPlayerName(rs.getString("playerName"));
			playerDto.setPlayerPhone(rs.getInt("playerPhone"));
			playerDto.setPlayerEmail(rs.getString("PlayerEmail"));
			
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

}
