<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
[1단계:개념] 1. json이란 무엇인지? 회원기준으로 객체를 선언하고, 설명하세요

var member = {mno:1, name:"홍길동", id:"himan", pwd:"7777", auth:"admin", point:1000}
이런식으로 속성과 그에 맞는 속성값을 한번에 여러개 적어 편리하게 사용할 수 있습니다. 

[1단계:개념] 2. json 형식에서 일반 js에서의 선언과 네트웍상 전송시 형식의 차이점을 기술하세요

1) 선언 차이점
[json]
{"name": "John",
  "age": 30,
  "city": "New York"}

[JavaScript 객체]
let person = {
  name: "John",
  age: 30,
  city: "New York"};
JSON은 문자열 키에 ""를 사용해아하지만, JavaScript 객체에서는 ""를 사용하지 않아도 됩니다.

2) 네트웍상 전송시 형식 차이점(???)
일반 js에서는 '',"" 두가지 다 사용가능하지만 네트워크 전송시에는 ""만 사용 할 수 있습니다. 

[1단계:개념] 3. 문자열 json를 객체형으로 변환해주는 방식이 3가지 언급하였다. 
각각 기본 예제를 기준으로 메서드를 기술하세요.

1.eval()
var jsonString = '{"no": 1, "name": "홍길동", "id": "himan"}';
var json = eval('(' + jsonString + ')');

2.JSON.parse() 
var jsonString = '{"no": 1, "name": "홍길동", "id": "himan"}';
var json = JSON.parse(jsonString);

3.dataType:"json"
$.ajax({
	url:"z01_data.jsp",
	data:$("#frm01").serialize(),
	dataType:"json",
	success:function(data){console.log(data)},
	error:function(err){console.log(err)},
})

[1단계:확인] 4. jquery ajax를 이용하여  z10_json.jsp(좋아하는 커피종류, 가격, 판매위치)를 지정하고, 호출하여 출력하세요

#z01_data.jsp#
{"cname":"아메리카노","price":1600,"loc":"학원바로뒤 메머드"}

$(document).ready(function(){
		$.ajax({
			url:"z01_data.jsp",
			dataType:"json",
			success:function(data){
				alert("커피이름 : "+data.cname+"\n 가격 : "+data.price+"\n 위치 :"+data.loc)
			},
			error:function(err){
				console.log(err)
			}
		})
	});

[1단계:확인] 5. jquery ajax를 이용하여  form형식으 매개변수를 전달(도서명,출판사)하여 z11_json.jsp(도서명, 출판사)를 처리하고, 
		하단에 테이블형식으로 추가되게 하세요
		
#z01_data.jsp#
{"bname":"${param.bname}","publish":"${param.publish}"}

var cnt = 1;
	$(document).ready(
			function() {
				$("#insBtn").click(
						function() {
							$.ajax({
								url : "z01_data.jsp",
								dataType : "json",
								data : $("form").serialize(),
								success : function(data) {
									var row = ""
									row += "<tr><td>" + (cnt++) + "</td><td>"
											+ data.bname + "</td><td>"
											+ data.publish + "</td></tr>"
									$("tbody").append(row)
								},
								error : function(err) {
									console.log(err)
								}
							})
						})

			});

[2단계:확인] 6. [전공자/도전마인드]dao(MemberDao/Member getMember(int mno)를 활용하여 입력한 사원번호를 통해 사원정보를 가져오는 처리를 z12_memJson.jsp에 하고,
		해당, json데이터를 가져와서 화면에 출력하게 하세요.
	
#z01_data.jsp#		
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="backendweb.d01_dao.MemberDao"/>
<jsp:useBean id="mem" class="backendweb.z01_vo.Member"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:setProperty name="mem" property="*"/>
<c:set var="m01" value="${dao.getMember(param.mno)}"/>
<tr>
<td>${m01.mno}</td>
<td>${m01.name}</td>
<td>${m01.id}</td>
<td>${m01.pwd}</td>
<td>${m01.auth}</td>
<td>${m01.point}</td>
</tr>


$(document).ready(function() {
		$("#schBtn").click(function() {
			alert($("form").serialize())
			$.ajax({
				url : "z01_data.jsp",
				dataType : "text",
				data : $("form").serialize(),
				success : function(data) {
					$("tbody").append(data)
				},
				error : function(err) {
					console.log(err)
				}
			})
		})
	});		
		

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
		$("#schBtn").click(function() {
			alert($("form").serialize())
			$.ajax({
				url : "z01_data.jsp",
				dataType : "text",
				data : $("form").serialize(),
				success : function(data) {
					$("tbody").append(data)
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
		<h2>타이틀</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="번호입력" class="form-control mr-sm-2" name="mno" />
				<button class="btn btn-info" type="button" id="schBtn">검색</button>

			</nav>
		</form>
		<table class="table table-hover table-striped">

			<thead>

				<tr class="table-success text-center">
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>권한</th>
					<th>포인트</th>

				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>

	</div>

</body>
</html>