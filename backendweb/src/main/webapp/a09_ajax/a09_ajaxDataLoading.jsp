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
# ajax를 통한 실시간 서버단 데이터 로딩 처리
1. 비동기적으로 서버에 있는 데이터를 가지고 처리하는 것은
	화면전한없이 데이터를 처리해주기에 기존 입력한 내용을 유지하면서 처리할 수 있는 장점이 있다. 
2. 처리순서
	1) 데이터로딩 부분
		- dao 객체 기능 메서드 추가
		[ex] public boolean ckMemberId(String id)
		
		- 요청값 및 데이터 로딩 처리 jsp 구현 
		jsp로 요청값을 받아서 원하는 데이터를 로딩하는 처리를 하는 화면을 처리한다. 
		-> import dao, vo
		<jsp:useBean id="dao" class="backendweb.d01_dao.MemberDao"/>
		{"hasMember":${dao.ckMemberId(param.id)}}
			 
		- 필요로 하는 데이터나 화면 처리
			실행을 통해서 요청값으로 해당 id로 데이터가 있는지 여부 확인
			http://localhost:7080/backendweb/a09_ajax/z10_checkData.jsp?id=himan
			{"hasMember":true}
	
	2) 메인 회면에서 특정한 이벤트에 의해서 데이터 요청값 확인 및 데이터 처리
		- 기본 화면 구현
		id [  ] [중복확인]
		
		- 이벤트에 의해 ajax 호출 처리
		$("#checkIdBtn")click(function(){ // 이벤트 처리
			var idVal = $("[name=id]").val()
			$.ajax({
				url:"z10_checkData.jsp",
				data:"id="+idVal,
				dataType:"json",
				success:function(data){
					console.log(data.hasMember)
				},
				error:function(err){
					console.log(err)
				}
			})
		})
	

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
      <%-- 
      
      --%>   
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="10%">
      <col width="50%">
      <col width="15%">
      <col width="15%">
      <col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>   
    <tbody>
       <tr><td></td><td></td><td></td><td></td><td></td></tr>
       <tr><td></td><td></td><td></td><td></td><td></td></tr>
       <tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
   </table>    
    
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