package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PlayerInsertDao {
	public void insert(PlayerInsertDto playerInsertDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into player (player_id,player_ps,player_name,player_birth,player_phone,player_email) "
				+ "values (?,?,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, playerInsertDto.getPlayerId());
		ps.setString(2, playerInsertDto.getPlayerPw());
		ps.setString(3, playerInsertDto.getPlayerName());
		ps.setDate(4, playerInsertDto.getPlayerBirth());
		ps.setInt(5, playerInsertDto.getPlayerPhone());
		ps.setString(6, playerInsertDto.getPlayerEmail());
		
		ps.execute();
		
		con.close();
	}
}
