<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
[1단계:개념] 1. ajax의 동기처리 기본형식을 예제를 통해서 설명하세요

[동기]
$(document).ready(function(){
	var xhr = new XMLHttpRequest();
	xhr.open("get","z01_data.jsp",false) ==> 비동기가 true
	xhr.send();
	alert(xhr.responseText)
})

[비동기]
$(document).ready(function(){
	var xhr = new XMLHttpRequest();
	xhr.open("get","z01_data.jsp",true)
	xhr.onreadystate = function(){ ==> 비동기방식에는 이벤트 핸들러 함수가 추가된다.
		if(xhr.status==200 && xhr.readyState==4){
			alert(xhr.responseText)
		}
	}
	xhr.send();
})


[1단계:개념] 2. ajax의 동기와 비동기의 개념적 차이점과 js에서 코드부분의 차이점을 기술하세요.

동기방식은 처리하라고 시키는 동안 다른처리를 할 수 없고, 
비동기 방식은 처리하라고 시켜놓고 이벤트 핸들러 함수에게 맡겨놓은 다음 다른 처리를 할 수 있습니다.
[동기]
$(document).ready(function(){
	var xhr = new XMLHttpRequest();
	xhr.open("get","z01_data.jsp",false) ==> 비동기가 true
	xhr.send();
	alert(xhr.responseText)
})

[비동기]
$(document).ready(function(){
	var xhr = new XMLHttpRequest();
	xhr.open("get","z01_data.jsp",true)
	xhr.onreadystate = function(){ ==> 비동기방식에는 이벤트 핸들러 함수가 추가된다.
		if(xhr.status==200 && xhr.readyState==4){
			alert(xhr.responseText)
		}
	}
	xhr.send();
})
코드에서는 true 와 false 부분에 차이가 나고
이벤트 핸들러 함수 차이의 유무가 있습니다. 

[1단계:확인] 3. ajax를 동기형식으로 data.jsp에서 물품리스트(사과,바나나,딸기)를 처리하여, 물건리스트호출시, 서버에 있는 물품리스트를 가져오는 처리하세요.

[z01_data.jsp : 사과,바나나,딸기]	
	
	$(document).ready(function() {
		$("h2").click(function() {
			var xhr = new XMLHttpRequest();
			xhr.open("get", "z01_data.jsp", false);
			xhr.send()

			var pnames = xhr.responseText.split(",")

			var addHtml = ""

			pnames.forEach(function(pname, idx) {
				console.log(idx + ":" + pname)
				addHtml += "<tr>"
				addHtml += "<td>" + (idx + 1) + "</td>"
				addHtml += "<td>" + pname + "</td>"
				addHtml += "</tr>"
			})

			$("tbody").append(addHtml)
		})

	});



[1단계:확인] 4. ajax를 비동기형식으로 요청값을 도서명, 가격, 할인율를 넘기면 결과값으로 해당 도서명과 할인율에 따른 계를 alert()창으로 가져오는 처리를 하세요.

[z01_data.jsp : <tr><td>${param.bname}</td><td>${param.price}</td><td>${param.discount}</td><td>${param.price*(1-param.discount)}</td></tr>]

<script type="text/javascript">
	$(document).ready(function() {
		$("#sch").click(function() {
			var xhr = new XMLHttpRequest();
			
			var bname = $("[name=bname]").val();
			console.log("1번 : "+bname)
			
			var price = $("[name=price]").val();
			console.log("2번 : "+price)
			
			var discount = $("[name=discount]").val();
			console.log("3번 : "+discount)
			
			xhr.open("get","z01_data.jsp?bname="+bname+"&price="+price+"&discount="+discount,true)
			
			xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	                console.log("4번 : " + xhr.responseText)
	                $("tbody").append(xhr.responseText)
	            }
	        }
			console.log("끝!")
			xhr.send();
		})

	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>1211과제</h2>

	</div>
	
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="책이름" name="bname" class="form-control mr-sm-2" />
				 <input placeholder="가격" name="price" class="form-control mr-sm-2" />
				 <input placeholder="할인율" name="discount" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="button" id="sch">Search</button>
				
			</nav>
		</form>
		<table class="table table-hover table-striped">

			<thead>

				<tr class="table-success text-center">
					<th>책이름</th>
					<th>가격</th>
					<th>할인율</th>
					<th>총액</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				
			</tbody>
		</table>

[1단계:개념] 5. jquery ajax의 기본형식을 기술하세요.
$(document).ready(function(){
	$.ajax({
		url:"z01_data.jsp", ==> 보내서 처리할 자원위치
		type:"get", 
		dataType:"text",
		data:$("form").serialize(), ==> form 처리
		success:function(data){
			alert(data)
		},
		error:function(err){
			console.log(err)
		}
	})
})


[1단계:확인] 6. jquery ajax로 입력한 선수의 이름과 타석과 안타를 서버에서 요청결과로 @@@의 타율을 @@를 화면에 출력되게 하세요.

[z01_data.jsp : <tr><td>${param.player}</td><td>${param.game}</td><td>${param.hit}</td><td>${param.hit/param.game}</td></tr>]

$(document).ready(function() {
		$("#sch").click(function() {
			$.ajax({
				url:"z01_data.jsp",
				data:$("form").serialize(),
				dataType:"text",
				type:"get",
				success:function(data){
					$("tbody").append(data)
				},
				error:function(err){
					console.log(err)
				}
			})
		})

	});
	
<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="선수이름" name="player" class="form-control mr-sm-2" />
				 <input placeholder="타석" name="game" class="form-control mr-sm-2" />
				 <input placeholder="안타수" name="hit" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="button" id="sch">Search</button>
				
			</nav>
		</form>
		<table class="table table-hover table-striped">

			<thead>

				<tr class="table-success text-center">
					<th>선수이름</th>
					<th>타석</th>
					<th>안타수</th>
					<th>타율</th>

				</tr>
			</thead>
			<tbody>
				
				
			</tbody>
		</table>



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
		$("#sch").click(function() {
			$.ajax({
				url:"z01_data.jsp",
				data:$("form").serialize(),
				dataType:"text",
				type:"get",
				success:function(data){
					$("tbody").append(data)
				},
				error:function(err){
					console.log(err)
				}
			})
		})

	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>1211과제</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="선수이름" name="player" class="form-control mr-sm-2" />
				 <input placeholder="타석" name="game" class="form-control mr-sm-2" />
				 <input placeholder="안타수" name="hit" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="button" id="sch">Search</button>
				
			</nav>
		</form>
		<table class="table table-hover table-striped">

			<thead>

				<tr class="table-success text-center">
					<th>선수이름</th>
					<th>타석</th>
					<th>안타수</th>
					<th>타율</th>

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