<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>idã��</title>
<script type="text/javascript">
	function idsend(id){
		opener.document.f.id.value=id;
		self.close();
	}
</script>
</head>
<body>
<table class="w3-table-all">
	<tr><th>���̵�</th><td>${fn:substring(id,0,id.length()-2)}**</td></tr>
	<tr><td colspan="2"><input type="button" value="���̵�����" 
	onclick="idsend('${fn:substring(id,0,id.length()-2)}')"></td></tr>
</table>
</body>
</html>
