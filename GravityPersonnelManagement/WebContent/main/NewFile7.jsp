<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
Connection conn = null;
PreparedStatement pstmt = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/test1";

int no = Integer.parseInt(request.getParameter("no"));
String name = request.getParameter("name");
int grade = Integer.parseInt(request.getParameter("grade"));
String mail = request.getParameter("mail");
String phone = request.getParameter("phone");

try{
	Class.forName(jdbc_driver);
	
	conn = DriverManager.getConnection(jdbc_url, "root", "cl7668ju");

	String sql = "UPDATE student SET id='"+no+"', name='"+name+"', grade="+grade+", mail='"+mail+"', phone='"+phone+"' where id = '"+ no + "'";

	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	out.println("<script languare=\"javascript\">");
	out.println("alert('정보가 수정되었습니다.')");
	out.println("location.href='../main/NewFile4.jsp'");
	out.println("</script>");
	out.flush();

	pstmt.close();
	conn.close();
}catch(Exception e){
	System.out.println(e);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그래비티</title>
</head>
<body>

</body>
</html>