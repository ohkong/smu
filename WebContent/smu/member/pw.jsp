<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>passwordã��</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<tr>
			<th>��й�ȣ</th>
			<td>**${fn:substring(pass,2,pass.length())}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="�ݱ�"
				onclick="self.close()"></td>
		</tr>
	</table>
</body>
</html>
