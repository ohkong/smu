<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<script type="text/javascript">
	function inputcheck(f){
		if(f.id.value == ''){
			alert("���̵� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.id.value.length<4){
			alert("���̵�� 4�ڸ� �̻� �Է��ϼ���");
			f.id.focus();
			return false;
		}
		if(f.pass.value == ''){
			alert("��й�ȣ�� �Է��ϼ���");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page) {
		var op = "width=500, height=350, left=50, top=150";
		open(page+".me","",op);
	}
</script>
</head>
<body>
<form action="login.me" method="post" name="f" onsubmit="return inputcheck(this)">
<table class="w3-table-all"><caption>�α���</caption>
<tr><th>���̵�</th><td><input type="text" name="id"></td></tr>
<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
	<input type="submit" value="�α���">
	<input type="button" value="ȸ������" onclick="location.href='joinForm.me'">
	<input type="button" value="���̵�ã��" onclick="win_open('idForm')">
	<input type="button" value="��й�ȣã��" onclick="win_open('pwForm')">
</table>
</form>
</body>
</html>