<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
[1단계:개념] 1. 아래 각, 기능의 하는 이유와 역할을 기술하세요
		
		$("#ckNo").val("Y") : hidden으로 해놓았던 input을 중복체크하여 true값인 애들만 Y로 value값을 바꾸고, 등록 단계를 진행 할 수 있게 합니다.
		
		$("#frm02")[0].reset() : 입력하여 값을 받아왔던 frm02의 form을 초기화 해줍니다.
		
		$("#frm02 [name=deptno]").attr("readonly",true) : frm02의  [name=deptno] 칸을 읽기 전용으로 만듭니다.
		
		$(deptList).each(function(idx, dept){ }) : deptList라는 정보 객체를 받아와서 idx는 현재 요소의 순번이고, dept는 요소 그 자체를 의미하여
		반복문으로 돌려 중괄호 안에 있는 형식으로 출력이나 정보를 할당하는 등 처리를 합니다. 
		
[1단계:개념] 2. gson lib은 어떤 처리를 해주는 객체인가? 해당 내용을 설명하고 처리하는 방법을 기술하세요.
	- 자바 객체를 JSON 형식으로 변환하거나, JSON 데이터를 자바 객체로 변환하는 데 사용됩니다.
	lib 폴더안에 gson-2.8.2.jar 파일을 넣어두고 , 해당 처리코드가 있는 상단부에 
	<jsp:useBean id="gson" class="com.google.gson.Gson" />
	를 넣어 useBean을 통해 사용할 수 있도록 합니더..

[1단계:개념] 3. 특정한 버튼의 이벤트와 입력값에 의한 ajax처리할 때, 각 $.ajax({속성:속성값}) 속성과 속성값은 어떤 것이 있는지 기본 예제를 통해서 정리하세요
	$.ajax({
	url:"z01_data.jsp", // AJAX 요청을 보낼 서버의 주소를 지정합니다.
	data:$("frm01").serialize(), // 서버로 보낼 데이터를 설정합니다. 
	type: "GET", // HTTP 요청의 메소드를 지정합니다.
	dataType:"json" // 서버로부터 받을 데이터의 타입을 명시합니다.
	success:function(data){ // 서버로부터 데이터를 받아왔을 때, 그 데이터로 처리할 코드를 작성합니다. 
		console.log(data)
	},
	error:function(err){ // 에러가 발생했을시, 처리할 코드를 작성합니다. 
		console.log(err)
	}
	})

[1단계:확인] 4. 아래 내용을 gson lib를 활용하여 단계별로 진행하자.
          1) z51_Person.jsp에 요청값으로 Person객체를 useBean으로 선언하고, 이름, 나이, 사는곳을 할당하여
		   	 	gson.toJson(p01)로 데이터를 출력해보자.
		
		[z51_Person.jsp]
		<jsp:useBean id="gson" class="com.google.gson.Gson" />
		<jsp:useBean id="p01" class="backendweb.z01_vo.Person"/>
		<jsp:setProperty name="p01" property="*"/>
		${gson.toJson(p01)}
		
		
		[ajax]
		$("#b01").click(function(){
			$.ajax({
				url:"z51_Person.jsp",
				data:$("#frm01").serialize(),
				dataType:"json",
				success:function(data){
					var p01 = ""
					p01+=data.name;
					p01+=data.age;
					p01+=data.loc;
					$("h3").text(p01)
				},
				errer:function(err){
					console.log(err)
				}
			})
				
			})
		});
          
          2) z52_ListPerson.jsp에 Person객체 List에 할당하고, gson.toJson(list)로 
	      	 	배열형 데이터를 출력하자. ? 이게 젤어렵다
          
          
          3) z53_ListDept.jsp로 요청값으로 부서위치, 부서명으로 전송하여 dao의 기능 메서드로 검색 리스트를 출력하세요.
	      	
	      
	      4) z54_DetailEmp.jsp로 요청값으로 사원번호를 넘겨서 json형식으로 하나의 사원정보를 json으로 출력하세요.
	      
	      
	      5) z55_deleteEmp.jsp로 요청값으로 사원번호를 넘겨서 {"delEmpCnt",0/1} 형식으로 삭제하고 삭제결과를 출력하세요.


[1단계:개념] 5. $.ajax({속성}) 속성과 속성값이 위 처리되는 위 jsp에 사용하는 변수와 어떤 연관 관계를 설명하세요


[1단계:확인] 6. 오늘한 부서정보 상세/수정/삭제기반으로 사원정보를 상세/수정/삭제 처리해보자.
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
	
	$(document).ready(function(){
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})
		
		search()
		
		$("#schbtn").click(function(){
			search()
		});
	
	function search(){
			$.ajax({
				url: "z53_ListDept.jsp",
	            data: ("#frm01").serialize(),
	            dataType: "json",
	            success: function(data) {
	            	var row=""
	            	$(data).each(function(idx, dept){
	            	row+="<tr><td>"+dept.deptno+"</td>"
	            	row+="<td>"+dept.dname+"</td>"
	            	row+="<td>"+dept.loc+"</td></tr>"
	            	})
	            	
	                $("tbody").append(row)
	            },
	            error: function(err) {
	                console.log(err)
	            }
			})
				
			
	}
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>타이틀</h2>
		<h3></h3>
	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="부서명" name="dname" class="form-control mr-sm-2" />
				<input placeholder="부서위치" name="loc" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="button" id="schBtn">Search</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
			</nav>
		</form>
		<table class="table table-hover table-striped">

			<thead>

				<tr class="table-success text-center">
					<th>부서번호</th>
					<th>부서명</th>
					<th>부서위치</th>

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