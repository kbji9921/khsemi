package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//Dao : 영속성(persistant) 항목을 접근하는 객체. 영원히 변하지 않는 것들을 관리(DB, File)
public class AttachmentDao {

	// 저장 위치를 지정
	public static final String path = System.getProperty("user.home") + "/upload";

	// 등록: 번호 생성 + 등록
	// 시퀀스 생성
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select attachment_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");

		con.close();

		return number;
	}

	// 등록
	public void insert(AttachmentDto attachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into attachment (attachment_no, attachment_uploadname, attachment_savename, attachment_type, attachment_size) "
				+ " values (?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, attachmentDto.getAttachmentNo());
		ps.setString(2, attachmentDto.getAttachmentUploadName());
		ps.setString(3, attachmentDto.getAttachmentSavename());
		ps.setString(4, attachmentDto.getAttachmentType());
		ps.setLong(5, attachmentDto.getAttachmentSize());

		ps.execute();

		con.close();
	}

	// 조회
	public AttachmentDto selectOne(int attachmentNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from attachment where attachment_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, attachmentNo);
		ResultSet rs = ps.executeQuery();
		AttachmentDto attachmentDto = new AttachmentDto();
		if (rs.next()) {

			attachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			attachmentDto.setAttachmentUploadName(rs.getString("attachment_uploadname"));
			attachmentDto.setAttachmentSavename(rs.getString("attachment_savename"));
			attachmentDto.setAttachmentType(rs.getString("attachment_type"));
			attachmentDto.setAttachmentSize(rs.getLong("attachment_size"));

		} else {
			attachmentDto = null;
		}
		con.close();
		return attachmentDto;
	}
	// 조회
		public String selectName(int attachmentNo) throws Exception {
			Connection con = JdbcUtils.getConnection();
			String sql = "select attachment_savename from attachment where attachment_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, attachmentNo);
			ResultSet rs = ps.executeQuery();
			String attachmentSavename;
			if (rs.next()) {

				attachmentSavename =rs.getString("attachment_savename");

			} else {
				attachmentSavename = null;
			}
			con.close();
			return attachmentSavename;
		}
		
	

	// 수정
	public boolean update(AttachmentDto attachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "update attachment set attachment_uploadname=?, attachment_savename=?, attachment_type=?,"
				+ "attachment_size=? where attachment_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, attachmentDto.getAttachmentUploadName());
		ps.setString(2, attachmentDto.getAttachmentSavename());
		ps.setString(3, attachmentDto.getAttachmentType());
		ps.setLong(4, attachmentDto.getAttachmentSize());
		ps.setInt(5, attachmentDto.getAttachmentNo());

		int count = ps.executeUpdate();

		con.close();

		return count > 0;
	}

	public boolean delete(int attachmentNo) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "delete  from attachment where attachment_no= ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, attachmentNo);
		int count = ps.executeUpdate();

		con.close();

		return count > 0;

	}
	public List<AttachmentDto> selectTrainer(TrainerAttachmentDto trainerAttachmentDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from attachment where attachment_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, trainerAttachmentDto.getAttachmentNo());
		ResultSet rs = ps.executeQuery();
		
		List<AttachmentDto> list = new ArrayList<>();
		while(rs.next()) {
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			attachmentDto.setAttachmentUploadName(rs.getString("attachment_uploadname"));
			attachmentDto.setAttachmentSavename(rs.getString("attachment_savename"));
			attachmentDto.setAttachmentType(rs.getString("attachment_type"));
			attachmentDto.setAttachmentSize(rs.getLong("attachment_size"));
			
			list.add(attachmentDto);
		}
		
		con.close();
		
		return list;
	}

}
