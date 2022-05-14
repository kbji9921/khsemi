package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardReplyDao {
	//목록
	public List<BoardReplyDto> selectList(int boardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reply where board_no = ? order by reply_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		
		List<BoardReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardReplyDto boardReplyDto = new BoardReplyDto();
			boardReplyDto.setReplyNo(rs.getInt("reply_no"));
			boardReplyDto.setBoardNo(rs.getInt("board_no"));
			boardReplyDto.setReplyContent(rs.getString("reply_content"));
			boardReplyDto.setReplyTime(rs.getDate("reply_time"));
			boardReplyDto.setReplyWriter(rs.getString("reply_writer"));
			
			list.add(boardReplyDto);
		}
		
		con.close();
		return list;
	}
	//등록(시퀀스 생성)
	public int getSequence() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select reply_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt(1);
		
		con.close();
		
		return number;
	}
	//등록
	public void insert(BoardReplyDto boardReplyDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into reply(reply_no, board_no, reply_content, reply_writer)"
				+ "values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardReplyDto.getReplyNo());
		ps.setInt(2, boardReplyDto.getBoardNo());
		ps.setString(3, boardReplyDto.getReplyContent());
		ps.setString(4, boardReplyDto.getReplyWriter());
		ps.execute();
		
		con.close();
	}
	
	//삭제
	public boolean delete(int ReplyNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete reply where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,ReplyNo);
		int count = ps.executeUpdate();
		con.close();

		return count > 0;
		
	}
}
