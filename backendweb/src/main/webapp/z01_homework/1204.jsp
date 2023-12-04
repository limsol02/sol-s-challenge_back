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
  <h2>타이틀</h2>

</div>
<%-- 
[1단계:개념] 1. c:set을 통하여 일반변수와 객체형 변수의 데이터를 할당하는 기본 형식을 설명하세요
- 기본변수
<c:set var="name(변수명)" value="홍길동(값)" scope="session(스코프선택)"/> 
=> 이렇게 할당하면 ${name} 으로 선언할시, "홍길동"이 출력됩니다.

- 객체변수
<c:set var="p01(변수명)" value='<%=new Person("홍길동",22,"제주")%>' scope="page(원하는 스코프 선택)"/>
로 설정하면 ${p01.name}으로 선언할 시, "홍길동"이 출력됩니다. 

[1단계:개념] 2. 조건문의 형식을 예제에 따라 기술하세요
 
 <inpuy type="text" name="name"/>
 <c:set var="right" value="홍길동이 아닙니다."/>
 <c:if test = "${name == '홍길동'}">
 <c:set var="right" value="홍길동이 맞습니다."/>
 </c:if>
 
 라고 조건문을 설정하고 
 input칸에 이름을 입력하고 submit하면 홍길동의 여부에 따라 해당 메세지가 출력됩니다.

[1단계:확인] 3. 구매금액에 따른 할인율을 c:set으로 설정하여 최종금액을 출력하세요.
div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="금액입력"  class="form-control mr-sm-2" name="price" />
	   
	    <button class="btn btn-info" type="submit">최종금액확인</button>
	    
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="33%">
   
    <thead>
    
      <tr class="table-success text-center">
        <th>입력금액</th>
        <th>할인율</th>
        <th>최종금액</th>
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td>${param.price}</td>
    	<c:set var="discount" value="할인에 해당하는 금액이 아닙니다."/>
    	
    	<c:if test="${param.price>=20000}">
    		<c:set var="discount" value="0.1"/>
    	</c:if>
    	
    	<c:if test="${param.price>=30000}">
    		<c:set var="discount" value="0.2"/>
    	</c:if>
    	
    	<c:if test="${param.price>=40000}">
    		<c:set var="discount" value="0.3"/>
    	</c:if>
    	
    	<td>${discount}</td>
    	<td>${param.price*(1-discount)}</td>
    	</tr>
    	
    </tbody>
	</table>    
    
</div>



[1단계:확인] 4. 설정값이 없을 때, 임의의 1~100사이 숫자를 정하고, 해당 문제에 대한 hint로 크다/적다를 표시하여 최종 맞추었을 때, @@회 정답을 표시하세요~ 
		c:set, c:choose c:if문 활용.		
		
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="숫자입력"  class="form-control mr-sm-2" name="num" />
	   
	    <button class="btn btn-info" type="submit" >확인</button>
	    
 	</nav>
	</form>
	



<table class="table table-hover table-striped">
    <col width="33%">
    <col width="33%">
    <col width="33%">

    <thead>
        <tr class="table-success text-center">
            <th>힌트</th>
            <th>횟수</th>
            <th>입력한 숫자</th>
        </tr>
    </thead>
<%
    if (session == null || session.getAttribute("ranNum") == null || session.getAttribute("ranNum").equals("")){
    	int ranNum = (int)(Math.random() * 100) + 1;
        session.setAttribute("ranNum", ranNum);
        session.setAttribute("count", 0); %>
  
   

    <tbody>
        <tr>
            <c:set var="a01" value="숫자를 입력하세요" />

            <c:if test="${param.num > ranNum}">
                <c:set var="a01" value="입력하신 숫자가 더 큽니다." />
                <%=session.setAttribute("count", ++count) %>
            </c:if>

            <c:if test="${param.num < ranNum}">
                <c:set var="a01" value="입력하신 숫자가 더 작습니다." />
            </c:if>

            <c:if test="${param.num == ranNum}">
                <c:set var="a01" value="입력하신 숫자와 동일합니다." />
                <c:set var="answer" value="${ranNum}" />
            </c:if>

            <td>${a01}</td>
            <td>${challenge}</td>
            <td>${ranNum}</td>
        </tr>
    </tbody>
</table>		
--%>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="숫자입력"  class="form-control mr-sm-2" name="num" />
	   
	    <button class="btn btn-info" type="submit" >확인</button>
	    
 	</nav>
	</form>
	



<table class="table table-hover table-striped">
    <col width="33%">
    <col width="33%">
    <col width="33%">

    <thead>
        <tr class="table-success text-center">
            <th>힌트</th>
            <th>횟수</th>
            <th>입력한 숫자</th>
        </tr>
    </thead>
<%
    if (session == null || session.getAttribute("ranNum") == null || session.getAttribute("ranNum").equals("")){
    	int ranNum = (int)(Math.random() * 100) + 1;
        session.setAttribute("ranNum", ranNum);
        session.setAttribute("count", 0); }%>
  
   

    <tbody>
        <tr>
            <c:set var="a01" value="숫자를 입력하세요" />

            <c:if test="${param.num > ranNum}">
                <c:set var="a01" value="입력하신 숫자가 더 큽니다." />
               
            </c:if>

            <c:if test="${param.num < ranNum}">
                <c:set var="a01" value="입력하신 숫자가 더 작습니다." />
            </c:if>

            <c:if test="${param.num == ranNum}">
                <c:set var="a01" value="입력하신 숫자와 동일합니다." />
                <c:set var="answer" value="${ranNum}" />
            </c:if>

            <td>${a01}</td>
            <td>${challenge}</td>
            <td>${ranNum}</td>
        </tr>
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