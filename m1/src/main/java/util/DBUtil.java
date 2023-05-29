package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public Connection getConnection() throws Exception {
		
		// DB설정
		String driver = "org.mariadb.jdbc.Driver";
		String dbUrl = "jdbc:mariadb://127.0.0.1:3306/m1";
		String dbUser = "root"; 
		String dbpw = "java1234";
		Class.forName(driver);
		Connection conn = null;
		conn = DriverManager.getConnection(dbUrl, dbUser, dbpw);
		
		return conn;
	}
}
