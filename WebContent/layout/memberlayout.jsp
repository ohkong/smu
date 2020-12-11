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
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<decorator:head />
</head>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>Menu</button>
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
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
    <c:if test="${!empty sessionScope.login}">
      <img src="${path}/smu/member/picture/${sessionScope.picture}" class="w3-circle w3-margin-right" style="width:46px">
      </c:if>
      <c:if test="${empty sessionScope.login}">
      <img src="" class="w3-circle w3-margin-right" style="width:46px">
      </c:if>
    </div>
    <div class="w3-col s8 w3-bar">
      <c:if test="${!empty sessionScope.login}">
      <span>Welcome, <strong>${sessionScope.login}</strong></span>
      </c:if>
       <c:if test="${empty sessionScope.login}">
      <span><strong>�α����ϼ���</strong></span>
      </c:if>
      <br>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Menu</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>Close Menu</a>
    <a href="${path}/smu/member/main.me" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>&nbsp; ȸ������</a>
    <a href="" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>&nbsp; ��������</a>
    <a href="${path}/smu/board/list.do" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>&nbsp; �����Խ���</a>
    <a href="" class="w3-bar-item w3-button w3-padding"><i class="fa fa-share-alt fa-fw"></i>&nbsp; �ڷ��</a>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" 
			style="cursor:pointer" title="close side menu" id="myOverlay">
			
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
   </header>

	<div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-padding-16">
        <div class="w3-container w3-border w3-border-white w3-padding-16">
      </div>
      </div>
    </div>
    <div class="w3-quarter">
    	<div class="w3-container w3-padding-16">
          <div class="w3-container w3-border w3-border-white w3-padding-16">
      	  </div>
      </div>
     </div>
    </div>
  <hr>
  
  <div class="w3-container">
  <decorator:body />
  </div>
  <hr>
  <br>
  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
  
  </footer>

  <!-- End page content -->
  <div>
  <div class="w3-light-grey w3-center w3-padding-24">....</div>
</div>
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

</body>
</html>
