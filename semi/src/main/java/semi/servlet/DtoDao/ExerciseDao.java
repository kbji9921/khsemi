package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ExerciseDao {
	//운동 등록
	public void insert (ExerciseDto exerciseDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into exercise (exercise_name) values (?);";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, exerciseDto.getExerciseName());
		ps.execute();
		
		con.close();
	}
	//운동 상세조회
	public ExerciseDto selectOne(String exerciseName) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from exercise where exercise_name=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, exerciseName);
		ResultSet rs = ps.executeQuery();
		
		ExerciseDto exerciseDto;
		if(rs.next()) {
			exerciseDto = new ExerciseDto();
			exerciseDto.setExerciseName(rs.getString("exercise_name"));
		}
		else {
			exerciseDto = null;
		}
		
		con.close();
		
		return exerciseDto;
	}
	//운동종목 전체조회
	public List<ExerciseDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from exercise";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<ExerciseDto> list = new ArrayList<>();
		while(rs.next()) {
			ExerciseDto exerciseDto = new ExerciseDto();
			exerciseDto.setExerciseName(rs.getString("exercise_name"));
			
			list.add(exerciseDto);
		}
		
		con.close();
		
		return list;
	}
}
