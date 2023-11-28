<%@page import="backendweb.z01_vo.GusetBook"%>
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
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">방명록</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input type="text" name="name" class="form-control mr-sm-2" placeholder="이름" />
	    <input type="number" name="money" class="form-control mr-sm-2" placeholder="축의금" />
	    <input type="text" name="text" class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
<%
String name = request.getParameter("name");
if(name==null) name="";

String moneyStr = request.getParameter("money");
int money = 0;
if(moneyStr!=null) money=Integer.parseInt(moneyStr);

String text = request.getParameter("text");
if(text==null) text="";

GusetBook gb = new GusetBook(name,money,text); 
%>
	<%--
	결혼축하 방명록
	이름 : [  ]
	축의금 : [  ]
	내용 : [  ] [등록]
	==> 이름 축의금 내용을 입력하여 등록하면 요청값을 문자, 숫자, 문자로 받아서
	객체 GusetBook 에 할당하고, 출력되게 하여요
	
	1. 화면구성
		name = "요청키"
		
	2. 요청값 처리
		String name = request.getParmeter("name")...
		
	3. 객체를 위한 클래스 생성
	
	4. 객체 import
	
	5. 객체 메서드를 통한 처리
	 --%>
	<table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="34%">
   	<col width="33%">
   
    <thead>
    
      <tr class="table-success text-center">
        <th>이름</th>
        <th>축의금</th>
        <th>내용</th>
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td><%=gb.getName() %></td>
    	<td><%=gb.getMoney() %>원</td>
    	<td><%=gb.getText() %></td>
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