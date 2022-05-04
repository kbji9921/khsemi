package semi.servlet.DtoDao;

import java.sql.Date;

public class PlayerDto {
	private String playerId;
	private String playerPw;
	private String playerName;
	private int playerPhone;
	private String playerEmail;
	
	public String getPlayerId() {
		return playerId;
	}
	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}
	public String getPlayerPw() {
		return playerPw;
	}
	public void setPlayerPw(String playerPw) {
		this.playerPw = playerPw;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	
	public int getPlayerPhone() {
		return playerPhone;
	}
	public void setPlayerPhone(int playerPhone) {
		this.playerPhone = playerPhone;
	}
	public String getPlayerEmail() {
		return playerEmail;
	}
	public void setPlayerEmail(String playerEmail) {
		this.playerEmail = playerEmail;
	}
	
	public String getPlayerEmailString() {
		if(this.playerEmail == null) return "";
		else return this.playerEmail;
	}
	
	//생성자
	public PlayerDto() {
		super();
	}
	//toString
	
	
}
