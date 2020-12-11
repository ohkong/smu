<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title><decorator:title /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>
<decorator:head />
<script type="text/javascript"
	src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Top container -->
<div class="w3-bar w3-top w3-hover-grey" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" 
  						onclick="w3_open();"><i class="fa fa-bars"></i>Menu</button>
  <span class="w3-bar-item w3-right">
  <c:if test="${empty sessionScope.login}">
  	<a href="${path}/smu/member/loginForm.me">�α���</a>
  	<a href="${path}/smu/member/joinForm.me">ȸ������</a>
  </c:if>
  <c:if test="${!empty sessionScope.login}">
  	${sessionScope.login}���� �α��� �ϼ̽��ϴ�.&nbsp;&nbsp;
  	<a href="${path}/smu/member/logout.me">�α׾ƿ�</a>
  </c:if>
  </span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-light-grey w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="${path}/smu/member/picture/${sessionScope.picture}" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
     <c:if test="${!empty sessionScope.login}">
    <img src="${sessionScope.picture}" style="width:45%;" class="w3-round">
    </c:if>
    <c:if test="${empty sessionScope.login}">
      <img src="" class="w3-round" style="width:45%">
      </c:if>
      <div class="w3-wide s8 w3-bar">
      <c:if test="${!empty sessionScope.login}">
      <span>Welcome, <strong>${sessionScope.login}</strong></span>
      </c:if>
       <c:if test="${empty sessionScope.login}">
      <span><strong>�α����ϼ���</strong></span>
      </c:if>
      <br>
    </div>
    <br><br>
   <div class="w3-wide">
    <h5>Dashboard</h5>
  	</div>
  </div>
  <div class="w3-bar-block">
    <a href="${path}/smu/member/main.me" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>ȸ������</a> 
     <a href="" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>&nbsp; ��������</a>
    <a href="${path}/smu/board/list.do" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>�����Խ���</a> 
    <a href="" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-snapchat fa-fw w3-margin-right"></i>>&nbsp; �ڷ��</a>
  </div>
  
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" 
	style="cursor:pointer" title="close side menu" id="myOverlay">
	
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-pale-green" style="margin-left:300px">

  <!-- Header -->
  <header id="portfolio">
  <div class="w3-container">
    <h1><b></b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
      
    </div>
    </div>
  </header>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <decorator:body />
    </div>
  </div>

  <!-- Footer -->
  <footer class="w3-container w3-padding-32">
 
  </footer>
  
  <div class="w3-pale-green w3-hover-pale-red w3-center w3-padding-24">....</div>

<!-- End page content -->
</div>

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>
