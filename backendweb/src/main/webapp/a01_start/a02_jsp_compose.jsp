<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%-- 
1. jsp에서 사용되는 주석문
2. 다른 충돌되는 코드를 모두 다 주석처리로 가능..
	1) html의 구성요소 모두 주석
	2) java 코드도 주석 가능
	
3. jsp 페이지의 구성요소
	1) 디렉티브(directive) : 1~6번 라인
	2) 스크립트 : 스크립트릿(scriplet), 표현식(expression), 선언부(declaration)
	3) 표현언어(expression language)
	4) 기본객체(implicit object)
	5) 정적데이터
	6) 표준액션태그(action tag)
	7) 커스텀태그(custom tag)와 표준 태그 라이브러리(jstl)
 --%>
 <%!
 // 선언부(declaration) : 스크립트릿이나 표현식에서 사용할 수 있는 변수, 
//			함수, 객체(클래스) 까지 선언할 때, 활용한다.
// 변수선언
String product = "사과";
 
 // 함수(메서드)선언
 public int plus(int num01, int num02){
	 return num01+num02;
 }
 
 // 클래스(객체) 선언
 class Person{
	 private String name;
	 private int age;
	 Person(String name, int age){
		 this.name = name;
		 this.age = age;
	 }
	 String showInfo(){
		 return name+", "+age;
	 }
 }
 %>
 <%
 	
 	
 	// 스크립트릿 :자바코드 선언 for 사용 등..
 	String name = "홍길동";
 %>
<html>
<!-- 
1. java코드는 주석 처리가 되지않는다. 
 -->
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
		alert("<%=name%>"); // java ==> js expression에 의해..
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">
  이름 : <%=name %></h2> <%-- <%=변수%> : expression  --%>
	
	<%
	if(name.equals("홍길동")){
	%>
	<h3>홍길동 변수 할당 성공!!</h3>
	<%}%>
	
	<%for(int cnt=1; cnt<=10; cnt++){ %>
		<h4>[<%=cnt %>] 안녕하세요!!</h4>
	<%} %>
</div>
<div class="container">
	<%
	String msg = "구매할 물건" + product;
	// 선언된 클래스 객체 호출
	Person p01 = new Person("마길동",25);
	%>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목"
	     value = "<%=plus(30,40)%>"/> <%--선언된 기능 메서드 호출 --%>
	    <input class="form-control mr-sm-2" 
	    placeholder="<%=p01.showInfo() %>" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
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