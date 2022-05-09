package semi.servlet.DtoDao;

import java.sql.Date;

public class ReservationDto {
	
	private int reservationNo;
	private String playerId;
	private String trainerId;
	private Date reservationDate;
	private String reservationTime;
	private int ptCount;
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getPlayerId() {
		return playerId;
	}
	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}
	public String getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}
	public int getPtCount() {
		return ptCount;
	}
	public void setPtCount(int ptCount) {
		this.ptCount = ptCount;
	}
	public ReservationDto() {
		super();
	}
	
	
}
