<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.d01_dao.*"
    import="backendweb.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}
	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>사원정보 상세조회</h2>
</div>
<%-- <div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="empno" value="${param.empno}" class="form-control mr-sm-2" 
	    	placeholder="사원번호를 입력하세요" />
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
# 위 코드는 검색정보 입력창 , 걍 주소창에다가 empno=사원정보 넣으면 검색됨 검색창 없으ㅕㄴ
	--%>
	<br><br>
	<%
	String empnoStr = request.getParameter("empno");
	if(empnoStr==null) empnoStr="0";
	int empno = Integer.parseInt(empnoStr);
	PreparedStmtDao dao = new PreparedStmtDao();
	request.setAttribute("emp", dao.getEmp(empno));
	// session으로 한번 처리시, 위 DB 요청 처리 하지 않더라도 
	// 각 화면마다 하단의 form 내용 session 유지되는 한 볼 수 있다.
	session.setAttribute("emp", dao.getEmp(empno));
	%>
	
	<form method="post">
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">사원번호</span>
		</div>
		<input name="empno" class="form-control" value="${emp.empno}" />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">사원명</span>
		</div>
		<input name="ename" class="form-control" value="${emp.ename }" />	
			
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">직책</span>
		</div>
		<input name="job" class="form-control" value="${emp.job}" />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">관리자번호</span>
		</div>
		<input name="mgr" class="form-control" value="${emp.mgr}" />	
			
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">입사일</span>
		</div>
		<input name="hiredateStr" class="form-control" value="${emp.hiredateStr}" />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">부서번호</span>
		</div>
		<input name="deptno" class="form-control" value="${emp.deptno}" />	
			
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">급여</span>
		</div>
		<input name="sal" class="form-control" value="${emp.sal}" />
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">보너스</span>
		</div>
		<input name="comm" class="form-control" value="${emp.comm}" />	
			
	</div>	

	<div style="text-align:right;">
		<input type="button" class="btn btn-info" value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-danger" value="삭제" id="delBtn"/>
		<input type="button" class="btn btn-success" value="조회리스트" id="mainBtn"/>
	</div>	
	</form>		
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>