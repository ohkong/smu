<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ �Է�</title>
<script type="text/javascript">
	function inputcheck(f){
		if(f.pass.value==""){
			alert("��й�ȣ�� �Է��ϼ���")
			f.pass.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="delete.me" method="post" onsubmit="return inputcheck(this)">
	<input type="hidden" name="id" value="${param.id}">
		<table class="w3-table-all"><caption>ȸ����й�ȣ �Է�</caption>
		<tr><th>��й�ȣ</th><td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2" class="w3-center"><input type="submit" value="Ż���ϱ�"/></td></tr>
	</table>
</form>
</body>
</html>