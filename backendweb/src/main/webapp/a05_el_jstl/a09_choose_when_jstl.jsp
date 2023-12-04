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
# choose when 구문
1. jstl에서는 if else if 구문이 없다.
2. 그 기능을 대체하여 choose when구문이 지원된다.
3. 기본형식
	<c:choose>
		<c:when test="${조건1}">
			조건1에 해당하는 내용</c:when>
		<c:when test="${조건2}">
			조건1을 재외하고 조건2에 해당하는 내용</c:when>
		<c:when test="${조건3}">
			나열된 조건을 제외하고 조건3에 해당하는 내용</c:when>
		<c:other>
			위 나열된 조건이 아닐때, </c:other>
	</c:choose>

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
      
      --%>   
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2"  name="point" placeholder="점수를 입력하세요" />
       <button class="btn btn-info" type="submit" >점수확인</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="50%">
      <col width="50%">
    <thead>
    
      <tr class="table-success text-center">
        <th>점수</th>
        <th>학점</th>
        
      </tr>
    </thead>   
    <tbody>
       <tr>
       <td>${param.point }</td>
       <td>
       	<c:choose >
       		<c:when test="${param.point>=90 }">A등급</c:when>
       		<c:when test="${param.point>=80 }">B등급</c:when>
       		<c:when test="${param.point>=70 }">C등급</c:when>
       		<c:when test="${param.point>=60 }">D등급</c:when>
       		<c:otherwise>F등급</c:otherwise>
       	</c:choose>
       </td>
       </tr>
       
    </tbody>
   </table>    
    <%--
    a10_choose_exp.jsp
    구매물품 가격 갯수를 입력하여 총 구매금액에 따른 고객등급을 출력하세영
    3 미만 : 일반 고객 / 3~10 : VIP고객 / 10초과 : MVP고객출력
     --%>
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