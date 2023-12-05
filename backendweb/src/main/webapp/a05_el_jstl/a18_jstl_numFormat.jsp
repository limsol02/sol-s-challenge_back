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
1. jstl의 숫자형 데이터에 대한 처리 형식을 지정할 수 있다.
2. 기본형식
	<fmt:formatNumber value="숫자형데이터" 속성="속성값"/>

3. 속성
	type: 포맷할 숫자의 타입을 지정한다.
		속성값으로는 number,currency(통화), percent(%표시)가 있다. 
	pattern : 사용자 정의 숫자 포맷을 지정한다.
		- 속성값으로 설정할 수 있는 포맷형식
			"###,###.##" : 천단위 구분 기호를 사용하여 숫자를 포맷한다.
				소숫점이하 두자리까지 표현
			"000.0000" : 숫자 앞에 빈자리가 있을경우 0으러 채우고,
				소숫점 이하는 네 자리까지 표시한다.
			"$#.##0.00" : 통화포맷을 사용하여 금액을 표시한다. 
	
	currencySymbol : 통화단위를 지정하여 표현할 때 사용한다.
		ex) 원/$ 
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
     
    <thead>
    <c:set var="price" value="30000.34"/>
      <tr class="table-success text-center">
        <th>기본출력</th>
        <th>fmt 적용 기본출력</th>
        <th>number</th>
        <th>currency</th>
        <th>percent</th>
        <th>pattern</th>
        <th>pattern</th>
      </tr>
    </thead>   
    <tbody>
       <tr>
       <td>${price}</td>
       <td><fmt:formatNumber value="${price}" /></td>
       <td><fmt:formatNumber value="${price}" type="number" var="numberType"/>
       변수 :${numberType}</td>
       <td><fmt:formatNumber value="${price}" type="currency" currencySymbol="원"/></td>
       <td><fmt:formatNumber value="${price}" type="percent"/></td>
       <td><fmt:formatNumber value="${price}" pattern="0000000.00"/></td>
       <td><fmt:formatNumber value="${price}" pattern="###,###원"/></td>
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