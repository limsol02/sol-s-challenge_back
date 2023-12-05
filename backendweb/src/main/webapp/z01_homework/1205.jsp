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
[1단계:개념] 1. c:forEach의 기본형식을 일반 카운트와 배열형데이터를 나누어서 예제와 함께 설명하세요
request.setAttribute("names",new String[]{"홍길동","김길동","박길동"}); ==> 배열형 데이터 requestScope 로 설정
<c:forEach var="name" value="${names}" varStatus="sts">
<h3>${name}</h3> ==> 배열 데이터 추력
</c:forEach>

<c:forEach var="count" begin="1" end="10">
<h3>${count}</h3> ==> 1부터 10까지 출력
</c:forEach>

[1단계:확인] 2. 아래 내용을 <c:forEach><c:if>를 사용
1) <c:forEach>를 사용하여 1부터 20까지의 숫자를 출력하되, 홀수일 때는 '홀수', 짝수일 때는 '짝수'라고 표시하세요."
 <tr class="table-success text-center">
        <th>숫자</th>
        <th>짝수?홀수?</th>
        
      </tr>
    </thead>	
    <tbody>
    <c:forEach var="count" begin="1" end="20">
    	<tr>
    	<td>${count}</td>
    	<c:set var ="cname" value="홀수"/>
    	<c:if test="${count%2==0}"> 
    		<c:set var="cname" value="짝수"/>
    	</c:if>
    	<td>${cname}</td>
    	</tr>
    </c:forEach>
    	
    </tbody>
	</table>    		

2) 구구단을 테이블로 출력하세요 
	<tr class="table-success text-center">
        <th>곱셈식</th>
        <th>값</th>
      </tr>
    </thead>	
    <tbody>
    <c:forEach var="c01" begin="1" end="9">
    <c:forEach var="c02" begin="1" end="9">
    	<tr>
    	<td>${c01}*${c02}</td>
    	<td>${c01*c02}</td>
    	</tr>
    </c:forEach>
    </c:forEach>
    
3) 현재 달의 1일부터 마지막 날까지를 테이블 사용하여 타이틀은 요일 표시하여 날짜를 출력하세요.
 <thead>
      <tr class="table-success text-center">
        <th>일</th>
        <th>요일</th>
      </tr>
    </thead>	
    <tbody>
    <c:forEach var="date" begin="1" end="31">
   
    	<tr>
    	<td>12월 ${date}일</td>
    	<c:choose >
    	<c:when test="${date%7==1}"><td>금요일</td></c:when>
    	<c:when test="${date%7==2}"><td>토요일</td></c:when>
    	<c:when test="${date%7==3}"><td>일요일</td></c:when>
    	<c:when test="${date%7==4}"><td>월요일</td></c:when>
    	<c:when test="${date%7==5}"><td>화요일</td></c:when>
    	<c:when test="${date%7==6}"><td>수요일</td></c:when>
    	<c:when test="${date%7==0}"><td>목요일</td></c:when>	
    	</c:choose>
    	</tr>
    	
    </c:forEach>

[1단계:개념] 3. DB연동 후, <c:forEach> 처리하는 모듈 처리 순서를 기술하세요.
1번째 : db 처리를 위해 테이블과 sql, 기능 메서드 작성
2번째 : form 화면 처리
3번째 : request객체로 DB 처리호출, 요청값 처리
4번째 : <c:forEach>를 통한 리스트 데이터 출력

[1단계:확인] 4. <c:forEach>  사원정보 ename과 job으로 검색처리하여 출력하는 화면을 구현하세요
<%
PreparedStmtDao dao = new PreparedStmtDao();

String ename=request.getParameter("ename");
if(ename==null) ename="";
String job=request.getParameter("job");
if(job==null) job="";

request.setAttribute("empList",dao.getEmpListExp(ename,job));
%>
<div class="container">
	<form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="사원명검색" name="ename" />
       <input class="form-control mr-sm-2" placeholder="직책검색" name="job" />
     
       <button class="btn btn-info" type="submit">검색</button>
      
    </nav>
   </form>
   <table class="table table-hover table-striped">
   	
   	
    <thead>
    
      <tr class="table-success text-center">
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책</th>
        <th>관리자번호</th>
        <th>입사일</th>
        <th>급여</th>
        <th>보너스</th>
        <th>부서번호</th>
        
      </tr>
    </thead>	
    <tbody>
    <c:forEach var="elist" items="${empList}">
    	<tr>
    	<td>${elist.empno}</td>
    	<td>${elist.ename}</td>
    	<td>${elist.job}</td>
    	<td>${elist.mgr}</td>
    	<td>${elist.hiredate}</td>
    	<td>${elist.sal}</td>
    	<td>${elist.comm}</td>
    	<td>${elist.deptno}</td>    	
    	</tr>
    </c:forEach>
     </tbody>
	</table>   



[1단계:개념] 5. <fmt:formatNumber>, <fmt:formatDate>의 속성과 속성값을 기본 예제를 통해서 기술하세요
- [fmt:formatDate]

<c:set var="now" value="<%=new Date() %>"/>

1) <fmt:formatDate type="date" value="${now}" dateStyle="full(속성값)"/> -> 2023년 12월 05일 화요일	 
2) <fmt:formatDate type="date" value="${now}" dateStyle="short(속성값)"/> -> 2023.12.5
3) <fmt:formatDate type="time" value="${now}" dateStyle="full(속성값)"/> -> 오후 4:42:02
4) <fmt:formatDate type="date" value="${now}" dateStyle="short(속성값)"/> -> 오후 4:42:02
4) <fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/> -> 2023-12-05
4) <fmt:formatDate type="both" value="${now}" dateStyle="full(속성값)"/> -> 2023년 12월 05일 화요일 오후 4:42:02

- [fmt:formatNumber]

<c:set var="num" value="123456.78"/>

1) <fmt:formatNumber value="${num}" type="number(속성)" var="numNum">${numNum} -> 123,456.78
2) <fmt:formatNumber value="${num}" type="currency(속성)" currencySymbol="$"> -> $123,456.78
3) <fmt:formatNumber value="${num}" type="percent(속성)"> -> 123,456,78%
4) <fmt:formatNumber value="${num}" pattern="###,###원"(패턴형식)> -> 123,456원

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
	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<%
PreparedStmtDao dao = new PreparedStmtDao();

String ename=request.getParameter("ename");
if(ename==null) ename="";
String job=request.getParameter("job");
if(job==null) ename="";

request.setAttribute("empList",dao.getEmpListExp(ename,job));
%>
<div class="container">
	<form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="사원명검색" name="ename" />
       <input class="form-control mr-sm-2" placeholder="직책검색" name="job" />
     
       <button class="btn btn-info" type="submit">검색</button>
      
    </nav>
   </form>
   <table class="table table-hover table-striped">
   	
   	
    <thead>
    
      <tr class="table-success text-center">
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책</th>
        <th>관리자번호</th>
        <th>입사일</th>
        <th>급여</th>
        <th>보너스</th>
        <th>부서번호</th>
        
      </tr>
    </thead>	
    <tbody>
    <c:forEach var="elist" items="${empList}">
    	<tr>
    	<td>${elist.empno}</td>
    	<td>${elist.ename}</td>
    	<td>${elist.job}</td>
    	<td>${elist.mgr}</td>
    	<td>${elist.hiredate}</td>
    	<td>${elist.sal}</td>
    	<td>${elist.comm}</td>
    	<td>${elist.deptno}</td>    	
    	</tr>
    </c:forEach>
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