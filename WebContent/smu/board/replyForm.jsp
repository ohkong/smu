<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
</head>
<body>
	<form action="reply.do" method="post" name="f">
		<input type="hidden" name="num" value="${b.num}">
		<input type="hidden" name="grp" value="${b.grp}">
		<input type="hidden" name="grplevel" value="${b.grplevel}">
		<input type="hidden" name="grpstep" value="${b.grpstep}">
		<table class="w3-table-all">
			<caption>�Խ��� ��� ���</caption>
			<tr>
				<th>�۾���</th>
				<td><input type="text" name="name" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass" class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="subject"
					value="RE:${b.subject}"  class="w3-input w3-border"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea name="content" id="content1" rows="15" cols="50"></textarea></td>
				<script>CKEDITOR.replace("content1",{
					filebrowserImageUploadUrl : "imgupload.do"
				})</script>
			</tr>
			<tr>
				<td colspan="2" class="w3-center"><a href="javascript:document.f.submit()">[�亯�۵��]</a></td>
			</tr>
		</table>
	</form>
</body>
</html>