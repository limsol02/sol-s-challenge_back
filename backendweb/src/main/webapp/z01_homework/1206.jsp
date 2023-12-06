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
[1단계:개념] 1. jsp:useBean 속성의 의미를 기본 예제를 통해서 설명하세요
<jsp:uesBean id(속성1,접근할 때 내가 사용할 이름)="m01"
 class(속성2,패키지 이름을 포함한 자바 빈 클래스의 완전한 이름)="backendweb.z01_vo.Member"
 scope(속성3,자바빈 객체가 저장될 영역의 범위 지정)="session"/>
 
[1단계:개념] 2. property란 무엇인지? jsp:setProperty/jsp:getProperty를 통해서 설명하세요
<jsp:setProperty name="m01(id와 동일)" property="id(자바빈에서 값을 넣을 필드)" name="himan(property안에 넣을 값)"/> 
이런식으로 setProperty를 이용해서 useBean으로 부른 클래스안에 값을 넣을 수 있습니다. 

<jsp:getProperty property="id(setProperty로 설정한 것중 불러올 필드이름)" name="m01(useBean으로 설정한 id값과 동일)"/>
이렇게 값을 호출할 수 있습니다.${m01.id}도 사용가능

[1단계:확인] 3. 실습예제(아래 내용을 class와 form을 추가하여 처리하세요)

1) useBean 태그를 사용하여 Order 객체의 orderId와 orderDate 속성을 출력하는 코드를 작성하세요(setProperty로 설정하여 출력)

<c:set var="now" value="<%=new Date()%>"/>
	
	<jsp:useBean id="order" class="backendweb.z01_vo.Order"/>
	<jsp:setProperty property="orderId" name="order" value="himan"/>
	<jsp:setProperty property="orderDate" name="order" value="${now}"/>
	<jsp:setProperty property="orderName" name="order" value="홍길동"/>

   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
    <thead>
    
      <tr class="table-success text-center">
        <th>아이디</th>
        <th>날짜</th>
        <th>이름</th>
       
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td>${order.orderId}</td>
    	<td>${order.orderDate}</td>
    	<td>${order.orderName}</td>
    	</tr>
    </tbody>
	</table>    
    
</div>

2) useBean과 getProperty를 사용해 사용자의 이메일 주소를 표시하는 페이지를 만드세요.(입력값 받아 출력)

<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="사용자이름" name="name"  class="form-control mr-sm-2" />
	    <input placeholder="사용자아이디" name="id"  class="form-control mr-sm-2"/>
	    <input placeholder="사용자이메일" name="email"  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">등록</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
	
	<jsp:useBean id="u01" class="backendweb.z01_vo.User"/>
	<jsp:setProperty property="name" name="u01"/>
	<jsp:setProperty property="id" name="u01"/>
	<jsp:setProperty property="email" name="u01"/>

   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
    <thead>
    
      <tr class="table-success text-center">
        <th>이름</th>
        <th>아이디</th>
        <th>이메일</th>
       
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td>
    	<jsp:getProperty property="name" name="u01"/>
    	</td>
    	<td>
    	<jsp:getProperty property="id" name="u01"/>
    	</td>
    	<td>
    	<jsp:getProperty property="email" name="u01"/>
    	</td>
    	</tr>
    </tbody>
	</table>    
    
</div>
	
3) 사칙연산을 수행하는 간단한 계산기를 구현하세요(form,vo,useBean 출력)

<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="숫자1 입력" name="num01"  class="form-control mr-sm-2" />
	    <input placeholder="숫자2 입력" name="num02"  class="form-control mr-sm-2"/>
	    <input placeholder="연산식 입력" name="formula"  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">계산</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
	
	<jsp:useBean id="c01" class="backendweb.z01_vo.Calculator"/>
	<jsp:setProperty property="num01" name="c01"/>
	<jsp:setProperty property="num02" name="c01"/>
	<jsp:setProperty property="formula" name="c01"/>

   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
    <thead>
    
      <tr class="table-success text-center">
        <th>첫번째 숫자</th>
        <th>연산식</th>
        <th>두번째 숫자</th>
        <th>값</th>
       
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td>
    	${c01.num01}
    	</td>
    	<td>
    	${c01.formula}
    	</td>
    	<td>
		${c01.num02}    	
		</td>
    	<c:choose>
    	<c:when test="${c01.formula=='+'}"><td>${c01.num01+c01.num02}</td></c:when>
    	<c:when test="${c01.formula=='*'}"><td>${c01.num01*c01.num02}</td></c:when>
    	<c:when test="${c01.formula=='-'}"><td>${c01.num01-c01.num02}</td></c:when>
    	<c:when test="${c01.formula=='/'}"><td>${c01.num01/c01.num02}</td></c:when>
    	</c:choose>
    	
    	</tr>
    </tbody>
	</table>    
    
</div>

[1단계:확인] 4. useBean dao 처리 예제를 기반으로 부서정보리스트와 부서정보등록을 useBean을 통해서 처리하세요.
// getDeptList(dname like ? " + " and loc like ? ") insertDept
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
	<jsp:useBean id="d01" class="backendweb.z01_vo.Dept"/>
	<jsp:setProperty property="*" name="d01"/>
	<c:if test="${not empty d01.deptno}">
		<script type="text/javascript">
			var regDept = ${dao.insertDept(d01)}
			alert(regDept=="0"?"등록실패":"등록성공")
		</script>
	</c:if>
	
	
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="부서명 입력" name="dnameSch"  class="form-control mr-sm-2" />
	    <input placeholder="지역 입력" name="locSch"  class="form-control mr-sm-2"/>
	    
	    <button class="btn btn-info" type="submit">검색</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
	

   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
   
    <thead>
    
      <tr class="table-success text-center">
        <th>부서번호</th>
        <th>부서명</th>
        <th>지역</th>
      </tr>
    </thead>	
    <tbody>
    <c:forEach var="dlist" items="${dao.getDeptList(param.dnameSch,param.locSch)}">
    	<tr>
    	<td>${dlist.deptno}</td>
    	<td>${dlist.dname}</td>
    	<td>${dlist.loc}</td>
    	</tr>
    </c:forEach>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">부서정보 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="부서번호 입력" name="deptno">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="부서명 입력" name="dname">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="지역 입력" name="loc">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick='$("#frm02").submit();'>부서정보 등록</button>
      </div>
    </div>
  </div>
</div>

[1단계:개념] 5. 쿠키와 세션의 차이점을 기술(개념과 코드)하세요.
session :  서버에 보관하여 사용하는 것 
세션 정보 설정 : session.setAttribute("name", "임 솔");
세션 정보 받아오기 : session.getAttribute("name");
시간이나 다른 따로 객체를 불러 생성하지 않아도 세션값을 넣을 수 있습니다.

Cookie : 클라이언트에 저장하는 것
 Cookie c01 = new Cookie("name", "임 솔"); -> 쿠키 생성 & 쿠키 값 설정
 response.addCookie(c01); -> 쿠키 값 보내기
 Cookie[] cookies = request.getCookies();
 for(Cookie c : cookies){
 	c.getName() -> 쿠키 키 받기
 	c.getValue() -> 쿠키 값 받기 
 }
 
 이런식으로 설정 자채와 저장하는 곳에 차이가 있습니다.
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
<%-- 
		
--%>
	<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
	<jsp:useBean id="d01" class="backendweb.z01_vo.Dept"/>
	<jsp:setProperty property="*" name="d01"/>
	<c:if test="${not empty d01.deptno}">
		<script type="text/javascript">
			var regDept = ${dao.insertDept(d01)}
			alert(regDept=="0"?"등록실패":"등록성공")
		</script>
	</c:if>
	
	
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="부서명 입력" name="dnameSch"  class="form-control mr-sm-2" />
	    <input placeholder="지역 입력" name="locSch"  class="form-control mr-sm-2"/>
	    
	    <button class="btn btn-info" type="submit">검색</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
	

   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
   
    <thead>
    
      <tr class="table-success text-center">
        <th>부서번호</th>
        <th>부서명</th>
        <th>지역</th>
      </tr>
    </thead>	
    <tbody>
    <c:forEach var="dlist" items="${dao.getDeptList(param.dnameSch,param.locSch)}">
    	<tr>
    	<td>${dlist.deptno}</td>
    	<td>${dlist.dname}</td>
    	<td>${dlist.loc}</td>
    	</tr>
    </c:forEach>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">부서정보 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="부서번호 입력" name="deptno">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="부서명 입력" name="dname">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="지역 입력" name="loc">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick='$("#frm02").submit();'>부서정보 등록</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>