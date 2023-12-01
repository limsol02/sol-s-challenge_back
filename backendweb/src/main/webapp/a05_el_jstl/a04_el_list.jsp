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
<%
// 배열형 데이터 선언
request.setAttribute("fruits", new String[]{"사과","바나나","딸기"});
List<String> list = new ArrayList<String>();
list.add("홍길동");
list.add("김길동");
list.add("팍길동");
request.setAttribute("names", list);
// list 형으로 무지개 색상을 선언하고, el로 출력'
List<String> rainbow = new ArrayList<String>();
rainbow.add("빨");
rainbow.add("주");
rainbow.add("노");
rainbow.add("초");
rainbow.add("파");
rainbow.add("남");
rainbow.add("보");
request.setAttribute("raindows",rainbow);
List<String> colors = Arrays.asList(new String[]{
	"red","orange","yellow","green","blue","navy","purple"
});
request.setAttribute("colors", colors);
%>
<body>
<div class="jumbotron text-center">
  <h2>el 배열형 데이터</h2>
	<h3>${fruits[0]}</h3>
	<h3>${fruits[1]}</h3>
	<h3>${fruits[2]}</h3>
	<h2>ArrayList</h2>
	<h3>${names[0]}</h3>
	<h3>${names[1]}</h3>
	<h3>${names[2]}</h3>
	<h2>무지개~</h2>
	<h3 style="color:red;">${raindows[0]}</h3>
	<h3 style="color:orange;">${raindows[1]}</h3>
	<h3 style="color:yellow;">${raindows[2]}</h3>
	<h3 style="color:green;">${raindows[3]}</h3>
	<h3 style="color:blue;">${raindows[4]}</h3>
	<h3 style="color:navy;">${raindows[5]}</h3>
	<h3 style="color:purple;">${raindows[6]}</h3>
	<h2>무지개~</h2>
	<h3 style="background:${colors.get(0)}">${colors.get(0)}</h3>
	<h3 style="background:${colors.get(1)}">${colors.get(1)}</h3>
	<h3 style="background:${colors.get(2)}">${colors.get(2)}</h3>
	<h3 style="background:${colors.get(3)}">${colors.get(3)}</h3>
	<h3 style="background:${colors.get(4)}">${colors.get(4)}</h3>
	<h3 style="background:${colors.get(5)}">${colors.get(5)}</h3>
	<h3 style="background:${colors.get(6)}">${colors.get(6)}</h3>
	
	<%for(String ranbows : rainbow){ %>
		<h2><%=ranbows %></h2>
	<%} 
	// ${rainbows.get(0)} 도 가능
	%>
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
   <table class="table table-hover table-striped">
      <col width="10%">
      <col width="50%">
      <col width="15%">
      <col width="15%">
      <col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
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