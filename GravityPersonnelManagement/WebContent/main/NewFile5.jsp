<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://localhost/test1";

int no = Integer.parseInt(request.getParameter("no"));
String name=null;
int grade = 0;
String mail=null;
String phone=null;

try{
	Class.forName(jdbc_driver);
	
	conn = DriverManager.getConnection(jdbc_url, "root", "cl7668ju");

String sql = "SELECT id, name, grade, mail, phone FROM student where id = '" + no+"'";

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
	if(!form.id.value) {
		alert('학번을 입력하세요.');
		form.id.focus();
		return true;
	}
	if(!form.name.value) {
		alert('이름을 입력하세요.');
		form.name.focus();
		return true;
	}
	if(!form.grade.value) {
		alert('학년을 입력하세요.');
		form.grade.focus();
		return true;
	}
	if(!form.mail.value) {
		alert('메일을 입력하세요.');
		form.mail.focus();
		return true;
	}
	if(!form.phone.value) {
		alert('전화번호를 입력하세요.');
		form.phone.focus();
		return true;
	}
	form.submit();
	}
</script>
</head>
<body>
<center><IMG src="../colorblocks/images/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/NewFile.jsp')"></center>
<br>
<center>학생 정보 조회</center>
<br>

<%
while(rs.next()){
	int id = rs.getInt("id");
	name = rs.getString("name");
	grade = rs.getInt("grade");
	mail = rs.getString("mail");
	phone = rs.getString("phone");
%>

<form name="form5" method=post action="NewFile7.jsp?no=<%=id%>">
<table align=center width=500 height= 50>
<tr align=center>
<td>학번</td>
<td align=center><input type=text name="id" size=50 value='<%=id%>'></td>
</tr>
<tr align=center>
<td>이름</td>
<td align=center><input type=text name="name" size=50 value='<%=name%>'></td>
</tr>
<tr align=center>
<td>학년</td>
<td align=center><input type=text name="grade" size=50 value='<%=grade%>'></td>
</tr>
<tr align=center>
<td>메일</td>
<td align=center><input type=text name="mail" size=50 value='<%=mail%>'></td>
</tr>
<tr align=center>
<td>전화번호</td>
<td align=center><input type=text name="phone" size=50 value='<%=phone%>'></td>
</tr>
</table>
</form>
<table align=center>
<tr>
<td></td>
<td align=right>
<input type="button" value="수정" name="change" onClick="javascript:CheckForm(form5)" style=cursor:hand>
<input type=submit value="삭제" name="delete" onClick="javascript:location.replace('NewFile8.jsp?no=<%=id%>')">
<input type=submit value="취소" name="cancel" onClick="javascript:location.replace('NewFile4.jsp')">
</td>
</tr>
</table>
<%
}
%>

<%
}
catch(Exception e){
	System.out.println(e);
}finally{
	rs.close();
	pstmt.close();
	conn.close();
}
%>
</body>
</html>