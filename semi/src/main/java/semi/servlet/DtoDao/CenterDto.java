package semi.servlet.DtoDao;

import java.util.Date;

public class CenterDto {
	private long centerNo;
	private String centerName;
	private String centerWeekStime;
	private String centerWeekFtime;
	private String centerWkndStime;
	private String centerWkndFtime;
	private String centerPhone;
	private Date centerOpen;
	private String centerIntroduction;
	//비용, 개월 추가
	private int centerPay;
	private int centerMonth;
	public CenterDto() {
		super();
	}
	public long getCenterNo() {
		return centerNo;
	}
	public void setCenterNo(long centerNo) {
		this.centerNo = centerNo;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	public String getCenterWeekStime() {
		return centerWeekStime;
	}
	public void setCenterWeekStime(String centerWeekStime) {
		this.centerWeekStime = centerWeekStime;
	}
	public String getCenterWeekFtime() {
		return centerWeekFtime;
	}
	public void setCenterWeekFtime(String centerWeekFtime) {
		this.centerWeekFtime = centerWeekFtime;
	}
	public String getCenterWkndStime() {
		return centerWkndStime;
	}
	public void setCenterWkndStime(String centerWkndStime) {
		this.centerWkndStime = centerWkndStime;
	}
	public String getCenterWkndFtime() {
		return centerWkndFtime;
	}
	public void setCenterWkndFtime(String centerWkndFtime) {
		this.centerWkndFtime = centerWkndFtime;
	}
	public String getCenterPhone() {
		return centerPhone;
	}
	public void setCenterPhone(String centerPhone) {
		this.centerPhone = centerPhone;
	}
	public Date getCenterOpen() {
		return centerOpen;
	}
	public void setCenterOpen(Date centerOpen) {
		this.centerOpen = centerOpen;
	}
	public String getCenterIntroduction() {
		return centerIntroduction;
	}
	public void setCenterIntroduction(String centerIntroduction) {
		this.centerIntroduction = centerIntroduction;
	}
	public int getCenterPay() {
		return centerPay;
	}
	public void setCenterPay(int centerPay) {
		this.centerPay = centerPay;
	}
	public int getCenterMonth() {
		return centerMonth;
	}
	public void setCenterMonth(int centerMonth) {
		this.centerMonth = centerMonth;
	}
	
	
	
}
