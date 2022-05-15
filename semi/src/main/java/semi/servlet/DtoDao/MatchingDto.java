package semi.servlet.DtoDao;

import java.sql.Date;

public class MatchingDto {
	private int matchingNo;
	private String studentId;
	private String coachId;
	private int matchingDays;
	private Date matchingDate;
	private String matchingState;
	private int ptTotal;
	
	
	public int getMatchingNo() {
		return matchingNo;
	}

	public void setMatchingNo(int matchingNo) {
		this.matchingNo = matchingNo;
	}

	public String getStudentId() {
		return studentId;
	}
	
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getCoachId() {
		return coachId;
	}
	public void setCoachId(String coachId) {
		this.coachId = coachId;
	}
	public Date getMatchingDate() {
		return matchingDate;
	}
	public void setMatchingDate(Date matchingDate) {
		this.matchingDate = matchingDate;
	}
	public int getMatchingDays() {
		return matchingDays;
	}
	public void setMatchingDays(int matchingDays) {
		this.matchingDays = matchingDays;
	}
	
	public String getMatchingState() {
		return matchingState;
	}
	public void setMatchingState(String matchingState) {
		this.matchingState = matchingState;
	}
	
	
	public int getPtTotal() {
		return ptTotal;
	}

	public void setPtTotal(int ptTotal) {
		this.ptTotal = ptTotal;
	}

	public MatchingDto() {
		super();
	}
	
	
}
