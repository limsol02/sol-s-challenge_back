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
사원번호 중복체크 : z18_empnoDupck.jsp
사원정보 등록 : z22_empInsert.jsp
# 진행 순서
1. 등록화면 로딩 버튼 클릭시 등록화면 로딩
	1) 등록 타이틀 변경
	2) 등록 화면 모달 창 내용 구현
	3) name=@@@ 설정
	   hiredatestr : dto 형식 확인
	4)    
2. 사원번호 유효성 check ajax 처리
	1) 등록 form에서 empno keyup시 처리
	2) 
3. form 모달 창 사원등록 버튼 클릭 시, ajax처리
	
			   
	   	
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
		$("[name=deptno]").change(function(){
			search()
		})
		$("[name=ename],[name=job]").keyup(function(){
			// enter입력시처리
			if(event.keyCode==13)
				search()
		})
		$("#schBtn").click(function(){
			search()
		})
		$("#regFrmBtn").click(function(){
			$("#modalTitle").text("사원정보등록")
			$("#uptBtn").hide();
			$("#delBtn").hide();
			$("#regBtn").show();
			
		})
		// 사원번호 중복 체크 z18_empnoDupck.jsp
		
		$("[name=empno").keyup(function(){
			
			if(event.keyCode==13){
				$.ajax({
					url:"z18_empnoDupck.jsp",
					data:"empno="+$(this).val(),
					dataType:"json",
					success:function(empCk){
						//alert(empCk.checkEmpno)
						if(empCk.checkEmpno){
							alert("중복된 사원번호 입력입니다\n다른 번호 입력해주세요")
							$("[name=empno]").val("").focus()
						}else{
							alert("등록 가능합니다.")
							$("#ckNo").val("Y")
							
							// $("[name=empno]").attr("readonly",true) - 더이상 변경하지 못하게 처리
							// 중복 check를 했을 때만 등록이 가능하게 처리
						}
					},
					error:function(err){
						console.log(err)
					}
				
				})	
				
			}
		})
		$("#regBtn").click(function(){
			if($("#ckNo").val()!="Y"){
				alert("사원번호는 중복체크 하여야 합니다.")
				return;
			}
			//alert( $("#frm02").serialize() )
			// {"insEmp": ${dao.insertEmp01(emp)}}
			// z22_empInsert.jsp
			$.ajax({
				url:"z22_empInsert.jsp",
				data:$("#frm02").serialize(),
				dataType:"json",
				success:function(emp){
					//alert(emp.insEmp) // 0 등록실패, 1이상은 등록 성공
					if(emp.insEmp>0){
						$("#frm02")[0].reset() // 등록 완료후 초기화
						alert("등록성공")
						search()
						if( !confirm("계속등록하시겠습니까?") ){
							$("#clsBtn").click()
						}
					}else{
						alert("등록실패!")
					}
				},
				error:function(err){
					console.log(err)
				}
			})
		})
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$.ajax({
					url:"z24_empUpt.jsp",
					data:$("#frm02").serialize(),
					dataType:"json",
					success:function(emp){
						alert(emp.uptCnt)
						if(emp.uptCnt>0){
							search()
							if(confirm("수정완료!\n창을 닫으시겠습니까?")){
								$("#frm02")[0].reset()
								$("#clsBtn").click()
							}
						}else{
							alert("수정이 되지 않았습니다")
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}
		})
		
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var delNo = $("#frm02 [name=empno]").val()
				$.ajax({
					url:"z25_empDel.jsp",
					data:"empno="+delNo,
					dataType:"json",
					success:function(emp){
						alert(emp.delCnt)
						if(emp.delCnt>0){
							search()
							alert("삭제되었습니다.")
							if(confirm("삭제완료! 창을 닫으실래여?")){
								$("#frm02")[0].reset()
								$("#clsBtn").click()
							}else{
								alert("ㅇㅋ")
							}
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}else{
				alert("삭제를 취소하셨습니다.")
			}
		})
		
	})
		
	function search(){
		//alert($("#frm01").serialize());
		$.ajax({
			url:"z21_empList.jsp",
			data:$("#frm01").serialize(),
			dataType:"json",
			success:function(empList){
				// 사원정보 : z21_empList.jsp ==> json 변환처리
				// 화면에 출력처리..
				var empHTML=""
				$(empList).each(function(idx, emp){
					empHTML+="<tr ondblclick='detail("+emp.empno+")' >"
					empHTML+="<td>"+emp.empno+"</td>"
					empHTML+="<td>"+emp.ename+"</td>"
					empHTML+="<td>"+emp.job+"</td>"
					empHTML+="<td>"+emp.mgr+"</td>"
					//console.log(typeof(emp.hiredate))
					empHTML+="<td>"+emp.hiredate+"</td>"
					empHTML+="<td>"+emp.sal+"</td>"
					empHTML+="<td>"+emp.comm+"</td>"
					empHTML+="<td>"+emp.deptno+"</td>"
					empHTML+="</tr>"
				})
				
				$("#empList").html(empHTML)
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	
	function detail(empno){
		$("#regFrmBtn").click()
		$("#modalTitle").text("사원정보상세")
		$("#uptBtn").show();
		$("#delBtn").show();
		$("#regBtn").hide();
		$.ajax({
			url:"z23_empDetail.jsp",
			data:"empno="+empno,
			dataType:"json",
			success:function(emp){
				$("#frm02 [name=empno]").val(emp.empno)
				$("#frm02 [name=ename]").val(emp.ename)
				$("#frm02 [name=job]").val(emp.job)
				$("#frm02 [name=mgr]").val(emp.mgr)
				$("#frm02 [name=hiredate]").val(emp.hiredate)
				$("#frm02 [name=sal]").val(emp.sal)
				$("#frm02 [name=comm]").val(emp.comm)
				$("#frm02 [name=deptno]").val(emp.deptno)
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
		<h2>사원정보(ajax)</h2>

	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<select name="deptno" class="form-control mr-sm-2" >
					<option value="0">부서선택</option>
					<option value="10">ACCOUNTING</option>
					<option value="20">RESEARCH</option>
					<option value="30">SALES</option>
					<option value="40">OPERATIONS</option>
				</select> 
				<input placeholder="사원명" name="ename" class="form-control mr-sm-2" /> 
				<input placeholder="직책" name="job" class="form-control mr-sm-2" />
				<button class="btn btn-info" id="schBtn" type="button">Search</button>
				<button class="btn btn-success" id="regFrmBtn" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
			</nav>
		</form>
		<table class="table table-hover table-striped">
			<col width="10%">
			<col width="15%">
			<col width="15%">
			<col width="10%">
			<col width="20%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<thead>
				<tr class="table-success text-center">
					<th>사원번호</th>
					<th>사원명</th>
					<th>직책명</th>
					<th>관리자번호</th>
					<th>입사일</th>
					<th>급여</th>
					<th>보너스</th>
					<th>부서번호</th>
				</tr>
			</thead>
			<tbody id="empList">
				
			</tbody>
		</table>

	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">타이틀</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm02" class="form" method="post">
					    <div class="row">
							<div class="col">
								<input type="number" class="form-control" placeholder="사원번호 입력"
									name="empno">
								<input type="hidden" id="ckNo" value="N">
									
							</div>
							<div class="col">
								<input type="number" class="form-control" placeholder="관리자번호 입력"
									name="mgr">
							</div>
						</div>					
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
						<div class="row">
							<div class="col">
								<input type="date" class="form-control" placeholder="입사일 입력"
									name="hiredateStr">
							</div>
							<div class="col">
								<input type="number" class="form-control" placeholder="부서번호 입력"
									name="deptno">
							</div>
						</div>	
						<div class="row">
							<div class="col">
								<input type="number" class="form-control" placeholder="급여 입력"
									name="sal">
							</div>
							<div class="col">
								<input type="number" class="form-control" placeholder="보너스 입력"
									name="comm">
							</div>
						</div>												
					</form>
				</div>
				<div class="modal-footer">

					<button type="button" id="uptBtn" class="btn btn-info">사원정보수정</button>
					<button type="button" id="delBtn" class="btn btn-danger">사원정보삭제</button>
					<button type="button" id="regBtn" class="btn btn-primary">사원정보등록</button>
					<button type="button" id="clsBtn" class="btn btn-secondary"
						data-dismiss="modal">Close</button>					
				</div>
			</div>
		</div>
	</div>
</body>
</html>