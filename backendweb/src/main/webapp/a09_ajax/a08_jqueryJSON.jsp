<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
# ajax에서 json 데이터의 처리
1. 웹프로그램에서는 데이터 전송의 속도 이슈로 많이 개발자들이 고민을 하고 처리해왔다.
2. 초창기에는 text를 그대로 전송해서 처리하거나, 
3. text의 데이터를 구분자를 두어 split() 메서드를 이용해서 처리하거나,
4. html의 코드를 전송해서 화면에 입력하는 형식을 처리
5. xml 형식을 만들어 처리해왔다.
6. 위 같은 방식으로 효과적으로 데이터를 비동기적으로 가져왔는데, 서버와 클라이언트 간의 넷트워크 부하를
	초래하는 등 많은 문제를 야기시켰다.
7. 이 때, 최대한 간단한 형식으로 핵심 데이터를 전달하는 방식을 고안하게 되었는데,
8. 이것이 json형식이다. javascript object notation 형식으로
9. 필요한 핵심 데이터를 전송하고, 그 외 화면구성은 client 단에서 처리하는 방식으로
10. 현재는 가장 많이 활용되는 방식이다.
11. 형식
	{문자속성:"속성값", 숫자속성:속성값, "bool속성":속성값}
	네트웍상에 전송할 수 있는 json 형식
	[ex] {"name":"홍길동", "age":25, "isAult":true} 쌍따옴표 주의!

	[ps] 네트웍상 전송하여 변경할 수 있는 json형식과 일반 js에서 처리할 수 있는 형식에 차이가 있다.
	네트웍상 전송 형식을 포함하여 js에서 {name:'홍길동',age:25}등과 같이 
	속성을 선언하는 방식을 조금 더 유연하게 처리가 가능하게 하고 있다. 
	
12. 위 형식으로 문자열로 전송을 하면, 클라이언트에서 문자열을 객체화하는 eval()이나
	JSON.parse() 를 활용한다. 
	jquery에서는 dataType:"json"을 설정하면 자동으로 객체로 변환하여
	success:function(data){}로 받아들어 처리한다.
	마지막을 객체로 받은 내용을DOM 객체로 호출하여 append(), html(), text()
	메서드를 이용해서 화면에 출력처리한다. 
	
13. json 형식의 유형
	1) 일반 객체
		{속성1:속성값, 속성2:속성2값...}
		ex) var p = {name:"홍길동", age:25, loc:'서울'}
		
	2) 배열형객체
	[
		{속성1:속성1값, 속성2:속성2값...},
		{속성1:속성1값, 속성2:속성2값...},
		{속성1:속성1값, 속성2:속성2값...}
	]

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
	$(document).ready(
			function() {
				$("h2").click(function() {

					$.ajax({
						url : "z08_jsonData.jsp",
						dataType : "text",
						success : function(data) {
							console.log(data)
							console.log(typeof (data))
							// 문자열(String)을 객체화 처리
							var p01 = JSON.parse(data);
							console.log(typeof (p01))
							console.log(p01)
						},
						error : function(err) {
							console.log(err)
						}
					})
				})

				var count = 1;
				$("#btn").click(
						function() {
							//alert($("#frm01").serialize())
							$.ajax({
								url : "z09_jsonProduct.jsp",
								data : $("#frm01").serialize(),
								dataType : "json", // 자동으로 객체형으로 변환되어 처리된다.
								success : function(product) {
									console.log(product)
									console.log(typeof (product))
									//alert("물건명 : "+product.pname)
									var addHtml = ""

									addHtml += "<tr><td>" + (count++)
											+ "</td><td>" + product.pname
											+ "</td><td>" + product.price
											+ "</td><td>" + product.cnt
											+ "</td><td>" + product.total
											+ "</td></tr>"

									$("#t01 tbody").append(addHtml)
									$("#frm01").each(function() {
										this.reset()
									})

									$("[name=pname]").focus()

								},
								error : function(err) {
									console.log(err)
								}
							})
						})
			});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>json 데이터 가져오기</h2>
		<h3>물건정보 로딩</h3>
		<%-- z09_jsonProduct.jsp로 설정.. --%>

	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input class="form-control mr-sm-2" placeholder="물건명" name="pname" />
				<input class="form-control mr-sm-2" placeholder="가격" name="price" />
				<input class="form-control mr-sm-2" placeholder="갯수" name="cnt" />
				<button class="btn btn-info" type="button" id="btn">Search</button>

			</nav>
		</form>
		<table id="t01" class="table table-hover table-striped">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<thead>

				<tr class="table-success text-center">
					<th>번호</th>
					<th>물건명</th>
					<th>가격</th>
					<th>갯수</th>
					<th>총계</th>
				</tr>
			</thead>
			<tbody>

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