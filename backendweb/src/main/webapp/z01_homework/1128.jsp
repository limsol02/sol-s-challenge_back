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
[1단계:개념] 1. request객체가 가지고 있는 서버전송 정보 메서드의 기능에 대하여 출력하세요
==> 
1) getRemoteAddr() : 웹서버에 연결한 클라이언트의 ip주소를 구합니다.
2) getMethod() : 웹 브라우저가 정보를 전송할 때 사용한 방식을 구합니다.
3) getRequestURI() : 웹 브랑우저가 요청한 url에서 경로를 구합니다.
4) getContextpath() : jsp페이지가 속한 웹 어플리케이션의 context경로를 구합니다.
5) getServername() : 연결할 때 사용한 서버 이름을 구합니다.
6) getServerPort() : 서버가 실행중인 포트 번호를 구합니다.
출력한다고 치면,
<tbody>
      <tr class="table-success text-center"><td>원격주소</td>
          <td><%=request.getRemoteAddr() %></td></tr>
      <tr class="table-success text-center"><td>전송방식</td>
          <td><%=request.getMethod() %></td></tr>
      <tr class="table-success text-center"><td>요청주소</td>
          <td><%=request.getRequestURI() %></td></tr>
      <tr class="table-success text-center"><td>프로젝트context명</td>
          <td><%=request.getContextPath() %></td></tr>
      <tr class="table-success text-center"><td>서버이름</td>
          <td><%=request.getServerName() %></td></tr>
      <tr class="table-success text-center"><td>서버포트</td>
          <td><%=request.getServerPort() %></td></tr>
   </tbody>

형식으로 알아보기 쉽게 표 형식으로 출력할 수 있습니다. 

[1단계:개념] 3. request.getParameterValues()가 일반 type="text"와 type="checkbox"일 때, 간단한 예제로 차이점을 기술하세요.
==> 
type="text" 는 단일 선택으로 request.getParameter()를 이용해 받을수있지만, 
type="checkbox" 는 선택값이 여러개이기 때문에 배열로 받는 request.getParameterValues()를 이용해야 합니다.

<input type="text" name="name"> 로 이름 적어 submit을 통해 제출했다면 요청값은 
String name = request.getParameter("name"); 으로 받아서 초기화 처리하여 사용하면 되고, 

<input type="checkbox" name= "name" value = "홍길동"/>홍길동
<input type="checkbox" name= "name" value = "김길동"/>김길동
<input type="checkbox" name= "name" value = "최길동"/>최길동
로 입력해 submit을통해 제출 시 , 
String []names = request.getParameterValues("name");
처럼 배열로 다중의 값을 받아 for문이나 스트링 버퍼 처리를 하여 값을 출력할 수 있습니다. 
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