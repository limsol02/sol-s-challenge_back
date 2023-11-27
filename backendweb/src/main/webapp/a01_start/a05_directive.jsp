<%@page import="backendweb.z01_vo.Product"%>
<%@ page import="backendweb.z01_vo.Person"%>
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
# directive(디렉티브)
1. jsp페이지에 대한 설정 정보를 저장
2. 디렉티브 구분
	<% 디렉티브명 속성 = 속성값, ... %>
	
3. 디렉티브 종류
	1) page : jsp 페이지에 대한 정보를 지정, 문서의 타입, 버퍼의 크기, 에러페이지등 정보 지정
		<% page contentType="text/html;charset=utf-8"%>
		# 주요속성 
		- contentType : jsp가 생성할 문서의 타입을 지정
		- import : jsp 페이지에서 사용할 자바 클래스를 지정
		- session : jsp 페이지가 세션을 사용할 지의 여부를 지정
		- info : jsp페이지에 대한 설명을 입력
		- errorPage : 에러가 발생할 때, 보여줄 페이지 지정
		- isErrorPage : 여러 페이지인지의 여부를 지정
	
	2) taglib : 사용할 태그 라이브러리를 지정
	
	3) include : 다른 문서를 포함 처리

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
<%
Person p01 = new Person("홍길동",25,"서울");
// ex) Product VO(name, price, cnt)로 설정해서 import 객체 생성후, 아래에서 출력
Product pr01 = new Product("사과",3000,2);
%>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">물건정보</h2>
<h3>
물건명 : <%=pr01.getName()%><br>
가격 : <%=pr01.getPrice()%> 원<br>
갯수 : <%=pr01.getCnt()%><br>
총계 : <%=pr01.getPrice() * pr01.getCnt()%> 원
</h3>

</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
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
        <th>1</th>
        <th><%=p01.getName() %></th>
        <th><%=p01.getAge() %></th>
        <th><%=p01.getLoc() %></th>
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