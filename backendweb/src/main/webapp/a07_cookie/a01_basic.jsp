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
# Cookie란?
1. 웹 프로그래밍에 있어서 서버와 클라이언트간 접속하여 처리된 정보를 임시 저장하는 경우가 간간히 발생한다.
    이 때, 이 정보를 서버에 보관하여 사용하는 것을 session이라고 하고, 
    서버에 보관되는 메모리 부담을 줄이기 위하여 클라이언트에 저장하는 것을 쿠키라고 한다.
    
2. 쿠키의 생성 시점
    쿠키는 클라이언트에서 요청에 의해 서버 안에서 객체를 생성하여, 다시 response객체에 쿠키를 추가하고 
    클라이언트(브라우저)에 보내지면 클라이언트(브라우저)에서는 지정한 경로에 저장된다.
    
3. 쿠키의 활용
    1) 쿠키가 서버에서 생성되어 클라이언트에 저장되면, 다시 요청객체 request에 의해 서버에 보내지면
        쿠키값을 key/value 형식으로 호출하여 사용할 수 있다.
        
    2) 쿠키는 동일한 키로 addCookie로 할당하며 동일한 키로 설정된 내용으로 변경해 준다.
        price ==> 3000
        price ==> 5000
        같은 키 인경우 최종으로 설정된 값이 해당 쿠키의 값으로 저장된다.
        // 같은 키 price를 최종으로 5000을 할당햌ㅅ기에 수정처리와 동일한 효과를 볼 수 없다. 
        
    cf) 쿠키는 기존에 없는 키로 생성을 하면 새로운 쿠키값이 추가되고 기존에 있는 키의 경우 변경된 쿠키값으로 저장된다.
    
    3) 쿠키 생성 형식
        response.addCookie(new Cookie("쿠키의 키", "쿠키의 값"));
        
4. 쿠키의 소멸
    1) 쿠키는 서버에서 해당 쿠키의 키 명으로 유효시간 기능 메서드로 설정되어 다시 클라이언트로 보내지면,
        해당 시간 이후 클라이언트안에서 사라지게 된다.
        
    2) 삭제할 쿠키가 있는 경우, 서버에서 쿠키의 생존시간을 setMaxAge(0)으로 설정하여
        response.addCookie()로 쿠키를 추가하여 전달하면 client단에서 사라지게 된다.

        ex) Cookie c = new Cookie("key", "value");
        c.setMaxAge(0);
        response.addCookie(c);
        
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
  <h2>쿠키 생성</h2>
  <%
  // 1. 쿠키 생성
  Cookie c1 = new Cookie("cookie01", "himan");
  // 2. 클라이언트에 보내기
  response.addCookie(c1);
  %>
  <a href = "a02_showCookie.jsp">쿠키 확인하러 가기.</a>

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