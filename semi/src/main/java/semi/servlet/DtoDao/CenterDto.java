package semi.servlet.DtoDao;

public class CenterDto {
	private String centerId;
	private String centerName;
	private String centerPhone;
	private String centerWeektime;
	private String centerWkndtime;
	private String centerPost;
	private String centerBasicAddress;
	private String centerDetailAddress;
	private String centerIntroduction;
	private int centerLikeCount;
	
	public int getCenterLikeCount() {
		return centerLikeCount;
	}
	public void setCenterLikeCount(int centerLikeCount) {
		this.centerLikeCount = centerLikeCount;
	}
	public CenterDto() {
		super();
	}
	public String getCenterId() {
		return centerId;
	}
	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	public String getCenterPhone() {
		return centerPhone;
	}
	public void setCenterPhone(String centerPhone) {
		this.centerPhone = centerPhone;
	}
	public String getCenterWeektime() {
		return centerWeektime;
	}
	public void setCenterWeektime(String centerWeektime) {
		this.centerWeektime = centerWeektime;
	}
	public String getCenterWkndtime() {
		return centerWkndtime;
	}
	public void setCenterWkndtime(String centerWkndtime) {
		this.centerWkndtime = centerWkndtime;
	}
	public String getCenterPost() {
		return centerPost;
	}
	public void setCenterPost(String centerPost) {
		this.centerPost = centerPost;
	}
	public String getCenterBasicAddress() {
		return centerBasicAddress;
	}
	public void setCenterBasicAddress(String centerBasicAddress) {
		this.centerBasicAddress = centerBasicAddress;
	}
	public String getCenterDetailAddress() {
		return centerDetailAddress;
	}
	public void setCenterDetailAddress(String centerDetailAddress) {
		this.centerDetailAddress = centerDetailAddress;
	}
	public String getCenterIntroduction() {
		return centerIntroduction;
	}
	public void setCenterIntroduction(String centerIntroduction) {
		this.centerIntroduction = centerIntroduction;
	}
	
	
}
