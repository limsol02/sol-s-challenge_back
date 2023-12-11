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
# 비동기방식으로 서버의 데이터 가져오기.
1. xhr의 비동기 방식이란?
	서버에 요청하고, 다른 기능을 처리할 수 있되, 그 요청에 대한
	처리는 이벤트핸들러 onreadyStatechange에 맞기고 하는 것을 말한다.
	
2. 기능 처리를 위한 핵심 코드
	1) xhr.open(get/post, url, true); => 마지막 매개변수를 true로 비동기 방식 설정
	2) 전담 이벤트 핸들러에게 맡김.
		xhr.onreadystatechange = function(){
			
			// 상태값의 변화에 따른 처리를 이벤트 핸들러에게 위임
			xhr.readyState(대소문자 구분 S대문자!) : 서버와 통신은 단계별로 코드값을 가져오게 하는 속성
			
			0 : 객체를 만든다
			1,2 : 서버에서 데이터를 받을 준비를 한다.
			3 : 서버에서 데이터를 일부 받기를 시작한다.
			4 : 서버에서 데이터를 모두 받는다.
			
			결국, 위 상태값을 4가 되었을 때, 처리한다.
			
			xhr.status : http 응답코드 200~299(정상적으로 받음)
			 일반적으로 200으로 설정 안에서 정상적으로 다 데이터가 있을때, 처리한다.
			 그외 에러코드 일때 처리하지 않는다.
			
			xhr.responseText : 이 핸들러 메서드 안에서 비동기적으로 받은 데이터를 처리한다..
			==> 실제 조건 처리 코드
			if(xhr.readyState==4 && xhr.status==200){
				$("대상객체선택자").text(xhr.responseText);
				-> 서버에서 받은 결과값 출력
			}
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
   $(document).ready(function(){
      $("h2").click(function(){
    	  var xhr = new XMLHttpRequest()
    	  xhr.open("get","z03_empList.jsp",true)
    	  xhr.onreadystatechange=function(){
    		  console.log("상태값1 : "+xhr.readyState)
    		  console.log("상태값2 : "+xhr.status)
    		  if(xhr.readyState==4 && xhr.status==200){
    			  console.log(xhr.responseText)
    			  // 이름을 ,(콤마)를 구분하여 배열로 만들어 처리
    			  var enames = xhr.responseText.split(",") 
    			  
    			  var addHtml=""
    			  
    			  enames.forEach(function(name, idx){
    				  console.log(idx+":"+name)
    				  addHtml+="<tr>"
    					  addHtml+=	"<td>"+(idx+1)+"</td>"
    					  addHtml+=	"<td>"+name+"</td>"
    					  addHtml+="</tr>"
    			  })
    			  $("tbody").html(addHtml)
    		  }
    	  }
    	  xhr.send()
      })
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>클릭해서 오늘 입사한 사원리스트를 출력</h2>

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
      <col width="20%">
      <col width="80%">
      
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
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