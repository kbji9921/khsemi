package semi.servlet.DtoDao;

import java.sql.Date;

public class MatchingDto {
	private String studentId;
	private String coachId;
	private Date MatchingDate;
	private int matchingDays;
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
		return MatchingDate;
	}
	public void setMatchingDate(Date matchingDate) {
		MatchingDate = matchingDate;
	}
	public int getMatchingDays() {
		return matchingDays;
	}
	public void setMatchingDays(int matchingDays) {
		this.matchingDays = matchingDays;
	}
	
	public MatchingDto() {
		super();
	}
	
	
}
