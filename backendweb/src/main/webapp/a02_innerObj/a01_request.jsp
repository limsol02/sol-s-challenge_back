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
# request기본 객체
1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
2. 주요 기능
	1) 클라이언트(웹 브라우저)와 관련된 정보 읽기 기능
	2) 서버와 관련된 정보 읽기 기능
	3) 클라이언트가 전송한 요청 파라미터 읽기 기능
	4) 클라이언트가 전송한 쿠기 읽기 기능
	5) 속성 처리 기능
3. 요청관련 주요 정보 처리 메서드
	1) getRemoteAddr() 
		웹 서버에 연결한 클라이언트의 ip 주소를 구한다. 게시판이나
		방명록 등에서 글 작성의 ip주소가 자동으로 입력되기도 하는데,
		이 때 입력되는 ip주소가 바로 이 메서드를 사용하여 구한 것이다.
	2) getMethod() 
		웹 브라우저가 정보를 전송할 때 사용한 방식을 구한다.
		form의 method="get/post"
	3) getRequestURI()
		웹 브라우저가 요청한 url에서 경로를 구한다.
	4) getContextPath()
		jsp페이지가 속한 웹 어플리케이션의 컨텍스트 경로를 구한다.
	5) getServerName()
		연결할 때 사용한 서버 이름을 구한다.
	5) getServerPort()
		서버가 실행중인 포트 번호를 구한다.

 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
el을 이용해서 contextpath를 설정했기때문에
모든 webapp하위를 기준으로 모든 자원들을 호출하여 처리할 수 있다..
 --%>
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
  <h2 data-toggle="modal" data-target="#exampleModalCenter">
  	클라이언트 정보</h2>

</div>
<div class="container">
   <table class="table table-hover table-striped">
   	<col width="50%">
   	<col width="50%">
   	<%-- http://192.168.10.99:7080/backendweb/a02_innerObj/a01_request.jsp 
   		cmd/ipconfig로 본인 ip 주소 확인하고 위 실행한 주소에 localhost대신
   		입력후, 옆사람에게 전달, 확인..
   	--%>
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
	</table>  


	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
  
    
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