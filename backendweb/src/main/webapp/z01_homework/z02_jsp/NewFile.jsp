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
2) 설문 조사 양식: 다양한 주제에 대한 사용자의 선호도를 묻는 라디오 버튼 기반 설문 조사를 만드세요. 각 질문은 여러 선택지를 가지며, 사용자는 하나만 선택할 수 있습니다.
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
  <h2 data-toggle="modal" data-target="#exampleModalCenter">선호하는 볼거리</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
	
	제일 흥미로운 주제 선택 <br>
		  	<div class="form-check-inline">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="favorite" value="드라마">드라마
		  </label>
		</div>
		<div class="form-check-inline">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="favorite" value="애니메이션">애니메이션
		  </label>
		</div>
		<div class="form-check-inline disabled">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="favorite" value="영화">영화
		  </label>
		</div>
		<div class="form-check-inline disabled">
		  <label class="form-check-label">
		    <input type="radio" class="form-check-input" name="favorite" value="다큐">다큐
		  </label>
		</div>
			<button class="btn btn-info" type="submit">선택전송</button>
	</form>
	<%
	String favorite = request.getParameter("favorite");
	if(favorite==null) favorite="";
	%>
	
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="50%">
   	<col width="25%">
 
    <thead>
    
      <tr class="table-success text-center">
        <th>선호하는 장르</th>
        
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td><%=favorite %></td>
    	
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