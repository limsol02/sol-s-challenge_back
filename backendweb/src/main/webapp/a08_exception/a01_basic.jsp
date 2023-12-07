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
# jsp에서 에러 처리
1. 웹개발 프로그래밍을 하면 에러가 발생할 수 있다. 
	자바프로그램에서는 이러한 에러가 발생되면 예외처리로 해당 에러에 대한 내용이
	원인을 출력햊고, 에러가 발생하더라도 프로세스가 멈추지 않게 된다.

2. 웹개발에서는 위의 내용과 함께, jsp 화면상으로도 에러를 대처할 회면을 표현하고,
	기타 다른 로그 처리/프로세스 처리를 할 수 있다.
	
3. 에러처리의 방식
	1) 각 에러가 발생한 페이지별로 에러 처리 페이지 설정
	2) 웹 서버 단위로 에러의 내용에 따라 에러 처리 페이지 설정
		- web.xml에서 서버단위 에러 코드나 에러 객체를 선언하여
			대체되는 화면을 로딩되게 처리한다.
	
# 각 화면별 에러 처리 페이지 구현
1. 에러가 발생했을 때, 처리하는 페이지 생성
	<%page isErrorPage="true" &>
	위 옵션을 통해서 에러가 발생했을 때, 대처하는 페이지임을 명시하면
	exception 객체를 참조값에 의해 바로 사용할 수 있고, 해당 객체의 메서드 사용 가능

2. 에러가 발생할 가망성이 있는 페이지에 위 에러처리 페이지를 설정
	<%@ page errorPage="위 만들어 둔 에러 페이지 지정"%>	

[ex] 에러가 났을 때, 대체할 페이지 a02_errorPage.jsp	
		isErrorpage = "true"
		exception.getClass().getName()
		exception.getMessage()
	
	 에러를 강제로 발생할 페이지 a03_call.jsp
	 	errorPage = "a02_errorPage.jsp"
	 	강제예외발생코드
	 	String s = null; log(s.toString());
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