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

<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<%
request.setAttribute("plist",
		Arrays.asList(new Product("사과",3000,2),
					  new Product("바나나",4000,3),
					  new Product("딸기",12000,5) ));
// 부서정보를 Dept에 3개정도 담고 테이블로 출력
%>
<div class="container">
   
   <table class="table table-hover table-striped">
      <col width="20%">
      <col width="20%">
      <col width="20%">
      <col width="20%">
      <col width="20%">
     
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>물건명</th>
        <th>가격</th>
        <th>갯수</th>
        <th>총계</th>
        
      </tr>
    </thead> 
    <c:forEach var="prod" items="${plist}" varStatus="sts">
    <tbody>
       <tr>
       <td>${sts.count}</td>
       <td>${prod.name}</td>
       <td>${prod.price}</td>
       <td>${prod.cnt}</td>
       <td>${prod.cnt*prod.price}</td>
       </tr>
       
    </tbody>
    </c:forEach>  
   </table>    
    <%
    request.setAttribute("dlist", 
    		Arrays.asList(new Dept(10,"인사","서울"),new Dept(20,"회계","경기"),new Dept(30,"재무","세종")));
    %>
    
     <table class="table table-hover table-striped">
      <col width="25%">
      <col width="25%">
      <col width="25%">
      <col width="25%">
      
     
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>부서번호</th>
        <th>부서명</th>
        <th>지역</th>
       
        
      </tr>
    </thead> 
    <c:forEach var="d01" items="${dlist}" varStatus="sts">
    <tbody>
       <tr>
       <td>${sts.count}</td>
       <td>${d01.deptno}</td>
       <td>${d01.dname}</td>
       <td>${d01.loc}</td>
       
       </tr>
       
    </tbody>
    </c:forEach>  
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