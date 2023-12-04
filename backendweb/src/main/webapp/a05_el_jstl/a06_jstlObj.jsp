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
# jstl을 통한 객체 선언.
1. jstl은 session 범위로 객체를 선언하여 할당할 수 있고,
2. 각 내용을 property로 접근할 수 있다.
3. 기본 문법
	1) 기본 변수:<c:set var="변수명" value="값" 
		scope="page|request|session|application"/>
	2) 객체 변수
		<c:set var="변수명" value="<%=new  생성자(초기값)%> 
			scope="@@@/>
		XXXX.setAttribute("객체변수", new 생성자(초기값));
		<c:set var="변수명2" value="${객체변수}" scope=""/>
	3) 호출 
		${변수명}
		${변수명2.property명}	
				
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
  <h2>jstl 객체 할당</h2>
  <c:set var="name" value="홍길동" scope="page"/>
  <h3>기본 변수 호출:${name}</h3>
  <c:set var="p02" value='<%=new Person("오길동",27,"제주")%>'/>
  <%
  request.setAttribute("person", new Person("마길동",25,"서울"));
  %>
  <c:set var="p01" value="${person}" scope="session" />
  <h3>기본 객체 변수 호출:${p01.name}</h3>	
  <h3>기본 객체 변수 호출:${p01.age}</h3>	
  <h3>기본 객체 변수 호출:${p01.loc}</h3>
  <h3>기본 객체 변수 호출:${p02.name}</h3>	
  <h3>기본 객체 변수 호출:${p02.age}</h3>	
  <h3>기본 객체 변수 호출:${p02.loc}</h3>  
  <%--
  ex) c:set 
  	1) 변수로 가격을 설정하여 request범위로 호출하고,
  	2) 객체변수로 pageContext로 Dept로 설정하고, 
  		다시 c:set 형태로 할당하여 출력하세요 
   --%>	
  <c:set var="price" value="3000" scope="request"/>
  <h3>기본 변수 price:${price}</h3>
  <c:set var="d01" value='<%= new Dept(10,"인사","대전") %>' 
  	scope="page"/>
  <%
  	pageContext.setAttribute("d02", new Dept(20,"재무","제주"));
  %>
  <c:set var="d03" value="${d02}" scope="session"/>
  <h3>객체(d01):${d01.deptno }</h3>
  <h3>객체(d01):${d01.dname }</h3>
  <h3>객체(d01):${d01.loc}</h3>
  <h3>객체(d01):${d03.deptno }</h3>
  <h3>객체(d01):${d03.dname }</h3>
  <h3>객체(d01):${d03.loc}</h3>  
  ${d03.setLoc("인천")}
  <h3>변경property 객체(d01):${d03.loc}</h3>
  <%-- target="${객체변수}" property="프로퍼티명" value="할당할값" --%>
  <c:set target="${d03}" property="dname" value="회계"/>
  <h3>변경property 객체(d01):${d03.dname }</h3>
  
  
  
   
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