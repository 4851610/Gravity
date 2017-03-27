<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link href="../colorblocks/styles.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 인원 관리 프로그램</title>
</head>
<body>
<center><IMG src="../colorblocks/images/main.jpg" style='cursor:pointer' onClick="javascript:location.replace('../main/NewFile.jsp')"></center>
<br>
<center>관리자 로그인</center>
<br>
<form name=form2 action=../main/NewFile3.jsp method=post>
<table align=center width=300 cellspacing=1>
<tr align=center>
<td width=70 align=center>아이디</td>
<td><input type=text name="id" size=15 maxlength=15></td>
</tr>

<tr align=center>
<td width=70 align=center>패스워드</td>
<td><input type=password name="pw" size=16 maxlength=15></td>
<tr>
<td></td>
<td align=right>
<input type = "submit" value="확인">&nbsp;&nbsp;
</td>
</tr>
</table>
</form>
</body>
</html>