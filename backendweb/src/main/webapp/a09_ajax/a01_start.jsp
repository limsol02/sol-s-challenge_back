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
# ajax(asybchronized javascript)
1. 비동기적으로 서버와의 통신을 javascript로 처리하여 화면 전환없이 데이터를
	받아와서 처리하는 방식을 말한다.
	
2. 동기방식과 비동기 방식	
	1) 동기 : 서버와 클라이언트가 같은 속도로 연계하는 것을 말한다.
	- 편지를 우체통에 넣고 답장 올 때까지 기다리고 오면 다른일을 하는 것을 말한다.
	
	- 웹 화면에서는 form데이터를 입력하고, submit 후 다시 화면에 전환되면
		서버에서 만들어지는 화면을 사용하는 경우를 말한다.
	
	- 파일 업로드시, 파일을 서버에 다 올려서 해당 파일 정보와 실제 파일이
		있을때, 다운로드 하거나 이미지를 볼수 있게 하는 것 등을 말한다
	
	2) 비동기 : 서버와 클라이언트가 같은 속도로 연계하지 않음
	- 편지를 우체통에 넣기만 하고 다른일을 하다가 오면 처리하는 것을 말한다.
	
	- 검색처리하고, 다른 기능을 처리하면서 검색이 완료 되었을때, 
			화면에 로딩되어 보이게 하는 것을 말한다.
	
	- 비동기식으로 처리하면 해당 비동기 처리 과정의 이벤트 처리와 이에 맞는
			이벤트 핸들러 함수를 선언하여야한다.
		
3. 주요핵심코드
	1) XMLHttpRequest 객체 생성
		화면 전환없이 서버에 있는 자원들을 가지고 오는 js 내장 객체(동기/비동기 가능)
	
	=> var xhr = new XMLHttpRequest();
	[주의] 화면 전환없이 서버에 있는 자원들을 가지고 오는 것이
	동기/비동기의 기준은 아니다. XMLHttpRequest를 사용하면 화면 전환은 일어나지 않는다.
	데이터를 받을 때, 받기까지 다른 이벤트가 다른 기능을 처리할 수 잇는 것을 비동기라고 하고,
	데이터를 받을 때까지 다른 기능을 처리하지 못하는 것을 동기하고 한다.
	
	2) 옵션 설정 메서드
	xhr.open("get/post방식","서버의 자원위치", 동기/비동기 boolean);
	
	3) 전송 처리 메서드
		xhr.send();
	
	4) 서버에서 해당 자원을 전송해주는 데이터를 받는 속성
		xhr.responseText
==================================================================(지금까지 동기방식처리)
	5) 비동기일때, 처리는 이벤트 및 이벤트 핸들러 함수를 위 3)항목까지 처리하고, 
		결과를 받는 xhr.responseText를 이벤트로 처리한다.
		
		xhr.onreadyStatechange = function(){
			xhr.readyState : 서버와 통식을 단계별로 코드값을 가져온다
			0 : 객체를 만든다
			1,2 : 서버에서 데이터를 받을 준비를 한다
			3 : 서버에서 데이터를 일부 받음
			4 : 서버에서 데이터를 모두 받음
			xhr.status : http 응답 코드 200~299(정상적으로 받음)
				일반적으로 200으로 설정 안에서 정상적으로 다 데이터가 있을 때, 처리한다.
			xhr.responseText 를 이 핸들러 메서드 안에서 비동기적으로 받은 데이터를 처리한다.	 
		}
	

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
// row code  ==> libary/framework
   $(document).ready(function(){
      $("h2").click(function(){
    	  // XMLHttpRequest 객체 생성
    	  var xhr = new XMLHttpRequest();
    	  //alert("객체 생성 확인 : "+xhr);
    	  // 동기적 처리..
    	  // [주의] 주로 XMLHttpRequest 비동기가 목적이기에 비동기일때 true
    	  // 	  get/post, 자원(서버자원), 비동기여부
    	  xhr.open("get","z01_data.jsp",false);
    	  xhr.send() // 요청값을 호출..
    	  alert("서버의 자원 받은 결과"+xhr.responseText)
    	  // 서버에서 받은 결과 문자열을 화면에 특정 위치에 출력처리
    	  $("h3").text(xhr.responseText)
      })
   });
   // ==> a01_start.jsp ==> XXX.html ==> 브라우저에 전달
   // ==> XMLHttpRequest를 통해서 화면이 정지된 상태(화면이 리플레쉬 되지 않는 상태)로
   //	서버에 있는 코드의 결과를 가져와서 출력 처리하는 형태
   //	서버의 결과값을 가져올 때까지 아무 작업도 못하는 것을 동기방식
   //	서버의 결과값을 가져올 때까지 다른 이벤트가 작업을 하다가 오면 처리하는 것을 비동기방식
   //	비동기방식에는 특정 결과가 오는 것을 모니터링 하는 메서드가 있다.
   
   // [주의] XMLHttpRequest를 쓰면 무조건 비동기 방식을 쓰는 것이 아니라
   //	기존의 서버에 있는 화면을 대체헤서 변경하는 것이 아닌 해당 코드는 js로 
   //	html코드나 변수로 가져오는 것을 말한다.
   
   // z02_date.jsp에 좋아하느 과일을 입력하고 a02_callFruit.jsp를 통해서 클릭시, 
   // z02_date.jsp에 있는 문자열인 과일명을 가져와서 화면에 출력하도록 하세요
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>XMLHttpRequest 통신의 나라로! 클릭!</h2>
	<h3></h3>
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