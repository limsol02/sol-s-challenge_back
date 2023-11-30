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
      <%-- 
      a03_includeParamAction.jsp
      
    a04_main.jsp 요청값으로 전달할 내용 좋아하는 음악 
      request 객체로 전달할 내용을 Product 객체생성(물건명, 가격, 객체)
      session 객체로 전달할 도서명
    a05_sub.jsp
      위내용을 출력처리..  
      --%>   
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>포함된 include action 파일</h2>
<h3>요청값 처리 : <%=request.getParameter("name") %></h3>
<h3>요청값 처리 : ${param.age}</h3>
<h3>요청범위 데이터 처리 : ${requestScope.loc}</h3>
<h3>페이지범위 데이터 처리 : ${pname}</h3>
<h3>세션버위 데이터 처리 : ${price}</h3>

</div>
</body>
</html>