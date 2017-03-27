package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBUtil;

public class MemberDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	ArrayList<Member> list = new ArrayList<Member>();
	
	/**
	 * 그래비티 가입 목록
	 * */
	public ArrayList<Member> list() {
		conn = DBUtil.getConnection();
		sql = "SELECT id, name, grade, mail, phone FROM student ORDER BY id asc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int grade = rs.getInt("grade");
				String mail = rs.getString("mail");
				String phone = rs.getString("phone");
				
				Member m = new Member(id, name, grade, mail, phone);
				
				list.add(m);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	/**
	 * 가입 학생정보 삭제
	 * */
	public boolean delete() {
		return true;
	}
}
