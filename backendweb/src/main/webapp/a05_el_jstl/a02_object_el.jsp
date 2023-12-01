<%@page import="backendweb.d01_dao.PreparedStmtDao"%>
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
# 객체 처리
1. el태그는 객체로 저장해서 활용처리..
2. 4가지 scope 영역에 의해 객체 저장
3. 저장된 객체의 변수명으로 호출하여 property로 처리
 --%>
 <%
 request.setAttribute("p01",new Person("홍길동",25,"서울"));
 // ex) Dept 에서 객체 설정해서 d01로 객체 내용 호출, 화면 출력
//  int deptno, String dname, String loc
// ex2) PrepareStmtDao 에서 단일 객체 리턴하는 메서드 출력
//public Member getMember(String id) { --> 6개
		//Member mem = null;
		//String sql = "SELECT * \r\n" + "FROM member01\r\n" + "WHERE id=? ";
		
request.setAttribute("d01", new Dept(10,"인사","서울"));

PreparedStmtDao dao = new PreparedStmtDao();
String id = request.getParameter("id");
if(id==null) id="";
request.setAttribute("m01",dao.getMember(id));
 %>
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
  <h2>객체 저장 호출</h2>
	<h2>객체 이름 :${p01.name}</h2>
	<h2>객체 나이 :${p01.age}</h2>
	<h2>객체 사는곳 :${p01.loc}</h2>
	<h2>Dept 호출</h2>
	<h2>부서번호 :${d01.deptno}</h2>
	<h2>부서이름 :${d01.dname}</h2>
	<h2>부서지역 :${d01.loc}</h2>
</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="아이디 입력" name="id" />
       <button class="btn btn-info" type="submit">Search</button>
       
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="20%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>이름</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>권한</th>
        <th>포인트</th>
      </tr>
    </thead>   
    <tbody>
       <tr>
       <td>${m01.mno}</td>
       <td>${m01.name}</td>
       <td>${m01.id}</td>
       <td>${m01.pwd}</td> 
       <td>${m01.auth}</td>
       <td>${m01.point}</td>
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