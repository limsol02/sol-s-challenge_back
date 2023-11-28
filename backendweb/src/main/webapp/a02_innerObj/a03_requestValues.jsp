<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


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
		<h2 data-toggle="modal" data-target="#exampleModalCenter">물건과 배송지 처리</h2>

	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<div class="form-group">
				<label for="usr">물건명등록 : </label> 
					<input name="pname" type="text" class="form-control" placeholder="물건명1 등록"> 
					<input name="pname" type="text" class="form-control" placeholder="물건명2 등록"> 
					<input name="pname" type="text" class="form-control" placeholder="물건명3 등록">
			</div>
			<label>지 역:</label><br>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="loc" type="checkbox"
					class="form-check-input" value="서울">서울
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="loc" type="checkbox"
					class="form-check-input" value="경기">경기
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="loc" type="checkbox"
					class="form-check-input" value="강원" >강원
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="loc" type="checkbox"
					class="form-check-input" value="제주" >제주
				</label>
			</div>
			<br>

			<button class="btn btn-info" type="submit">등록</button>
		</form>
<%
String []pnames = request.getParameterValues("pname"); 

String []locs = request.getParameterValues("loc"); 

StringBuffer sb_names = new StringBuffer();
StringBuffer sb_locs = new StringBuffer();
if(pnames!=null){
	for(String name : pnames){
	sb_names.append(name+" ");
	}
}
if(locs!=null){
	for(String loc : locs){
		sb_locs.append(loc +" ");
	}
}
%>
		<table class="table table-hover table-striped">
			<col width="50%">
			<col width="50%">
			
			<thead>

				<tr class="table-success text-center">
					<th>물건명</th>
					<th>지역</th>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=sb_names %></td>
					<td><%=sb_locs %></td>
					
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