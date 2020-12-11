<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
<script type="text/javascript">
	function inputcheck(f){
		if(f.pass.value==""){
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_passchg(){
		var op = "width=500, height=250, left=50, top=150";
		open("passwordForm.me","",op);
	}
	function win_upload(){
		var op = "width=500, height=500, left=50, top=150";
		open("pictureForm.me","",op);
	}
</script>
</head>
<body>
<form action="update.me" name="f" method="post" onsubmit="return inputcheck(this)">
 <input type="hidden" name="picture" value="${mem.picture}">
  <table class="w3-table-all"><caption>ȸ�� ���� ����</caption>
  <tr><td rowspan="4" valign="bottom">
    <img src="picture/${mem.picture}" width="100" height="120" id="pic"><br>
    <font size="1"><a href="javascript:win_upload()" class="w3-center">��������</a></font>
    </td><th>���̵�</th><td><input type="text" name="id" readonly value="${mem.id}"></td></tr>
    <tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
    <tr><th>�̸�</th><td><input type="text" name="name" value="${mem.name}"></td></tr>
    <tr><th>����</th><td><input type="radio" name="gender" value="1" ${mem.gender==1?"checked":""}>��
    					<input type="radio" name="gender" value="2" ${mem.gender==2?"checked":""}>��</td></tr>
    <tr><th>��ȭ��ȣ</th><td colspan="2"><input type="text" name="tel" value="${mem.tel}"></td></tr>
  	<tr><th>�̸���</th><td colspan="2"><input type="text" name="email" value="${mem.email}"></td></tr>
  	<tr><td colspan="3" class="w3-center"><input type="submit" value="ȸ������">
  			<c:if test="${sessionScope.login !='admin' || param.id =='admin'}">
  						<input type="button" value="��й�ȣ����" onclick="win_passchg()">
  			</c:if>
 		</td></tr>
  </table>
</form>
</body>
</html>
