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
<%--
등록시 로딩하는 모달창의 회원버튼 클릭시 리스트에 회원등록 정보 ㅜㄹ력
private int mno;
	private String name;
	private String id;
	private String pwd;
	private String auth;
	private int point;
 --%>
 <jsp:useBean id="m01" class="backendweb.z01_vo.Member"/>
 <jsp:setProperty property="*" name="m01"/>
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
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
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
        <h5 class="modal-title" id="exampleModalLongTitle">회원등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="frm02" class="form"  method="post">
        <div class="row">
         <div class="col">
           <input type="text" class="form-control" placeholder="번호 입력" name="mno">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="이름 입력" name="name">
         </div>
        </div>
        <div class="row">
         <div class="col">
           <input type="text" class="form-control" placeholder="아이디 입력" name="id">
         </div>
         <div class="col">
           <input type="password" class="form-control" placeholder="비밀번호 입력" name="pwd">
         </div>
        </div>
        <div class="row">
         <div class="col">
           <input type="text" class="form-control" placeholder="권한 입력" name="auth">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="포인트 입력" name="point">
         </div>
        </div>
       </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button"
        	onclick='$("#frm02").submit();'
         class="btn btn-primary">회원등록처리</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>