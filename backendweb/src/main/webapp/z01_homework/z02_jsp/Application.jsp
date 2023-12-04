<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
4) Application Scope의 공유 데이터: 웹 애플리케이션의 모든 사용자에게 공유되는 설정 정보를 application 범위로 관리하는 예제를 작성하세요.
 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
   td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
  
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>Application</h2>
 <%
application.setAttribute("language","korean");
 %>
<h3 onclick="location.href='applicationShow.jsp'">언어설정확인</h3>

<%--
<h2>언어확인</h2>
<h2>기본언어설정 : ${language}</h2>
 --%>

</div>
<div class="container">
   
    
</div>
</body>
</html>