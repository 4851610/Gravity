package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Member {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public boolean delete() {
		return true;
	}
}
