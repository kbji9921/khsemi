package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ExeciseDao {
	//운동 등록
	public void insert (ExerciseDto exerciseDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into exercise (exercise_name) values (?);";
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setString(1, exerciseDto.getExerciseName());
		ps.execute();
		
		con.close();
	}
}
