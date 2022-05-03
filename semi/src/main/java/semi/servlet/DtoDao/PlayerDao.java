package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PlayerDao {
	public void insert(PlayerDto playerDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into player ('player_id','player_ps','player_name','player_birth','player_phone','player_email') "
				+ "values (?,?,?,?,?,?)";
		
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
}
