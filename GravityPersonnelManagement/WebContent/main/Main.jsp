<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="member.Member"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.util.ArrayList"%>
<%
	MemberDAO mdao = new MemberDAO();
	ArrayList<Member> list = mdao.list();

	String _id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/stylesheet.css" rel="stylesheet" type="text/css">
<title>그래비티</title>
</head>
<body>
	<IMG src="../images/main.jpg" id="mainImg"
		onClick="javascript:location.replace('../main/Main.jsp')">
	<br>
	<%
		if (_id != null) {
	%>
	<a href="../main/NewFile4.jsp">관리자모드 </a>
	<%
		} else {
	%>
	<a href="../main/NewFile1.jsp">관리자모드 </a>
	<%
		}
	%>
	<br>
	<table align=center width=500 height=50>
		<tr align=center>
			<td>학번</td>
			<td>이름</td>
			<td>학년</td>
			<td>메일</td>
			<td>전화번호</td>
		</tr>
		<%
			for (Member m : list) {
		%>
		<tr align=center>
			<td align=center><%=m.getId()%></td>
			<td align=center><%=m.getName()%></td>
			<td align=center><%=m.getGrade()%></td>
			<td align=center><%=m.getMail()%></td>
			<td align=center><%=m.getPhone()%></td>
		</tr>
		<%
			}
		%>
	</table>

	<br>
	<form name=form1 action=../main/NewFile2.jsp method=post>
		<table align=center>
			<tr>
				<td><select name="option">
						<option selected>id</option>
						<option>name</option>
						<option>grade</option>
				</select></td>
				<td><input type=text name="a1"></td>
				<td><input type=submit value="검색" name="search"></td>
			</tr>
		</table>
	</form>
</body>
</html>