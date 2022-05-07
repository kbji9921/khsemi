package semi.servlet.DtoDao;

import java.sql.Date;

public class GradeDto {
	private int gradeNo;
	private String gradeTarget;
	private String gradeWriter;
	private Date gradeTime;
	private String gradeContent;
	private int gradeRate;
	
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public String getGradeTarget() {
		return gradeTarget;
	}
	public void setGradeTarget(String gradeTarget) {
		this.gradeTarget = gradeTarget;
	}
	public String getGradeWriter() {
		return gradeWriter;
	}
	public void setGradeWriter(String gradeWriter) {
		this.gradeWriter = gradeWriter;
	}
	public Date getGradeTime() {
		return gradeTime;
	}
	public void setGradeTime(Date gradeTime) {
		this.gradeTime = gradeTime;
	}
	public String getGradeContent() {
		return gradeContent;
	}
	public void setGradeContent(String gradeContent) {
		this.gradeContent = gradeContent;
	}
	public int getGradeRate() {
		return gradeRate;
	}
	public void setGradeRate(int gradeRate) {
		this.gradeRate = gradeRate;
	}
	@Override
	public String toString() {
		return "GradeDto [gradeNo=" + gradeNo + ", gradeTarget=" + gradeTarget + ", gradeWriter=" + gradeWriter
				+ ", gradeTime=" + gradeTime + ", gradeContent=" + gradeContent + ", gradeRate=" + gradeRate + "]";
	}
	public GradeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
