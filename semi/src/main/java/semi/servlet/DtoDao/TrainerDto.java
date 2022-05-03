package semi.servlet.DtoDao;

import java.sql.Date;

public class TrainerDto {
	private String trainerId;
	private int centerNo;
	private String trainerPw;
	private String trainerName;
	private String trainerGender;
	private String trainerEmail;
	private String trainerBirth;
	private String trainerSports;
	private String trainerPhone;
	private int trainerPrice;
	private Date trainerJoindate;
	private Date trainerLogindate;
	public String getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}
	public int getCenterNo() {
		return centerNo;
	}
	public void setCenterNo(int centerNo) {
		this.centerNo = centerNo;
	}
	public String getTrainerPw() {
		return trainerPw;
	}
	public void setTrainerPw(String trainerPw) {
		this.trainerPw = trainerPw;
	}
	public String getTrainerName() {
		return trainerName;
	}
	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}
	public String getTrainerGender() {
		return trainerGender;
	}
	public void setTrainerGender(String trainerGender) {
		this.trainerGender = trainerGender;
	}
	public String getTrainerEmail() {
		return trainerEmail;
	}
	public void setTrainerEmail(String trainerEmail) {
		this.trainerEmail = trainerEmail;
	}
	public String getTrainerBirth() {
		return trainerBirth;
	}
	public void setTrainerBirth(String trainerBirth) {
		this.trainerBirth = trainerBirth;
	}
	public String getTrainerSports() {
		return trainerSports;
	}
	public void setTrainerSports(String trainerSports) {
		this.trainerSports = trainerSports;
	}
	public String getTrainerPhone() {
		return trainerPhone;
	}
	public void setTrainerPhone(String trainerPhone) {
		this.trainerPhone = trainerPhone;
	}
	public int getTrainerPrice() {
		return trainerPrice;
	}
	public void setTrainerPrice(int trainerPrice) {
		this.trainerPrice = trainerPrice;
	}
	public Date getTrainerJoindate() {
		return trainerJoindate;
	}
	public void setTrainerJoindate(Date trainerJoindate) {
		this.trainerJoindate = trainerJoindate;
	}
	public Date getTrainerLogindate() {
		return trainerLogindate;
	}
	public void setTrainerLogindate(Date trainerLogindate) {
		this.trainerLogindate = trainerLogindate;
	}
	public TrainerDto() {
		super();
	}
	
	
}