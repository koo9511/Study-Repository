<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<html>
<head>
<title>�α��� ������</title>
</head>
<body>
<form name="loginform" action="./MemberLoginAction.me" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>�α��� ������</font></b>
		</td>
	</tr>
	<tr><td>���̵� : </td><td><input type="text" name="MEMBER_ID"/></td></tr>
	<tr><td>��й�ȣ : </td><td><input type="password" name="MEMBER_PW"/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:loginform.submit()">�α���</a>&nbsp;&nbsp;
			<a href="MemberJoin.me">ȸ������</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>