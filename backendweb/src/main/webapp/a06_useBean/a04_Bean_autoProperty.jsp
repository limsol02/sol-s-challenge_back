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
# 항목이 많은 경우, 자동 setProperty 등록
1. 요청값이 많은 경우, useBean 에서는 자동 setProperty 설정기능을 제공한다. 
2. 단, 자동 설정기능의 경우 반드시, 요청값과 setProperty의 이름과 type이 동일할 때 가능하다.
3. 기본 형식
	1) 페이지?key1=val1&key2=val2...
	2) 위에 해당하는 setXXXX 형식으로 요청key에 해당 하는 이름과 할당할 수 있는
	 type의 데이터를 메서드로 선언할 클래스 선언
	3) <jsp:useBean 선언
	<jsp:setProperty name="bean아이디" property=""/>
	이렇게 property의 속성값으로 *를 설정하는 위 query String과 
	요청명과 property가 같고 type이 할당할 수 있으면 추가 선언하지 않더라도 할당이 된다.
	
	- insert.jsp?name=홍길동&age=25
	
	<jsp:setProperty property="*" name="mem"/>
	
	public void setName(String name){} -> 가능
	public void setAge(String age02){} -> 가능
	public void setAge(int age){} -> 가능
	public void setAge1(int age){} -> 불가능(property명이 맞지 않아 입력불가)
	
	insert.jsp?name="홍길동"&age="이십오"
	public void setName(String name){} -> 가능
	public void setAge(String age02){} -> 가능
	public void setAge(int age){} -> 불가능(타입이 맞지 않아서 입력불가)
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
       <input class="form-control mr-sm-2" placeholder="이름" name="name" />
       <input class="form-control mr-sm-2" placeholder="나이" name="age"/>
       <input class="form-control mr-sm-2" placeholder="지역" name="loc"/>
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="33%">
      <col width="33%">
      <col width="34%">
     
    <thead>
    
      <tr class="table-success text-center">
        <th>이름</th>
        <th>나이</th>
        <th>사는곳</th>
      </tr>
    </thead>   
    <jsp:useBean id="p01" class="backendweb.z01_vo.Person"/>
    <jsp:setProperty property="*" name="p01"/>
    <tbody>
       <tr>
       <td>${p01.name}</td>
       <td>${p01.age}</td>
       <td>${p01.loc}</td>
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