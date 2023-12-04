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
id : @@@
pwd : @@@ [로그인]
==> 요청값을 받아 맞으면 a13_main.jsp
	그렇지않으면 a14_error.jsp를 forward로 처리해보자

# login DB 연동 처리 순서
1. sql 작성
	=> SELECT * FROM member01 WHERE id = ? AND pwd=?

2. VO작성/ 확인
	=> 결과의 type과 sql문의 결과 컬럼에 따라 작성..
	=> 주의 : vo를 만들고 result.getString("XXX") 설정시는 sql의 결과를 기준으로
		처리하여야한다. 특히.. rs.getString("no"-mno의 애칭 no로 한경우)는 애칭을 기준으로 
		vo를 만들어야 한다. 
3. Dao

4. 화면 구성

5. 요청값 처리

6. Dao 호출

7. login 여부에 따라 다시 로그인

8. 해당 로그인 member 있을 때, session처리

9. 로그인 메인 페이지 이동 
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
  <h2>로그인페이지</h2>
<%


String id = request.getParameter("id");


String pwd = request.getParameter("pwd");

String logSuc="";

if(id!=null&&pwd!=null){ // 초기 아이디 패스워드 입력 전 화면과 구분..
	PreparedStmtDao dao = new PreparedStmtDao();
	Member mem = dao.login(id, pwd);
	if(mem!=null){
		logSuc = "Y";
		session.setAttribute("mem", mem); // 로그인 성공하였기에 
	}else{
		logSuc = "N";		
	 }
}
%>
<script>
	var login = "<%=logSuc%>";
	if(login=="Y"){
		alert("로그인성공")
		location.href='a13_mainSession.jsp';
	}if(login=="N"){
		alert("로그인실패\n다시 로그인하세용")
	}
</script>
</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="아이디 입력" name="id" />
       <input type="password" class="form-control mr-sm-2" placeholder="비밀번호 입력" name="pwd" />
       <button class="btn btn-info" type="submit">로그인</button>
      
    </nav>
   </form>
   
    
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