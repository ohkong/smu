<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록보기</title>
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
<table class="w3-table-all w3-border"><caption>회원 목록</caption>
	<tr class="w3-blue"><th>아이디</th><th>사진</th><th>이름</th>
	<th>성별</th><th>전화</th><th>이메일</th><th>&nbsp;</th>
	<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th>
	</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td><a href="info.me?id=${m.id}">${m.id}</a></td>
				<td><img src="picture/sm_${m.picture}" width="20" height="30"></td>
				<td>${m.name}</td><td>${m.gender==1?"남":"여"}</td>
				<td>${m.tel}</td>
				<td>${m.email}</td>
				<td><a href="updateForm.me?id=${m.id}">[수정]</a>
					<c:if test="${ m.id != 'admin'}">
						<a href="deleteForm.me?id=${m.id}">[강제탈퇴]</a>
					</c:if>
				</td>
				<td><input type="checkbox" name="mailchk" value="${m.email}"></td>
			</tr>
		</c:forEach>
		<tr><td colspan="8" class="w3-center">
			<input type="submit" value="메일전송"></td></tr>
</table>
</form>
</body>
</html>
