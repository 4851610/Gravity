<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/test1";

int inputid = Integer.parseInt(request.getParameter("inputid"));
String inputname = request.getParameter("inputname");
int inputgrade = Integer.parseInt(request.getParameter("inputgrade"));
String inputmail = request.getParameter("inputmail");
String inputphone = request.getParameter("inputphone");

try{
	Class.forName(jdbc_driver);
	
	conn = DriverManager.getConnection(jdbc_url, "root", "cl7668ju");

String sql = "insert into student(id, name, grade, mail, phone) values (?, ?, ?, ?, ?)";

pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, inputid);
pstmt.setString(2, inputname);
pstmt.setInt(3, inputgrade);
pstmt.setString(4, inputmail);
pstmt.setString(5, inputphone);

pstmt.executeUpdate();

response.sendRedirect("../main/NewFile4.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 인원 관리 프로그램</title>
</head>
<body>
<%
}
catch(SQLException e){
	out.print(e);
}
%>
</body>
</html>