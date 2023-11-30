<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
# 내장 객체
1. session scope 관련 객체
	jsp에서는 변수/객체를 저장하는 시간적 범위를 추가하여 저장할 수 있다.
	이것을 session scope에 의한 저장이라고 한다.
	[int, double, String, Person] ==> 크기과 유형 
	쉽게 말하면, 브라우저(클라이언트)/웹 서버-톰캣(서버)과의 관계에서
	위 데이터를 임시로 어느 범위까지 저장하느냐를 처리해주는 것을 말한다.
	각, 범위에 대하여 jsp 내장객체로 저장처리를 설정하게 해준다.
	
	1) pageContext : 페이지 설정 범위
		-> 해당 페이지에서만 사용가능(자바클래스 처럼 그 페이지에서만 사용가능)
	
	2) request : 요청값 처리
		-> 요청값을 처리하는 범위까지 사용하는 주로 forward 기능메서드로 처리된 범위를 말한다.
		-> forward 기능메서드 = request,response를 함께 전달하는 메서드.
		[ex] A.jsp에서 request범위로 데이터 저장한 후, 
			forward()로 B.jsp를 호출하면 해당 페이지에서 request범위로 
			설정한 데이터는 사용가능하다.
		==> MVC패턴에 모델 데이터로 설정해서 처리할 때, 주로 사용..
		
	3) session : session 설정 범위
		-> 같은 웹 브라우저와 웹 서버가 연결되어 있을 때, 데이터를 저장하는 범위를 말하는데, 
			이 범위는 둘 중에 하나가 연결을 끊는 순간 사라진다.
		[ex] A.jsp 에서 세션으로 저장한 경우
			같은 브라우저가 띄워져 있고, 서버도 실행되어 있는 순간
			다른 어떤 페이지로 이동 하더라도 저장된 데이터를 가져올 수 있다. 
	
	4) application : 어플리케이션 즉, 웹 서버 설정범위
		-> 브라우저 상관없이 웹서버가 재가동하지 않는 한 저장되는 범위를 말한다.
		
	# 기본형식
	XXXX.setAttribute("key",값(변수/객체)); -> 저장
	XXXX.getAttribute("key"); -> 가져오기

2. 기타객체
	1) out : jsp페이지가 생성하는 결과를 출력할 때, 사용되는 출력 스트림 객체
	2) config : jsp 페이지에 대한 설정 정보를 저장한다.
	3) exception : 예외객체, 에러 페이지에서만 사용된다.

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
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
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