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
		<h2>회원등록리스트(쿠키)</h2>
	</div>
	<div class="container">
		<table class="table table-hover table-striped">
			<col width="50%">
			<col width="50%">
			<thead>
				<tr class="table-success text-center">
					<th>회원아이디</th>
					<th>회원패스워드</th>
				</tr>
			</thead>
			<%
			Cookie [] mlist = request.getCookies();
			%>
			<tbody>
				<%
				for(Cookie mem:mlist){ 
					if(!mem.getName().equals("JSESSIONID")){
						// 쿠키 key decode
						String name = URLDecoder.decode(
										mem.getName(),"UTF-8");
						String pwd = URLDecoder.decode(
										mem.getValue(),"UTF-8");	
						// 쿠키값중에 "M_"이 들어가는 문자 추출
						int sIdx = name.indexOf("M_");
						if(sIdx!=-1){
							//int eIdx = sIdx+2; // M_ 제외 회원 아이디추출
							// "M_himan"
							// M_제외하고 himan 추출
							String id = name.substring(2);
				%>
				<tr>
					<td><%=id%></td>
					<td><%=pwd%></td>
				</tr>
				<%		}
					}
				
				}%>
			</tbody>
		</table>
		<a href="a07_memberReg_cookie.jsp">쿠키 회원등록하러 가기</a>
	</div>
</body>
</html>