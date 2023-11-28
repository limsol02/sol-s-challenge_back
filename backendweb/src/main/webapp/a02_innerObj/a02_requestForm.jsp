<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
# request 요청값 처리 기능 메서드
1. String name = request.getParameter("요청값");
	이름이 요청키인 파라미터의 값을 구한다. 존재하지 않을 경우 null을 리턴한다.
	
2. String [] names = request.getParameterValues("다중의 요청키")
	이름이 다중의요청키(요청키가 동일한 이름으로 여러개)인 모든 파라미터의 값을 배열로
	구한다. 존재하지 않을 경우 null을 리턴한다.

3. Eumeraiont enum = request.getParameterNames();
	웹 브라우저가 전송한 파라미터 전체 이름을 가져온다.
	
4. Map map01 = request.getParameterMap();
	웹 브라우저가 전송한 파라미터의 맵을 구한다. 맵은 <파라미터이름, 값> 쌍으로 구성된다. 
	
# 실행 후, 요청값을 아래와 같이 처리
a02_requestForm.jsp?name=홍길동&name=김길동&name=신길동
a02_requestForm.jsp?name=홍길동
 --%>
<%
String[] names = request.getParameterValues("name");
log("### 매개변수 객체 : " + names);
if (names != null)
	for (String name : names) {
		log("### 매개변수 배열 값 : " + name);
	}
%>
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
		<h2 data-toggle="modal" data-target="#exampleModalCenter">등록할 회원 명단</h2>
		<%
		if (names != null) {
			for (int idx = 0; idx < names.length; idx++) {
		%>
		<h3><%=idx + 1%>번째 이름 : <%=names[idx]%></h3>
		<%
		}
		} else {
		%>
		<h3>데이터 없음(요청값x)</h3>
		<%
		}
		%>

	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input name="name" class="form-control mr-sm-2" placeholder="이름입력" />
				<input name="name" class="form-control mr-sm-2" placeholder="이름입력" />
				<input name="name" class="form-control mr-sm-2" placeholder="이름입력" />
				<input name="name" class="form-control mr-sm-2" placeholder="이름입력" />
				<input name="name" class="form-control mr-sm-2" placeholder="이름입력" />
				<button class="btn btn-info" type="submit">입력</button>
			</nav>
		</form>
		
		<form id="frm02" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark text-white">
				<%--
				# form의 type이 checkbox 인 것은
				요청값을 배열데이터가 checked가 된 것만 value 값 기준으로 전송이된다.
				 --%>
			
				<input type="checkbox" name="name" value="홍길동" class="form-control mr-sm-2"/>홍길동
				<input type="checkbox" name="name" value="김길동" class="form-control mr-sm-2"/>김길동
				<input type="checkbox" name="name" value="신길동" class="form-control mr-sm-2"/>신길동
				<input type="checkbox" name="name" value="마길동" class="form-control mr-sm-2"/>마길동
				<button class="btn btn-info" type="submit">입력</button>
				<%--
				ex) a03_requestValues.jsp 만들고
				form 하위에
				text로 등록한 물건명을 여러개 등록할 수 있게 하고
				checkbox로 배송할 지역을 서울, 경기, 강원, 충정, 전라, 경상, 제주
				로 처리해서 전송할 수 있게 하세요.
				 --%>
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
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>

	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
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
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>