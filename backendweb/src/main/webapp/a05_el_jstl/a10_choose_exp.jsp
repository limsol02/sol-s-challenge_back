<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
    <%--
    a10_choose_exp.jsp
    	구매물품  가격  갯수를 입력하여 총구매금액에 따른 
    		고객등급을 출력하세요
    		3미만 : 일반 고객
    		3~10 : VIP 고객
    		10초과 : MVP 고객 출력..
    		
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
	$(document).ready(function(){
	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>고객등급</h2>

</div>
<%-- 
    	구매물품  가격  갯수를 입력하여 총구매금액에 따른 
    		고객등급을 출력하세요
    		3미만 : 일반 고객
    		3~10 : VIP 고객
    		10초과 : MVP 고객 출력..		
--%>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="물품명입력" name="pname"  class="form-control mr-sm-2" />
	    <input placeholder="가격입력" name="price"  class="form-control mr-sm-2"/>
	    <input placeholder="갯수입력" name="cnt"  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">확인</button>
 	</nav>
	</form>
	<c:set var="tot" value="${param.price*param.cnt}"/>
	<c:set var="grade" value="가격과 갯수를 입력하세요"/>
	<c:if test="${not empty param.price and not empty param.cnt }">
		<c:choose>
			<c:when test="${tot>100000}">
				<c:set var="grade" value="MVP"/></c:when>
			<c:when test="${tot>=30000}">
				<c:set var="grade" value="VIP"/></c:when>
			<c:otherwise><c:set var="grade" value="일반고객"/></c:otherwise>
		</c:choose>
	</c:if>
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
    <thead>
      <tr class="table-success text-center">
        <th>물건명</th>
        <th>총계</th>
        <th>고객등급</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td>${param.pname}</td><td>${tot}</td>
    		<td>${grade}</td></tr>
    </tbody>
	</table>    
</div>
</body>
</html>