package semi.servlet.DtoDao;

import java.sql.Date;

public class PlayerDto {
	private String playerId;
	private String playerPw;
	private String playerName;
	private Date playerBirth;
	private int playerPhone;
	private String playerEmail;
	private int playerPoint;
	private String playerGrade;
	private Date playerJoin;
	private Date playerLogin;
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
	public int getPlayerPoint() {
		return playerPoint;
	}
	public void setPlayerPoint(int playerPoint) {
		this.playerPoint = playerPoint;
	}
	public String getPlayerGrade() {
		return playerGrade;
	}
	public void setPlayerGrade(String playerGrade) {
		this.playerGrade = playerGrade;
	}
	public Date getPlayerJoin() {
		return playerJoin;
	}
	public void setPlayerJoin(Date playerJoin) {
		this.playerJoin = playerJoin;
	}
	public Date getPlayerLogin() {
		return playerLogin;
	}
	public void setPlayerLogin(Date playerLogin) {
		this.playerLogin = playerLogin;
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
	@Override
	public String toString() {
		return "PlayerDto [playerId=" + playerId + ", playerPw=" + playerPw + ", playerName=" + playerName
				+ ", playerBirth=" + playerBirth + ", playerPhone=" + playerPhone + ", playerEmail=" + playerEmail
				+ ", playerPoint=" + playerPoint + ", playerGrade=" + playerGrade + ", playerJoin=" + playerJoin
				+ ", playerLogin=" + playerLogin + "]";
	}
	
	
}
