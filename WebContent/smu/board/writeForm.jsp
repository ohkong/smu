<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
<script type="text/javascript">
function inputcheck() {
	f = document.f;
	if(f.name.value=="") {
		alert("�۾��̸� �Է��ϼ���");
		f.name.focus();
		return;
	}
	if(f.pass.value=="") {
		alert("��й�ȣ�� �Է��ϼ���");
		f.pass.focus();
		return;
	}
	if(f.subject.value=="") {
		alert("������ �Է��ϼ���");
		f.subject.focus();
		return;
	}
	f.submit();
}
</script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<table class="w3-table-all"><caption>�Խ��� �۾���</caption>
<tr><td>�۾���</td><td><input type="text" name="name" class="w3-input w3-border"></td></tr>
<tr><td>��й�ȣ</td><td><input type="password" name="pass" class="w3-input w3-border"></td></tr>
<tr><td>����</td><td><input type="text" name="subject" class="w3-input w3-border"></td></tr>
<tr><td>����</td><td><textarea rows="15" name="content"  id="content1" class="w3-input w3-border"></textarea></td></tr>
<script>CKEDITOR.replace("content1",{
	filebrowserImageUploadUrl : "imgupload.do"
})</script>
<tr><td>÷������</td><td><input type="file" name="file1"></td></tr>
<tr><td colspan="2" class="w3-center"><a href="javascript:inputcheck()">[�Խù����]</a></td></tr>
</table>
</form>
</body>
</html>