<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
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
  <h2>물건 호출</h2>

<%@include file="a09_comm.jsp"%>
<script>
call();
</script>
</div>
<div class="container">
   <table class="table table-hover table-striped">
      <col width="33%">
      <col width="34%">
      <col width="33%">
    <thead>
    
      <tr class="table-success text-center">
        <th>물건명</th>
        <th>가격</th>
        <th>갯수</th>
      </tr>
    </thead>   
    
    <tbody>
       <tr>
       <td><%=p01.getName() %></td>
       <td><%=p01.getPrice() %></td>
       <td><%=p01.getCnt() %></td>
       </tr>
    </tbody>
   </table>    
    
</div>

</body>
</html>