<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
[1단계:개념] 1. form 입력에서 default 이벤트란 무엇이면, 어떤 장점/단점이 있고, 이를 해결할려는 코드를 설명하세요

form입력을 할 때, enter키를 default 이벤트로 엔터를 누르면 자동 제출하는것을 예시로 들 수 있습니다.
장점이라면 사용자가 편리하고 이벤트에 대해 일관성을 가지지만, 
단점이라면 ajax에서 엔터를 입력할 시, 제출에 오류가 생기는 등 꼬이는 상황이 발생할 수 있습니다. 
오늘 수업에서 들은 default 이벤트의 예시로 enter 키 방지 코드는,
$("form").on("keypress", function(e) {
			if (e.keyCode == 13) { // enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})
가 있습니다. 


[1단계:확인] 2. 회원리스트 dao를 확인하고, ajax로 회원리스트를 조회하는 화면을 구현하세요

[###z01_data.jsp###]
<jsp:useBean id="dao" class="backendweb.d01_dao.MemberDao"/>
<jsp:useBean id="mem" class="backendweb.z01_vo.Member"/>
<jsp:setProperty property="*" name="mem"/> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="m01" items="${dao.getMemberList(param.name,param.auth)}">
<tr>
<td>${m01.mno}</td>
<td>${m01.name}</td>
<td>${m01.id}</td>
<td>${m01.pwd}</td>
<td>${m01.auth}</td>
<td>${m01.point}</td>
</tr>
</c:forEach>


[###1213.jsp###]
<script type="text/javascript">
	$(document).ready(function(){
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})
		search();
		
		$("#schBtn").click(function(){
			 search()
		})
	
	});
	
	function search(){
		$.ajax({
			url:"z01_data.jsp",
			data:$("#frm01").serialize(),
			dataType:"html",
			success:function(data){
				$("tbody").html(data)	
			},
			error:function(err){
				console.log(err)
			}
		})
	}
</script>



[1단계:개념] 3. ajax로 모달창을 이용한 데이터 등록 처리 순서와 핵심 코드를 기술하세요.
1. dao 만들기(insertMember)/ VO만들기
2. form 입력 화면, name값, 버튼 id값 설정하기
3. 처리할 data.jsp 만들기
<jsp:useBean id="dao" class="dao있는 클래스 경로"/>
<jsp:useBean id="mem" class="vo있는 클래스 경로"/>
<jsp:setProperty name="mem" property="*"/> 입력값 받아오기
{"insMem":${dao.insertMem(필요한데이터)}}

4. 메인화면에서 처리 코드 만들기
$.ajax({
	url:"data.jsp",
	data:"(#frm01)".serialize(),
	dataType:"json",
	success:function(data){
		data.insMem 처리할 코드
	},
	error:function(err){
		console.log(err)
	}
})

순서로 하면 저는 좀 편한거 같습니당



[1단계:확인] 4. 물건등록 버튼 클릭시, 물건명/가격/갯수를 등록 모달창을 로딩하고, 해당 데이터를 입력시, 해당정보를 
		입력한 정보를 {"name":"사과","price",3000, "cnt",5} 형식으로 출력하는 jsp를 만들고, 그것을
		ajax로 출력하는 jsp를 구현해보세요.

[###z01_data.jsp###]	
{"name":"${param.name}",
"price":"${param.price}",
"cnt":"${param.cnt}"}

[###1213.jsp###]
$(document).ready(function(){
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})
		
		$("#goInfo").click(function(){
			$.ajax({
				url:"z01_data.jsp",
				data:$("#frm02").serialize(),
				dataType:"json",
				success:function(data){
					var row=""
					row+="<tr><td>"+data.name+"</td><td>"+data.price+"</td><td>"+data.cnt+"</td></tr>"
					$("tbody").append(row)	
				},
				error:function(err){
					console.log(err)
				}
			})
		})
	
	});

[1단계:확인] 5. 회원등록 dao를 확인하고, ajax로 회원아이디 중복 체크 후, 회원등록하는 처리를 모달창으로 처리해보세요.
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
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})
		search();
		
		$("#schBtn").click(function(){
			 search()
		})
		
		$("#ckId").click(function(){
			$.ajax({
				url:"z02_dup.jsp",
				data:$("#frm02 [name=id]").serialize(),
				dataType:"json",
				success:function(data){
					if(data.checkId){
						alert("이미 사용중인 아이디입니다.\n다른아이디를 입력하세요.")
						$("#frm02 [name=id]").val("").focus()
					}else{
						alert("사용가능한 아이디 입니다.")
						$("#goId").val("Y")
					}
				},
				error:function(err){
					console.log(err)
				}
			})
		})
		
		$("#insBtn").click(function(){
			$.ajax({
				url:"z03_insert.jsp",
				data:$("#frm02").serialize(),
				dataType:"json",
				success:function(data){
					if(data.insMem>0){
						if($("#goId").val()=="Y"){
							alert("등록성공")
							search()
							if(confirm("계속 등록하시겠습니까?")){
								$("#frm02")[0].reset()
							}else{
								$("#clsBtn").click()
							}
						}else{
							alert("중복체크를 진행해주세요")
						}
					}else{
						alert("등록실패")
						
					}
				}
			})
		})
		
	});
	
	function search(){
		$.ajax({
			url:"z01_data.jsp",
			data:$("#frm01").serialize(),
			dataType:"html",
			success:function(data){
				$("tbody").html(data)	
			},
			error:function(err){
				console.log(err)
			}
		})
	}

	
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>회원 리스트</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="이름입력" name="" class="form-control mr-sm-2" />
				 <input placeholder="권한입력" name="" class="form-control mr-sm-2" />
				
				<button class="btn btn-info" type="button" id="schBtn">검색</button>
				
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
			</nav>
		</form>
		<table class="table table-hover table-striped">

			<thead>

				<tr class="table-success text-center">
					<th>번호</th>
					<th>회원명</th>
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
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">회원등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm02" class="form" method="post">
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="번호 자동"
									name="mno" value="1">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="이름 입력"
									name="name">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="아이디 입력"
									name="id">
								<input type="button" id="ckId" value="중복체크">
								<input type="hidden" value="N" id="goId">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="비밀번호 입력"
									name="pwd">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="권한 입력"
									name="auth">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="포인트 입력"
									name="point">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="clsBtn">Close</button>
					<button type="button" class="btn btn-primary" id="insBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>