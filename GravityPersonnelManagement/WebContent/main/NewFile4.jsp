<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/test1";

String _id = (String)session.getAttribute("id");

try{
	Class.forName(jdbc_driver);
	
	conn = DriverManager.getConnection(jdbc_url, "root", "cl7668ju");

String sql = "SELECT id, name, grade, mail, phone FROM student ORDER BY id asc";

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="../colorblocks/styles.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그래비티</title>
<script>
function CheckForm(form) {
	if(!form.inputid.value) {
		alert('학번을 입력하세요.');
		form.id.focus();
		return true;
	}
	if(!form.inputname.value) {
		alert('이름을 입력하세요.');
		form.inputname.focus();
		return true;
	}
	if(!form.inputgrade.value) {
		alert('학년을 입력하세요.');
		form.inputgrade.focus();
		return true;
	}
	if(!form.inputmail.value) {
		alert('메일을 입력하세요.');
		form.inputmail.focus();
		return true;
	}
	if(!form.inputphone.value) {
		alert('전화번호를 입력하세요.');
		form.inputphone.focus();
		return true;
	}
	form.submit();
	}
</script>
</head>
<body>
<center><IMG src="../colorblocks/images/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/NewFile.jsp')"></center>
<br>

<center>관리자모드
<%
if(_id != null){
%>
on
<%
}
%>
</center>
<br>
<table align=center width=500 height= 50>
<tr align=center>
<td>학번</td><td>이름</td><td>학년</td><td>메일</td><td>전화번호</td>
</tr>
<%
while(rs.next()){
	int id = rs.getInt("id");
	String name = rs.getString("name");
	int grade = rs.getInt("grade");
	String mail = rs.getString("mail");
	String phone = rs.getString("phone");
%>
<tr align=center>
<td align=center><A href="../main/NewFile5.jsp?no=<%=id%>"><%=id%></A></td>
<td align=center><%=name%></td>
<td align=center><%=grade%></td>
<td align=center><%=mail%></td>
<td align=center><%=phone%></td>
</tr>
<%
}
%>

</table>
<br>
<form name=form4 action=../main/NewFile6.jsp method=post>
<table align=center width=500 height= 50>
<tr>
<td>
<input type=text size=15 name="inputid">
</td>
<td>
<input type=text size=15 name="inputname">
</td>
<td>
<input type=text size=15 name="inputgrade">
</td>
<td>
<input type=text size=15 name="inputmail">
</td>
<td>
<input type=text size=15 name="inputphone">
</td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td align="right"><input type="button" value="인원 추가" onClick="javascript:CheckForm(form4)" style=cursor:hand></td>
</tr>
</table>
</form>
<%
}
catch(SQLException e){
	System.out.print(e);
}finally{
	rs.close();
	pstmt.close();
	conn.close();
}
%>
<br>
<form name=form3 action=../main/NewFile2.jsp method=post>
<table align=center>
<tr>
<td>
<select name="option">
<option selected>id</option>
<option>name</option>
<option>grade</option>
</select>
</td>
<td>
<input type=text name="a1">
</td>
<td>
<input type=submit value="검색" name="search">
</td>
</tr>
</table>
</form>
</body>
</html>