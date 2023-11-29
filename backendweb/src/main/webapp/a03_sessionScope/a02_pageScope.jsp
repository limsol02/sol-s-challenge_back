<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
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

<%
// page scope로 저장처리
pageContext.setAttribute("name", "홍길동");
pageContext.setAttribute("age", 25);
// ex) page scope로 물견명, 가격, 갯수를 설정하고 아래에 출력하세요.
String pname = request.getParameter("pname");
if(pname==null) pname="";

String priceStr = request.getParameter("price");
int price=0;
if(priceStr!=null)  price=Integer.parseInt(priceStr);

String cntStr = request.getParameter("cnt");
int cnt=0;
if(cntStr!=null)  cnt=Integer.parseInt(cntStr);

pageContext.setAttribute("pname",pname);
pageContext.setAttribute("price",price);
pageContext.setAttribute("cnt",cnt);

%>
<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">page scope</h2>
  <h3>name : <%=pageContext.getAttribute("name") %>,${name} </h3>
  <h3>age : <%=pageContext.getAttribute("age") %>, ${age} </h3>
  <h3>age+10 : <%=(Integer)pageContext.getAttribute("age") +10%>, ${age+10}</h3>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="pname" class="form-control mr-sm-2" placeholder="물건명" />
	    <input name="price" class="form-control mr-sm-2" placeholder="가격" />
	    <input name="cnt" class="form-control mr-sm-2" placeholder="갯수" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
    <thead>
    
      <tr class="table-success text-center">
        <th>물건명</th>
        <th>가격</th>
        <th>갯수</th>
        <th>총계</th>
       
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td>${pname}</td>
    	<%--만약 정확하게 가져오고 싶다면 
    	${pageScope.pname} = page scope
    	${requestScope.pname} = request scope
    	로 여러 스코프가 겹칠때는 범위를 명시적으로 구분하여 사용한다.
    	${범위scope.변수} 이용! --%>
    	<td>${price}</td>
    	<td>${cnt}</td>
    	<td>${price*cnt}</td>
    	</tr>
    	
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