<%@page import="java.net.URLDecoder"%>
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
<%--
ex) a07_memberReg_cookie.jsp 회원의 아이디와 패스워드를 쿠키값으로 등록
등록 성공 회원 확인 리스트 확인 (a08_memberShow_cookie.jsp)--%>
<body>
<div class="jumbotron text-center">
  <h2>쿠키값 받기</h2>

</div>
<div class="container">
   <table class="table table-hover table-striped">
      <col width="50%">
      <col width="50%">
      
    <thead>
    
      <tr class="table-success text-center">
        <th>쿠키키</th>
        <th>쿠키값</th>
      </tr>
    </thead>   
    <tbody>
    
    <%
    Cookie [] cookies = request.getCookies();
    for(Cookie c : cookies) {
    	if(!c.getName().equals("JSESSIONID")){
    %> 
       <tr>
       <td><%=URLDecoder.decode(c.getName(),"UTF-8")%></td>
       <td><%=URLDecoder.decode(c.getValue(),"UTF-8")%></td>
       </tr>
       <%}
    } %>
    </tbody>
   </table>    
    <a href ="a05_cookie_encoding.jsp">쿠키 구으러 가기</a>
</div>

</body>
</html>