package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	/**
	 * 연결을 위한 메소드
	 * */
	public static Connection getConnection() {
		Connection conn = null;
		
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/test1?useUnicode=true&characterEncoding=utf8";
		
		try {
			Class.forName(jdbc_driver); 
			conn = DriverManager.getConnection(jdbc_url,"root","cl7668ju");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 사용한 db객체 닫기
	 * */
	public static void dbClose(Connection conn, Statement st, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (st != null) {
				st.close();
				st = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
