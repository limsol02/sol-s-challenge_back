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
[1단계:개념] 1. response.sendRedirect()와 a href의 차이점을 예제를 통해서 기술하세요
 response.sendRedirect("newPage.jsp") 와 a href = "newPage.jsp"
 는 newPage.jsp 페이지로 이동하게되는 것은 동일하지만, 
 response.sendRedirect("newPage.jsp") 는 newPage.jsp로 이동하라고 명령하고 
 전송된 내용에 따라 페이지가 결정되는 메서드면,
 a href="newPage.jsp" 는 단순히 링크로 이동만 시켜주는 키워드입니다. 

[1단계:개념] 2. response.sendRedirect()를 이용하여, 입력한 점수에 따른 평가 페이지를 다르게 처리하세요 
<%
String scoreStr = request.getParameter("score");
int score = 0;
if(scoreStr!=null) score = Integer.parseInt(scoreStr);
if(score!=0){
	if(score>=70){
	response.sendRedirect("Agrade.jsp");}
	else{
	response.sendRedirect("all_grade.jsp");}
	}


%>
<body>
<div class="jumbotron text-center">
  <h2>점수 입력 페이지</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input type="number" name="score" class="form-control mr-sm-2" placeholder="점수입력" />
	   
	    <button class="btn btn-info" type="submit">입력</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
[1단계:개념] 3. session scope의 범위에 대하여 설명하세요.
==> session scope는 브라우저와 서버가 연결되어 있는경우, 
동일한 브라우저 내에서는 session scope에 값을 저장해놓으면 
서버가 끊기지 않는 한 저장된 값을 가져올 수 있습니다.
하지만 다른 브라우저에서 해당 주소를 복사해서 가져오는 경우에는 브라우저가 달라 해당 주소를 입력하면 저장한 값을 가져올 수 없습니다.

[1단계:개념] 4. 일반변수/객체 할당하는 형식을 기본 코드 예제와 함께 기술하세요
==> 
1)일반변수 :  pageContext.setAttribute("dname","인사") 식으로 설정하고
${dname} 으로 값을 가져올 수 있습니다. 

2)객체 : pageContext.setAttribute("d01", new Dept(10,"인사","서울")); 로 Dept의 객체를 가져와
값을 설정하고 ${d01.deptno} / ${d01.dname} / ${d01.loc} 으로 el 코드로 가져올 수 있습니다.
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
		2. response.sendRedirect()를 이용하여, 입력한 점수에 따른 평가 페이지를 다르게 처리하세요
		--%>	
	});
</script>
</head>
<%
String scoreStr = request.getParameter("score");
int score = 0;
if(scoreStr!=null) score = Integer.parseInt(scoreStr);
if(score!=0){
	if(score>=70){
	response.sendRedirect("Agrade.jsp");}
	else{
	response.sendRedirect("all_grade.jsp");}
	}


%>
<body>
<div class="jumbotron text-center">
  <h2>점수 입력 페이지</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input type="number" name="score" class="form-control mr-sm-2" placeholder="점수입력" />
	   
	    <button class="btn btn-info" type="submit">입력</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="80%">
   	
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