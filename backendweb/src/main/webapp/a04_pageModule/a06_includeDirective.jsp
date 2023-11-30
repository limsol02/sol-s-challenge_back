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
   $(document).ready(function(){
      <%-- 
      
      --%>   
   });
</script>
</head>
<%--
# include directive
1. 코드 차원에서 포함
	결국은 하나의 파일로 컴파일 되어서 실행처리된다.

2. 기본형식
	<%@ include file="포함할파일"%>
	
3. 활용
	1) 모든 jsp페이지에서 사용되는 변수 지정
		위에서 아래로 흐름 순서로 변수를 인식할 수 있다.
	
	2) 실용예시 : 저작권 표시와 같은 간단하면서 모든 페이지에 중복되는 문장 활용 
 --%>
<body>
<div class="jumbotron text-center">
  <h2>include directive 연습</h2>
	<h3>내용 include</h3>
	<h4>@@@</h4>
	<%@ include file="a07_subPage.jsp" %>
	<h3>이름 : <%=name %></h3>
	<h3>나이 : <%=age %></h3>
	<h3>지역 : <%=loc %></h3>
</div>
<%--
ex) a08_main.jsp (포함할 페이지) / a09_comm.jsp (포함될 페이지)
a09에서 선언된 자바변수 물건명, 가격, 갯수 
		js 함수 call()선언 하고 및 기본 화면을..
a08에서 호출하여 처리할 수 있도록 하세요
 --%>
</body>
</html>