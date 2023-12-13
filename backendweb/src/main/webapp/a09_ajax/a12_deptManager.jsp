<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
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

		$("form").on("keypress", function(e) {
			if (e.keyCode == 13) { // enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})

		search()

		$("#schBtn").click(function() {
			search()
		})

		$("[name=dname],[name=loc]").keyup(function() {
			if (event.keyCode == 13) {
				search()
			}
		})

		$("#frm02 [name=deptno]").keyup(function() {
			console.log("#부서정보 확인#")
			if (event.keyCode == 13) {
				$.ajax({
					url : "z17_checkDupDeptno.jsp",
					data : $("#frm02").serialize(),
					dataType : "json",
					success : function(data) {
						if (data.checkDeptno) {
							alert("등록된 부서번호가 있습니다.\n다른번호를 입력하세요")
							$("#frm02 [name=deptno]").val("").focus()
						} else {
							alert("등록가능합니다")
							$("#ckNo").val("Y")
						}
					},
					error : function() {
						console.log(err)
					}
				})
			}
		})

		$("#regBtn").click(function() {
			// alert($("#frm02").serialize())
			if ($("#ckNo").val() != "Y") {
				alert("부서번호 중복 체크 하셔야 등록가능합니다.")
				return;
			}
			if (confirm("등록하시겠습니까?")) {
				$.ajax({
					url : "z13_deptInsert.jsp",
					data : $("#frm02").serialize(),
					dataType : "json",
					success : function(rs) {
						var rcnt = rs.insDept
						if (rcnt > 0) {
							alert("등록성공")
							search()
							$("#frm02")[0].reset()
							if (!confirm("계속 등록하시겠습니까?")) {
								$("#clsBtn").click() // 창닫기 실행
							}
						} else {
							alert("등록실패")
						}

					},
					error : function(err) {
						console.log(err)
					}
				})
			}
		})

	});

	$("#regFrmBtn").click(function() {
		$("#modalTitle").text("부서정보등록")
	})

	function search() {
		// alert($("#frm01").serialize())
		$.ajax({
			url : "z12_deptList.jsp",
			data : $("#frm01").serialize(),
			dataType : "html",
			success : function(deptHTML) {
				$("#deptList").html(deptHTML)
			},
			error : function(err) {
				console.log(err)
			}
		})
	}
	// ex) a13_empManager.jsp z21_empList.jsp
</script>

</head>

<body>
	<div class="jumbotron text-center">
		<h2>부서정보관리(ajax)</h2>

	</div>
	<%--
# ajax로 부서정보 처리
1. list로 부터 등록, 상세화면(수정/삭제) ajax로 처리
2. 주요파일 
	1) a12_deptManager.jsp : 부서정보 메인화면
	2) z12_deptList.jsp : 부서정보조회 list json 데이터 (ajax)
	3) z13_deptInsert.jsp : 부서정보 등록처리 (ajax)
	4) z14_deptDetail.jsp : 부서정보 상세 데이터 가져오기 처리 (ajax)
	5) z15_deptUpt.jsp : 부서정보 수정처리 (ajax)
	6) z16_deptDel.jsp : 부서정보 삭제처리 (ajax)
	
	7) dao 파일 PreparedStmtDao
	
	// List<Dept> getDeptList(String name, String loc)
	// int insertDept(Dept ins)
	// int updateDept(Dept upt)
	// int deleteDept(int deptno)
	// Dept getDept(int deptno)
	
# 부서정보 중복 처리 순서
1. 사용자 인터페이스
	부서번호를 입력하고 enter 입력 시, 중복여부를 확인해서 중복이 있으면 지우고 다시 입력하게 하고, 
	중복이 없으면 등록하도록 한다. + chId도 Y로 처리된다. 
	이 부분은 최종 입력 후 / 등록시 / 다시 체크하여 등록 가능하게 해준다.(유일키 입력방지)
	
2. dao 처리
	select * from dept where deptno=? 로 기능 메서드 추가
	
3. z17_checkDupDeptno.jsp 
	dao 호출 후 기능 메서드, 처리
	{"ckDeptno",${dao.checkDeptno(param.deptno)}}
	
4. 부서번호 입력 후 enter입력 시 해당기능 ajax 처리..
	유효하면 $("#child").val("Y")로 처리한다.
	
	
 --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input class="form-control mr-sm-2" placeholder="부서이름" name="dname" />
				<input class="form-control mr-sm-2" placeholder="지역" name="loc" />
				<button class="btn btn-info" type="button" id="schBtn">검색</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button" id="regFrmBtn">등록</button>
			</nav>
		</form>
		<table class="table table-hover table-striped" id="deptTab">
			<col width="33%">
			<col width="33%">
			<col width="34%">

			<thead>

				<tr class="table-success text-center">
					<th>부서번호</th>
					<th>부서명</th>
					<th>부서위치</th>

				</tr>
			</thead>
			<tbody id="deptList">

			</tbody>
		</table>

	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">부서정보등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm02" class="form" method="post">
						<div class="row">
							<div class="col">
								<input type="text" class="form-control"
									placeholder="부서번호 입력(enter 중복확인)" name="deptno"> <input
									type="hidden" id="ckNo" value="N" />
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="부서이름 입력"
									name="dname">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="부서위치 입력"
									name="loc">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="regBtn">등록</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="clsBtn">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>