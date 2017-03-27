<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    		
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
    	String jdbcUrl = "jdbc:mysql://localhost/test1";
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(jdbcUrl,"root", "cl7668ju");
    	
    	String sql = "DELETE FROM student WHERE id=" + no;
    	pstmt = conn.prepareStatement(sql);
    	pstmt.executeUpdate(sql);
    		
    	out.println("<script languare=\"javascript\">");
    	out.println("alert('삭제 됐습니다.')");
    	out.println("location.href='../main/NewFile4.jsp'");
    	out.println("</script>");
    	out.flush();
    	}catch (SQLException e) {
    		out.print(e);
    	}finally{
    		pstmt.close();
    		conn.close();
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