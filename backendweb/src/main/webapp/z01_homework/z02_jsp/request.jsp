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
2) Request Scope 데이터 전달: 하나의 JSP 페이지에서 다른 JSP 페이지로 데이터를 전달하는 과정에서 request 범위를 사용하는 예제를 작성하세요.
		ex) 요청값의 물건가격과 갯수로 전달하고 request범위로 총계를 할당하여, 최종페이지에  총계출력

 --%>
 <%
 request.setAttribute("pname", "사과");
 int cnt = 2;
 request.setAttribute("cnt", cnt);
 int price = 2000;
 request.setAttribute("price", price);
 RequestDispatcher rd = request.getRequestDispatcher("requestShow.jsp");
 rd.forward(request, response);
 %>
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
  
      <%-- 
      [requestShow 페이지 내용]
<div class="jumbotron text-center">
  		<h2>request 요청받은 페이지</h2>
	<h3>물건이름 : ${pname}</h3>
	<h3>가격 : ${price}</h3>
	<h3>갯수 : ${cnt}</h3>
	<h3>총계 : ${price*cnt}</h3>
</div>
      --%>   
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>request 안볼페이지</h2>

</div>

</body>
</html>