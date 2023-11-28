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
	function goPage(){
		location.href="a00_req_res_basic_rev.jsp";
	}
	
	function goPage2(){
		location.href="a00_req_res_basic_rev.jsp?greet=hello";
	}
</script>
</head>

<body>
<div class="jumbotron text-center">

  <h2 >1단계 페이지 이동</h2>
	<a href="a00_req_res_basic_rev.jsp"> 기본link로 이동 </a>
  <h3 onclick="goPage()"> js명령어로 이동(클릭) </h3>
  <form action="a00_req_res_basic_rev.jsp">
  		<input type="submit" value="폼으로 이동"/>
  </form>
  
  
  <h2 >2단계 페이지 이동+요청값처리</h2>
	<a href="a00_req_res_basic_rev.jsp?greet=hello"> 기본link로 이동 </a>
  <h3 onclick="goPage2()"> js명령어로 이동(클릭) </h3>
  <form action="a00_req_res_basic_rev.jsp">
  		<input type="text" name ="greet" value="hello"/>
  		<input type="submit" value="폼으로 이동"/>
  </form>

</div>
<div class="container">
	<h2>3단계 같은 페이지에서 요청값 처리(action 생략)</h2>
	<form id="frm01" class="form"  method="get">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="bev" class="form-control mr-sm-2" placeholder="주문할 음료 입력" />
	    <input name="price" class="form-control mr-sm-2" placeholder="가격 입력" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="50%">
   	<col width="50%">
   
    <thead>
    
      <tr class="table-success text-center">
      <%
      // 요청값 형식 ? key(name값)=value값 => request.getParameter("key(name값)")
      String bev = request.getParameter("bev");
      if(bev==null)bev=""; 
      // 같은 페이지 요청값에서 반드시 처리
      
      String priceStr = request.getParameter("price");
      if(priceStr==null) priceStr="0";
      int price = Integer.parseInt(priceStr);
      %>
        <th><%=bev%>,<%=bev.equals("아이스 아메리카노")%></th>
        <th><%=price%>,<%=price+1000%></th>
       
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