<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    import="java.net.URLEncoder"
    import="java.net.URLDecoder"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
# 쿠키의 encoding/ decoding 처리
1. 쿠키는 2byte이상의 데이터를 저장하지 못한다.
2. 그래서 한글의 경우 encoding 하여 저장 후, 다시 가져와서 확인할 때는
	decoding하여 출력하여야한다.
3. encoding 처리를 위한 코드
	import java.net.URLEncoder
	new Cookie(URLEncoding.encoding("키","utf-8"),
				URLEncoding.encoding("값","utf-8"));
4. decoding 처리를 위한 코드
	import java.net.URLDecoder
	String key=URLDecoder.decode(c1.getName(),"utf-8");
	String val=URLDecoder.decode(c1.getValue(),"utf-8");
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
  <h2>한글 쿠키 값 설정</h2>

</div>
<%
// 쿠키의 key와 val을 한글로 처리(encoding 처리)
String cookieKey = request.getParameter("cookieKey");
String cookieVal = request.getParameter("cookieVal");

if(!(cookieKey==null||cookieVal==null)) {
	Cookie ck = new Cookie(URLEncoder.encode(cookieKey,"utf-8"),URLEncoder.encode(cookieVal,"utf-8"));	
	response.addCookie(ck);
	%>
	<script>
	alert("한글로 쿠키 추가성공! 쿠키값 확인하러가기");
	location.href="a06_cookie_decoding.jsp";
	</script>


<%}
%>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="쿠키 키 입력(한글)" name="cookieKey" />
       <input class="form-control mr-sm-2" placeholder="쿠키 값 입력(한글)" name="cookieVal"/>
       <button class="btn btn-info" type="submit">쿠키값등록</button>
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