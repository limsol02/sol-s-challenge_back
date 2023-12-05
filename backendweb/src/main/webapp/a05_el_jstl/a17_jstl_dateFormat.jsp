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
  <h2>날짜형 데이터</h2>

</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
   <%--
# jstl로 날짜형 데이터 처리하기
1. jstl을 이용하면 날짜형 데이터를 효과적으로 화면에 출력할 수 있다.
2. 기본 코드 및 출력형식
	<fmt:formatDate value="날짜형데이터" 
			type="date|time|full"
			dateStyle="full|short"
			timeStyle="full|short"
			pattern="z a h:mm"
	날짜 유형 데이터를 원하는 형식으로 출력할 때, 주로 사용된다.

 --%>
   <c:set var="now" value="<%=new Date() %>"/> <%--날짜 기본 객체 생성--%>
   <table class="table table-hover table-striped">
      <col width="40%">
      <col width="60%">
       
    <tbody>
       <tr>
       <th>date full</th>
       <td><fmt:formatDate value="${now}" type="date" dateStyle="full"/></td>
       </tr>
       <tr>
       <th>date short</th>
       <td><fmt:formatDate value="${now}" type="date" dateStyle="short"/></td>
       </tr>
       <tr>
       <th>time full</th>
       <td><fmt:formatDate value="${now}" type="time" dateStyle="full"/></td>
       </tr>
       <tr>
       <th>time short</th>
       <td><fmt:formatDate value="${now}" type="time" dateStyle="short"/></td>
       </tr>
       <tr>
       <th>both full</th>
       <td><fmt:formatDate value="${now}" type="both" dateStyle="full"/></td>
       </tr>
       <tr>
       <th>pattern1</th>
       <td><fmt:formatDate value="${now}" pattern="z a h:mm"/></td>
       </tr>
       <tr>
       <th>pattern2</th>
       <td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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