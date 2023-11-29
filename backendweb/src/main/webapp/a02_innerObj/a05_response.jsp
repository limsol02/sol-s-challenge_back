<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
# response 기본 객체
1. 웹 브라우저에 전송하는 응답 정보를 설정하는 객체
2. 주요기능
	1) 헤더 정보 입력
	2) 리다이렉트 처리(서버단 안에서 페이지 이동 처리)

3. 기능 메서드
	1) addDateHeader(String name, long date)
		name 헤더에 date를 추가 처리 1971/1/1 기준으로 1/1000초 단위 설정
	
	2) addHeader(String name, String value)
		name 헤더에 value를 값으로 추가한다.
		
	3) addIntHeader(String name, int value)
		name 헤더에 정수값 value를 추가한다.
		
	4) setDateHeader(String name, long date)
		name 헤더의 값을 date로 지정한다. date는 1970/1/1 이후로 흘러간
		시간을 1/1000초 단위로 나타낸다.
		
	5) setHeader(String name, String value)
		name 헤더값을 value로 지정한다.
		
	6) setIntHeader(String name, int value)
		name 헤더값을 정수 값 value로 지정한다.
		
4. 리다이렉트
	1) 특정 페이지로 이동하라고 웹 브라우저에 응답
	
	2) 서버 안에서 명령문으로 특정 페이지로 이동 처리
		response.sendRedirect(String location)
		요청에 의해서 데이터를 전송하고 그 전송된 내용에 판단에 의해서
		페이지가 결정될 때 
		[ex] login인 경우, DB내용에따라 페이지 결정
	
	[cf] location.href="이동페이지" 브라우저에서 특정한 페이지로 이동 처리
	화면에 클릭하여 페이지 이동, 메뉴이동을 대부분 js, a href로 처리..
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
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">response객체</h2>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
	function goPage(){
		location.href="a06_locationPage.jsp";
	}
	
<%
String pageName = request.getParameter("pageName");
if(pageName != null && !pageName.equals("")){
	// 요청값을 받은 서버단안에서 페이지 이동 결정...
	response.sendRedirect(pageName);
}

// a09_login.jsp 
// 아이디 패스워드 입력
// ==> himan / 7777 일 때는 a10_main.jsp 로그인 성공 메인페이지
// 로그인 실패시, a11_logfailure.jsp

%>
</script>
 
</div>
<div class="container">
	<h2>redirect와 location.href의 차이</h2>
	<h3 onclick ="goPage()">
	location.href로 client 단에서 바로 이동</h3>
	<h3>form의 내용에 따른 페이지 이동</h3>
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	   
	    <select onchange='$("#frm01").submit()' name="pageName" class="form-control mr-sm-2">
	    	<option value="">이동할페이지 선택</option>
	    	<option value="a07_admin.jsp">관리자페이지 선택</option>
	    	<option value="a08_normal.jsp">일반사용자페이지선택</option>
	    </select>
	    <button class="btn btn-info" type="submit">이동</button>
	    <button class="btn btn-success" onclick="onPage()" type="button">클라이언트 이동</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="50%">
   	<col width="50%">
   	
    <thead>
    
      <tr class="table-success text-center">
        <th>헤더이름</th>
        <th>헤더값</th>
       
      </tr>
    </thead>	
    <tbody>
    <%
    // 헤더 정보가 저장된 곳(client), 서버에서 이 정보를 받아서 확인
    // ==> request로 처리
    // 다시 이 헤더정보를 변경할려면, response 객체를 통해서 속성을 변경하여 전달
    // ==> 위 나열된 response.XXXX() 메서드를 통해서
    Enumeration enu = request.getHeaderNames();
    while(enu.hasMoreElements()){
    	String name = (String)enu.nextElement();	
    	String val = request.getHeader(name);
    %>
    	<tr><td><%=name %></td><td><%=val %></td></tr>
    	<%} %>
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