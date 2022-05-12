package semi.servlet.DtoDao;

import java.sql.Date;

public class BoardDto {
	private int boardNo;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private Date boardTime;
	private int boardReadCount;
	private String boardWriter;
	
	//생성자
	public BoardDto() {
		super();
	}

	//getter setter
	public int getBoardNO() {
		return boardNo;
	}
	public void setBoardNO(int boardNO) {
		this.boardNo = boardNO;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardTime() {
		return boardTime;
	}
	public void setBoardTime(Date boardTime) {
		this.boardTime = boardTime;
	}
	public int getBoardReadCount() {
		return boardReadCount;
	}
	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
}
