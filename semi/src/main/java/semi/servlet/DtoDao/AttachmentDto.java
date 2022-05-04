package semi.servlet.DtoDao;

public class AttachmentDto {
	private int attachmentNo;
	private String attachmentSavename;
	private String attachmentUploadName;
	private String attachmentType;
	private long attachmentSize;
	public AttachmentDto() {
		super();
	}
	public int getAttachmentNo() {
		return attachmentNo;
	}
	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}
	public String getAttachmentSavename() {
		return attachmentSavename;
	}
	public void setAttachmentSavename(String attachmentSavename) {
		this.attachmentSavename = attachmentSavename;
	}
	public String getAttachmentUploadName() {
		return attachmentUploadName;
	}
	public void setAttachmentUploadName(String attachmentUploadName) {
		this.attachmentUploadName = attachmentUploadName;
	}
	public String getAttachmentType() {
		return attachmentType;
	}
	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}
	public long getAttachmentSize() {
		return attachmentSize;
	}
	public void setAttachmentSize(long attachmentSize) {
		this.attachmentSize = attachmentSize;
	}
	
	
}
