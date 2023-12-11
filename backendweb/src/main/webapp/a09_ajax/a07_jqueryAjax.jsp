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
     $("#infBtn").click(function(){
    	 //alert("요청값 : "+$("form").serialize())
    	 $.ajax({
    		 url:"z07_data.jsp",
    		 type:"get",
    		 data:$("form").serialize(),
    		 dataType:"text",
    		 success:function(data){
    			 alert(data)
    			 $(".jumbotron").append(data)
    		 },
    		 error:function(err){
    			 console.log(err)
    		 }
    		 
    	 })
     }) 
   });
   
   /*
   a08_jqueryAjax.jsp 회원정보 : 아이디 패스워드 이름 권한 입력
   서버에서 받은 tr을 하단 테이블의 tbody에 추가
   z08_data.jsp 해당 데이터를 받아 <tr> <td> ${param.id}... 처리
   */
   
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>Jquery Ajax 호출</h2>

</div>
<%--
# jquery를 통한 ajax 처리
1. jquery에서는 보다 간편한 속성설정 방식과 요청값 처리로 ajax를 처리하고 있다.

2. 기본형식
	1) $.ajax({속성:속성값, 속성:function(){}})
		형식으로 ajax를 처리하고 있다.
	
	2) 주요 속성과 메서드
		&.ajax({
			url:요청자원의명,
			
			type:'get/post',
			
			data:'name=홍길동', // 요청값 처리형식 $("form").serialize(),
			
			dataType:"json/text/xml" 결과값 형식을 지정 --> 대소문자 구분!
			
			success:function(data){ // 성공하였을때, 결과값
				data : 서버에서 전송된 결과값을 받을 수 있다.
			},
			
			error:function(err){
				console.log(err) // 에러 처리 결과값을 받을 수 있다. 
			}
		})
 --%>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="물건명" name="name" />
       <input class="form-control mr-sm-2" placeholder="가격" name="price" />
       <input class="form-control mr-sm-2" placeholder="갯수" name="cnt" />
       <button class="btn btn-info" type="button" id="infBtn">Search</button>
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