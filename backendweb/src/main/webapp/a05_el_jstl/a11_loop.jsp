<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
# jstl을 활용한 반복문 처리
1. jstl은 el과 함께 반복구문을 처리하는 기능 태그를 지원하고 있다.
2. 기본 형식
	<c:forEach var="변수" items="${배열/리스트형식 컬랙션}" begin="시작번호" end="마지막번호" 
	step="증감단위" varStatus="컬렉션변수사용변수">
	${변수}
	</c:forEach>
	
3. varStatus 속성
	1) varStatus는 forEach 구문에 속성으로
	2) 기본사용형식
		varStatus = "속성"
		변수명.속성
		으로 여러 속정을 가지고 있다.
	3) 속성값
		index : ${변수명.index}로 배열의 0부터 실행되는 index를 출력해준다
		begin : 시작 속성 // end : 마지막 속성 // step : 중/감속성을 출력
		first : boolean값으로 첫번째 실행할 경우 true
				즉, 해당 배열의 첫번째 데이터일 때만 true로 리턴한다.
		last : 현재 실행이 루프의 마지막일 경우 true
		current : 컬렉션 중 현재 루프에서 사용할 객체

 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style>
td {
	text-align: center;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
<%-- 
      
      --%>
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>jstl을 활용한 반복문 처리</h2>
		<c:forEach var="cnt" begin="1" end="10" step="1">
			<h3>${cnt}번째안녕하세용</h3>
		</c:forEach>

	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input class="form-control mr-sm-2" placeholder="제목" /> <input
					class="form-control mr-sm-2" placeholder="내용" />
				<button class="btn btn-info" type="submit">Search</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
			</nav>
		</form>
		<table class="table table-hover table-striped">
			<col width="100%">

			<thead>

				<tr class="table-success text-center">
					<th>번호</th>

				</tr>
			</thead>
			<%-- <tbody>
				<tr>
				<td>
					<c:forEach var="num" begin="2" end="20" step="2">
						${num}
					</c:forEach>
					</td>
				</tr>
			</tbody>--%>
		</table>
		
		<%-- 
		<%
		pageContext.setAttribute("rainbow", new String[] { "red", "orange", "yellow", "green", "blue", "navy", "purple" });
		%>
		<c:set var="rainbow2"
			value="${['red', 'orange', 'yellow', 'green', 'blue', 'navy', 'purple']}" />
		<table class="table table-hover table-striped">
			<col width="100%">
			<tbody>
				<c:forEach var="color" items="${rainbow2}" varStatus="sts">
					<tr style="background:${color};">
						<td>${sts.count}</td>
					</tr>
					<tr>
						<td>${color}</td>
					</tr>
				</c:forEach>
			</tbody>

			<tbody>
				<c:forEach var="color" items="${rainbow}" varStatus="sts">
					<tr>
						<td>${sts.count}</td>
					</tr>
					<tr>
						<td>${color}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>--%>
		<h2>varStatus 속성확인</h2>
 <table class="table table-hover table-striped">
     
    <thead>
    
      <tr class="table-success text-center">
        <th>var</th>
        <th>index</th>
        <th>count</th>
        <th>begin/end/step</th>
        <th>first</th>
        <th>last</th>
        <th>current</th>
      </tr>
    </thead>   
    <%
    	request.setAttribute("games", new String[]{"가위","바위","보"});
    %>
    <tbody>
    <c:forEach var="game" items="${games}" varStatus="sts">
       <tr>
       <td>${game}</td>
       <td>${sts.index}</td>
       <td>${sts.count}</td>
       <td>${sts.begin}/${sts.end}/${sts.step}</td>
       <td>${sts.first}</td>
       <td>${sts.last}</td>
       <td>${sts.current}</td>
       </tr>
     </c:forEach>  
    </tbody>
   </table>    		
   
   
   <table class="table table-hover table-striped">
     
    <thead>
    
      <tr class="table-success text-center">
        <th>var</th>
        <th>index</th>
        <th>count</th>
        <th>begin/end/step</th>
        <th>first</th>
        <th>last</th>
        <th>current</th>
      </tr>
    </thead>   
    <%
    	
    %>
    <tbody>
    <c:forEach var="cnt" begin="1" end="10" step="2" varStatus="sts">
       <tr>
       <td>${cnt}</td>
       <td>${sts.index}</td>
       <td>${sts.count}</td>
       <td>${sts.begin}/${sts.end}/${sts.step}</td>
       <td>${sts.first}</td>
       <td>${sts.last}</td>
       <td>${sts.current}</td>
       </tr>
     </c:forEach>  
    </tbody>
   </table>    		
		
	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				< class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="frm02" class="form" method="post">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" placeholder="사원명 입력"
								name="ename">
						</div>
						<div class="col">
							<input type="text" class="form-control" placeholder="직책명 입력"
								name="job">
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