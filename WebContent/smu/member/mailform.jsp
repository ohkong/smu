<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���Ϻ�����</title>
<script type="text/javascript">
	function idinputchk(f){
		if(f.naverid.value == ""){
			alert("���̹� ���̵� �Է��ϼ���");
			f.naverid.focus();
			return false;
		}
		if(f.naverpw.value == ""){
			alert("���̹� ��й�ȣ�� �Է��ϼ���");
			f.naverpw.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<h2>���Ϻ�����</h2>
<form name="mailform" method="post" action="mail.me"
		onsubmit="return idinputchk(this)">
  ���γ��̹�ID : <input type="text" name="naverid">
  ���γ��̹���й�ȣ : <input type="password" name="naverpw">
<table class="w3-table-all">
	<tr><td>�޴»��</td>
		<td><input type="text" name="recipient" size="100" value=
			'<c:forEach items="${list}" var="mail">${mail},</c:forEach>'></td></tr>
	<tr><td>����</td><td><input type="text" name="title" size="100"></td></tr>
	<tr><td>�޽�������</td>
		<td><select name="mtype">
			<option value="text/html; charset=EUC-KR">HTML</option>
			<option value="text/plain; charset=EUC-KR">TEXT</option>
			</select></td></tr>
	<tr><td colspan="2">
		<textarea name="contents" cols="120" rows="10"></textarea></td></tr>
	<tr><td colspan="2" class="w3-center"><input type="submit" value="���Ϻ�����"></td></tr>
</table>
</form>
</body>
</html>