<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
1) 피자 주문 시스템: 사용자가 여러 토핑을 선택할 수 있는 체크박스를 사용하여 피자를 주문하는 JSP 페이지를 만드세요. 
각 토핑은 추가 비용을 가지고 있으며, 최종 가격을 계산하여 보여줍니다.
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
		<h2 data-toggle="modal" data-target="#exampleModalCenter">피자 주문</h2>

	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			
			<label>토핑주문 : </label><br>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="pizza" type="checkbox"
					class="form-check-input" value="치즈">치즈(+3000)
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="pizza" type="checkbox"
					class="form-check-input" value="올리브">올리브(+2000)
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="pizza" type="checkbox"
					class="form-check-input" value="햄" >햄(+2500)
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input name="pizza" type="checkbox"
					class="form-check-input" value="새우" >새우(+4000)
				</label>
			</div>
			<br>

			<button class="btn btn-info" type="submit">주문</button>
		</form>
<%
String []pizzas = request.getParameterValues("pizza"); 

StringBuffer sb_pizzas = new StringBuffer();
if(pizzas!=null){
	for(String pizza : pizzas){
	sb_pizzas.append(pizza+" ");
	}
}

int price = 10000;
if(pizzas!=null){
for(String pizza : pizzas){
	switch(pizza){
	case "치즈" : price += 3000 ; break;
	case "올리브" : price += 2000 ; break;
	case "햄" : price += 2500 ; break;
	default : price += 4000 ; break;
	}
}}
%>
		<table class="table table-hover table-striped">
			<col width="50%">
			<col width="50%">
			
			<thead>

				<tr class="table-success text-center">
					<th>추가한토핑</th>
					<th>총액</th>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=sb_pizzas %></td>
					<td><%=price %></td>
					
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