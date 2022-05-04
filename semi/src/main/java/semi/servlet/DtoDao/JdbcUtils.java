package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtils {
//	public static Connection getConnection() throws Exception{
//		Class.forName("oracle.jdbc.OracleDriver");
//		
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","kh","kh");
//		
//		return con;
//		
//	}
//	
	
private static DataSource src;
	
	static {//static 초기화 구문
		
		try {
			//1. 자원 탐색 도구를 생성
			Context ctx = new InitialContext();
			
			//2. 자원 탐색 도구를 이용하여 등록된 자원 중 name="jdbc/oracle"인 Resource를 찾도록 지시
			src = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
//	연결해둔 src를 이용하여 연결을 얻어와서 반환하는 형태로 변경(연결을 더이상 생성하지 않음)
	public static Connection getConnection() throws Exception{
		return src.getConnection();
	}
}
