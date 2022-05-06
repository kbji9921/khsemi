package semi.servlet.DtoDao;

public class EocDto {
	private long eocNo;
	private String eocCenterId;
	private String eocExerciseName;
	public EocDto() {
		super();
	}
	public long getEocNo() {
		return eocNo;
	}
	public void setEocNo(long eocNo) {
		this.eocNo = eocNo;
	}
	public String getEocCenterId() {
		return eocCenterId;
	}
	public void setEocCenterId(String eocCenterId) {
		this.eocCenterId = eocCenterId;
	}
	public String getEocExerciseName() {
		return eocExerciseName;
	}
	public void setEocExerciseName(String eocExerciseName) {
		this.eocExerciseName = eocExerciseName;
	}
	
}
