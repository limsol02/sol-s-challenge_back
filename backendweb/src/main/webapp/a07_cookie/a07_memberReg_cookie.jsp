<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
	import="java.net.URLEncoder"
	import="java.net.URLDecoder"      
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
	
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>회원등록(쿠키로)</h2>

	</div>
	<% 
	String id = request.getParameter("id");	
	String pwd = request.getParameter("pwd");
	if(id!=null && pwd!=null){
		Cookie c = new Cookie(
						URLEncoder.encode("M_"+id,"utf-8"),
						URLEncoder.encode(pwd,"utf-8")
					);
		response.addCookie(c);
	%>
		<script type="text/javascript">
			if( confirm("회원등록 성공\n등록회원 확인하시겠습니까?") ){
				 location.href="a08_memberShow_cookie.jsp";
			}
		</script>
	<%
	}
    %>
    
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="아이디" name="id" class="form-control mr-sm-2" /> 
				<input placeholder="패스워드" name="pwd" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="submit">회원등록</button>
			</nav>
		</form>
	</div>
</body>
</html>