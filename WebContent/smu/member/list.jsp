<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����Ϻ���</title>
<script>
function allchkbox(chk){
	var allchk = chk.checked; 
		document.getElementsByName("mailchk").forEach
		(function(item,index){
			if(allchk)	
				item.setAttribute("checked",true);
			else	
				item.removeAttribute("checked");
		})
}

</script>
</head>
<body>
<form action="mailform.me" method="post">
<table class="w3-table-all w3-border"><caption>ȸ�� ���</caption>
	<tr class="w3-blue"><th>���̵�</th><th>����</th><th>�̸�</th>
	<th>����</th><th>��ȭ</th><th>�̸���</th><th>&nbsp;</th>
	<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th>
	</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td><a href="info.me?id=${m.id}">${m.id}</a></td>
				<td><img src="picture/sm_${m.picture}" width="20" height="30"></td>
				<td>${m.name}</td><td>${m.gender==1?"��":"��"}</td>
				<td>${m.tel}</td>
				<td>${m.email}</td>
				<td><a href="updateForm.me?id=${m.id}">[����]</a>
					<c:if test="${ m.id != 'admin'}">
						<a href="deleteForm.me?id=${m.id}">[����Ż��]</a>
					</c:if>
				</td>
				<td><input type="checkbox" name="mailchk" value="${m.email}"></td>
			</tr>
		</c:forEach>
		<tr><td colspan="8" class="w3-center">
			<input type="submit" value="��������"></td></tr>
</table>
</form>
</body>
</html>
