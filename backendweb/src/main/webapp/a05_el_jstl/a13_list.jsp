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
  <h2>List 데이터 처리..</h2>

</div>
<%-- 
		
--%>
<%
List<String> cities = Arrays.asList("서울","뉴욕","런던");
request.setAttribute("cities", cities);
// ex) 9개의 점심메뉴를 3X3테이블로 출력하세요 위 List와  <c:if>문 활용
List<String> lunchs = Arrays.asList("짜장면","뽂음밥","라면에 밥",
			                        "김밥","우동","스파게티",
			                        "돈까스","오징어덮밥","된장찌개");
request.setAttribute("lunchs", lunchs);
%>
<div class="container">
	<c:set var="rCnt" value="${Math.floor(Math.random()*9+1)}"/>
   <h2 align="center">오늘의 메뉴</h2>
   <table class="table table-hover table-striped">
   	<col width="33%"><col width="34%"><col width="33%">
    <tbody>
    	<c:forEach var="lunch" items="${lunchs}" varStatus="sts">
    	    <c:if test="${sts.count%3==1}"><tr></c:if>
    			<td style="background:${sts.count==rCnt?'pink':''}">
    				${lunch}</td>
    		<c:if test="${sts.count%3==0}"></tr></c:if>
    	</c:forEach>
    </tbody>
	</table>  

   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
    <tbody>
    	<c:forEach var="city" items="${cities}" varStatus="sts">
    	<tr><td>${sts.count}</td><td>${city}</td></tr>
    	</c:forEach>
    </tbody>
	</table>  
  
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>