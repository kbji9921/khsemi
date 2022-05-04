package semi.servlet.DtoDao;

import java.sql.Date;

public class PlayerDto {
	private String playerId;
	private String playerPw;
	private String playerName;
	private Date playerBirth;
	private int playerPhone;
	private String playerEmail;
	private String playerGrade;
	private int playerPoint;
	private Date playerJoindate;
	private Date playerLogindate;
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
	public Date getPlayerBirth() {
		return playerBirth;
	}
	public void setPlayerBirth(Date playerBirth) {
		this.playerBirth = playerBirth;
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
	public String getPlayerGrade() {
		return playerGrade;
	}
	public void setPlayerGrade(String playerGrade) {
		this.playerGrade = playerGrade;
	}
	public int getPlayerPoint() {
		return playerPoint;
	}
	public void setPlayerPoint(int playerPoint) {
		this.playerPoint = playerPoint;
	}
	public Date getPlayerJoindate() {
		return playerJoindate;
	}
	public void setPlayerJoindate(Date playerJoindate) {
		this.playerJoindate = playerJoindate;
	}
	public Date getPlayerLogindate() {
		return playerLogindate;
	}
	public void setPlayerLogindate(Date playerLogindate) {
		this.playerLogindate = playerLogindate;
	}
	
	public String getPlayerEmailString() {
		if(this.playerEmail == null) return "";
		else return this.playerEmail;
	}
	public PlayerDto() {
		super();
	}
	
	@Override
	public String toString() {
		return "PlayerDto [playerId=" + playerId + ", playerPw=" + playerPw + ", playerName=" + playerName
				+ ", playerBirth=" + playerBirth + ", playerPhone=" + playerPhone + ", playerEmail=" + playerEmail
				+ ", playerGrade=" + playerGrade + ", playerPoint=" + playerPoint + ", playerJoindate=" + playerJoindate
				+ ", playerLogindate=" + playerLogindate + "]";
	}
	
	
	
}
