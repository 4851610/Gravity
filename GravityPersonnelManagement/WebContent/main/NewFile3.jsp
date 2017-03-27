<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder"%>
<%
String _id = request.getParameter("id");
String pw = request.getParameter("pw");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="../colorblocks/styles.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
	if( (_id.equals("admin")) && (pw.equals("1234")) ) {
		session.setAttribute("id", _id);
		session.setAttribute("pw", pw);
		
		out.println("<script languare=\"javascript\">");
		out.println("alert('로그인에 성공하였습니다.')");
		out.println("location.href='../main/NewFile4.jsp'");
		out.println("</script>");
		out.flush();

	} else{
		
		out.println("<script languare=\"javascript\">");
		out.println("alert('권한이 없습니다.')");
		out.println("history.back()");
		out.println("</script>");
		out.flush();
	}
%>

</body>
</html>