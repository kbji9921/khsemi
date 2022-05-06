package semi.servlet.DtoDao;

import java.sql.Connection;
import java.sql.DriverManager;




public class JdbcUtils {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.116:1521:xe","user1","user1234");
		
		return con;
		
	}
	
	
//private static DataSource src;
//	
//	static {//static 초기화 구문
//		
//		try {
//			//1. 자원 탐색 도구를 생성
//			Context ctx = new InitialContext();
//			
//			//2. 자원 탐색 도구를 이용하여 등록된 자원 중 name="jdbc/oracle"인 Resource를 찾도록 지시
//			src = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
//			
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//		
//	}
//	

	
//private static DataSource src;
//	
//	static {//static 초기화 구문
//		
//		try {
//			//1. 자원 탐색 도구를 생성
//			Context ctx = new InitialContext();
//			
//			//2. 자원 탐색 도구를 이용하여 등록된 자원 중 name="jdbc/oracle"인 Resource를 찾도록 지시
//			src = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
//			
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}
}
	

