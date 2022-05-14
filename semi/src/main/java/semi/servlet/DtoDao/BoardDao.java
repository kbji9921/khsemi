package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	//목록
//	public List<BoardDto> selectList() throws Exception {
//		Connection con = JdbcUtils.getConnection();
//		
//		String sql = "select * from board order by board_no desc";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ResultSet rs = ps.executeQuery();
//		
//		List<BoardDto> list = new ArrayList<>();
//		while(rs.next()) {
//			BoardDto boardDto = new BoardDto();
//			
//			boardDto.setBoardNo(rs.getInt("board_no"));
//			boardDto.setBoardType(rs.getString("board_type"));
//			boardDto.setBoardTitle(rs.getString("board_title"));
//			boardDto.setBoardContent(rs.getString("board_content"));
//			boardDto.setBoardTime(rs.getDate("board_time"));
//			boardDto.setBoardReadCount(rs.getInt("board_readcount"));
//			boardDto.setBoardWriter(rs.getString("board_writer"));
//			
//			list.add(boardDto);
//		}
//		
//		con.close();
//		return list;
//	}
	//페이징-목록
	public List<BoardDto> selectListByPaging(int p,int s) throws Exception {
		int end = p * s;
		int begin = end - (s-1);

		Connection con = JdbcUtils.getConnection();
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from board order by board_no desc"
						+ ")TMP"
					+ ") where rn between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> list = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardType(rs.getString("board_type"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardContent(rs.getString("board_content"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadCount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
			
			list.add(boardDto);
		}
		
		con.close();
		return list;
	}
	
	//페이지네이션 마지막번호 - 목록
		public int countByPaging() throws Exception{
			Connection con = JdbcUtils.getConnection();
			String sql = "select count(*) from board";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			
			con.close();
			return count;
		}
		
	//페이징 - 검색
		public List<BoardDto> selectListByPaging(int p,int s,String type, String keyword) throws Exception {
			int end = p * s;
			int begin = end - (s-1);

			Connection con = JdbcUtils.getConnection();
			String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
								+ "select * from board where instr(#1,?)>0 order by board_no desc"
							+ ")TMP"
						+ ") where rn between ? and ?";
			
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			
			List<BoardDto> list = new ArrayList<>();
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				
				boardDto.setBoardNo(rs.getInt("board_no"));
				boardDto.setBoardType(rs.getString("board_type"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardContent(rs.getString("board_content"));
				boardDto.setBoardTime(rs.getDate("board_time"));
				boardDto.setBoardReadCount(rs.getInt("board_readcount"));
				boardDto.setBoardWriter(rs.getString("board_writer"));
				
				list.add(boardDto);
			}
			
			con.close();
			return list;
		}
		
	//페이지네이션 마지막번호 - 목록
		public int countByPaging(String type, String keyword) throws Exception{
			Connection con = JdbcUtils.getConnection();
			String sql = "select count(*) from board where instr(#1,?) > 0";
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			
			con.close();
			return count;
		}
	
	//유사검색
//	public List<BoardDto> selectList(String type,String keyword) throws Exception{
//		Connection con = JdbcUtils.getConnection();
//		String sql = "select * from board where instr(#1,?)>0 order by board_no desc";
//		sql = sql.replace("#1", type);
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, keyword);
//		ResultSet rs = ps.executeQuery();
//				
//		List<BoardDto> list = new ArrayList<>();
//		while(rs.next()) {
//			BoardDto boardDto = new BoardDto();
//			
//			boardDto.setBoardNo(rs.getInt("board_no"));
//			boardDto.setBoardType(rs.getString("board_type"));
//			boardDto.setBoardTitle(rs.getString("board_title"));
//			boardDto.setBoardContent(rs.getString("board_content"));
//			boardDto.setBoardTime(rs.getDate("board_time"));
//			boardDto.setBoardReadCount(rs.getInt("board_readcount"));
//			boardDto.setBoardWriter(rs.getString("board_writer"));
//			
//			list.add(boardDto);
//		}
//		
//		con.close();
//		return list;
//	}
		
	
		
		
	//상세보기
	public BoardDto selectOne(int boardNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from board where board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
				
		BoardDto boardDto;
		if(rs.next()) {
			boardDto = new BoardDto();
			boardDto.setBoardNo(rs.getInt("board_no"));
			boardDto.setBoardType(rs.getString("board_type"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardContent(rs.getString("board_content"));
			boardDto.setBoardTime(rs.getDate("board_time"));
			boardDto.setBoardReadCount(rs.getInt("board_readcount"));
			boardDto.setBoardWriter(rs.getString("board_writer"));
		}else {
			boardDto = null;
		}
		con.close();
		return boardDto;
	}
	
	//조회수 증가
	public boolean plusReadCount(int boardNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update board set board_readcount = board_readcount+1 where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	//시퀀스 번호 생성(등록)
	public int getSequence() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt(1);
		
		con.close();
		
		return number;
	}
	
	//등록
	public void insert(BoardDto boardDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into board(board_no,board_type,board_title,board_content,board_writer)"
				+ "values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardNo());
		ps.setString(2, boardDto.getBoardType());
		ps.setString(3, boardDto.getBoardTitle());
		ps.setString(4, boardDto.getBoardContent());
		ps.setString(5, boardDto.getBoardWriter());
		ps.execute();
		
		con.close();
	}
	
	//삭제
	public boolean delete(int boardNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete board where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,boardNo);
		int count = ps.executeUpdate();
		con.close();

		return count > 0;
		
	}
	//수정
	public void update(BoardDto boardDto) throws Exception{
//		Connection con = JdbcUtils.getConnection();
//		String sql = "update board set "
		Connection con = JdbcUtils.getConnection();
		String sql = "update board set board_type = ?, board_title = ?, board_content = ? where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardDto.getBoardType());
		ps.setString(2, boardDto.getBoardTitle());
		ps.setString(3, boardDto.getBoardContent());
		ps.setInt(4, boardDto.getBoardNo());
		ps.execute();
		
		con.close();
	}
	
}