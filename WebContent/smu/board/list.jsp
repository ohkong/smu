<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<script type="text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>
<body>
<form action="list.do" method="post" name="sf">
	<div style="display : flex; justify-content : center;">
		<input type="hidden" name="pageNum" value="1">
		<select name="column">
			<option value="">�����ϼ���</option>
			<option value="subject">����</option>
			<option value="name">�ۼ���</option>
			<option value="content">����</option>
			<option value="subject,name">����+�ۼ���</option>
			<option value="subject,content">����+����</option>
			<option value="name,content">�ۼ���+����</option>
			<option value="subject,name,content">����+�ۼ���+����</option>
		</select>
	<script>document.sf.column.value="${param.column}";</script>
	<input type="text" name="find" value="${param.find}" style="width:50%;">
	<input type="submit" value="�˻�">
	</div>
</form>
<table class="w3-table-all"><caption>�Խ��� ���</caption>
<c:if test="${boardcount ==0}">
   <tr><td colspan = "5">��ϵ� �Խñ��� �����ϴ�.</td></tr>
</c:if>
<c:if test="${boardcount >0}">
   <tr><td colspan = "5" style = "text-align:right">�� ����:${boardcount}</td></tr>
   <tr><th width = "8%">��ȣ</th><th width="50%">����</th>
      <th width="14%">�ۼ���</th><th width="17%">�����</th>
      <th width="11%">��ȸ��</th></tr>
<c:forEach var="b" items="${list}">
   <tr><td>${boardnum}</td>
   <c:set var="boardnum" value="${boardnum-1}"/>
      <td style = "text-align:left">
      <c:if test="${!empty b.file1}">
      <a href ="file/${b.file1 }"
      style="text-decoration:none;">@</a>
      </c:if>
      <c:if test="${empty b.file1}">&nbsp;&nbsp;&nbsp;</c:if>
     <c:if test="${b.grplevel >0 }">
        <c:forEach var="i" begin="1" end="${b.grplevel}">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>��</c:if>
         <a href="info.do?num=${b.num}">${b.subject}</a></td>
      <td>${b.name}</td><td>
      <fmt:formatDate var="rdate" value="${b.regdate}"
               pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss"/>
               </c:if>
               <c:if test="${today != rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd HH:mm"/>
               </c:if></td>
      <td>${b.readcnt}</td></tr> 
   </c:forEach>
   <tr><td colspan = "5" class="w3-center"><%-- ������ ó���ϱ� --%>
      <c:if test="${pageNum <= 1 }">[����]</c:if>
      <c:if test="${pageNum > 1 }">
      <a href="javascript:listdo(${pageNum -1})">[����]</a></c:if>
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
         <c:if test="${a==pageNum}">[${a}]</c:if>
         <c:if test="${a!=pageNum}">
         <a href = "javascript:listdo(${a})">[${a}]</a></c:if>
      </c:forEach>
      <c:if test="${pageNum >= maxpage }">[����]</c:if>
      <c:if test="${pageNum < maxpage }">
      <a href="javascript:listdo(${pageNum +1})">[����]</a>
      </c:if>
      </td></tr>
   </c:if>
   <tr><td colspan = "5" style="text-align:right">
      <a href = "writeForm.do">[�۾���]</a></td></tr>
</table>
</body>
</html>  