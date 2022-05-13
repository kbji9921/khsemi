package semi.servlet.DtoDao;

public class CenterLikeDto {
	private long cLikeNo;
	private String playerId;
	private String centerId;
	private int cLikeCheck;
	
	public int getcLikeCheck() {
		return cLikeCheck;
	}
	public void setcLikeCheck(int cLikeCheck) {
		this.cLikeCheck = cLikeCheck;
	}
	public CenterLikeDto() {
		super();
	}
	public long getcLikeNo() {
		return cLikeNo;
	}
	public void setcLikeNo(long cLikeNo) {
		this.cLikeNo = cLikeNo;
	}
	public String getPlayerId() {
		return playerId;
	}
	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}
	public String getCenterId() {
		return centerId;
	}
	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}
	
	
}
