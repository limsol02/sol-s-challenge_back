<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
# 페이지 모듈화 및 요청 흐름 처리
1. 화면을 구성할 대는 여러가지 설정이 필요한 경우도 잇고, 공통으로 처리하는 페이지가
	필요할 때도 많다. 공통 처리 내용에 대하요 따로jsp를 선언하고 활용한다면
	보다 효과적으로 변경/수정/추가 시 처리가 가능하다
	ex) 공통되는 화면처리, 공통회는 session처리, 공통되는 java/js 변수처리
	
	1) 페이지 모듈화의 종류
	- 클라이언트단 프로그램으로 모듈화처리
		frame/ iframe
		div
	
	- 클라이언트단 framework 프로그램
		react / vue에서 제공하는 컴포넌트 개념
		
	- 서버 프로그램
		<jsp:include page =""/>
			main.jsp/sub.jsp 따로 컴파일 되어 독립적인 객체가 모듈화된 내용 request로 전달
		ex) tot.jsp
				a.jsp
				b.jsp
				c.jsp
			각각 컴파일 tot,a,b,c 각각의 개별적 컴파일 파일 생성 요청값 형식으로 데이터 전달
		
		<%@ include file=""/>
			main.jsp/sub.jsp가 결국은 하나의 jsp로 만들어져 모듈화된
			내용으로 처리된다
			상단에 session설정, js코드 함께 처리되는 내용
		ex) tot.jsp
				a.jsp
				b.jsp
				c.jsp
			tot.jsp 로 전체를 하나로 컴파일 해 출력처리
			변수/ 기능 선언을 공유

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
  <h2>모듈처리</h2>
  <h3>include 액션 페이지 호출1</h3>
  <jsp:include page="a02_includeAction.jsp"/>
  
  
  <%
  pageContext.setAttribute("pname", "사과");
  session.setAttribute("price", 4000);
  request.setAttribute("loc", "서울");
  %>
  <h3>include 액션 페이지 호출 2</h3>
   <jsp:include page="a03_includeParamAction.jsp">
   <jsp:param value="홍길동" name="name"/>
   <jsp:param value="25" name="age"/>
   </jsp:include>

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