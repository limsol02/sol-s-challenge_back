<%@page import="org.apache.taglibs.standard.tag.common.core.ChooseTag"%>
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
# Expression Language
1. jsp에서 사용가능한 새로운 스크립트언어
	jsp프로그램은 그동안 scriptlet, expression, declare 형태로 사용했는데,
	변수 설정과 scope에 따른 처리를 하다보면 예외를 처리해야 허고, scriptlet의 
	복잡서잉 많은 에러가 발생할 가능성을 보였다.
	
2. 이에 보다 null 예외를 줄이고, scope에 따른 변수 설정을 효과적으로 처리하기
	위해서는 사용하는 언어를 jsp에서 지원하게 되었다. 

3. el의 사용과 기본 코드
	1) el코드의 기본 형식
		el코드는 scope에 의해 설정된 데이터를 가져올 때, 
		기본의 getAttribute()로 가져오거나, 요청값을 처리할 때,
		화면단에서 처리해야 하는 데이터를 간편하게 ${변수}형식으로 처리할 수 있게 하였다.
		- 기본 변수 ${변수명}
		- 객체 데이터 ${객체변수명.property}
		
4. el의 주요기능
	1) jsp의 4가지 기본 객체의 범위에 따라 영역의 속성과 함께 변수로 지정
		변수/객체 + scope 범위로 설정한 내용을
		el태그 (${변수}, ${객체.프로퍼티})로 가져와서 처리할 수 있다.
	2) 집합객체에 대한 접근 방법 제공
	3) 수치연산, 관계연산, 논리연산 제공
	4) 자바 클레스의메서드 호출 기능 제공
	5) 표현 언어만의 기본 객체 제공==> 간단한 구문 때문에 표현식 대신 사용

# el과 jstl을 이용하면 script(scriptlet, expression)을 사용하지 않을 수 있다. 
	
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
<%
// 기본 변수 선언
request.setAttribute("pname", "사과");
request.setAttribute("price", 3000);
request.setAttribute("cnt", 5);
// 이름과 나이를 저장하고, 
// 성년유무와 성인,미성년자를 구분하여 표기
String ageStr = request.getParameter("age");
int age = 0;
if(ageStr!=null) age=Integer.parseInt(ageStr);
request.setAttribute("age01", age);
%>

<body>
<h2>물건명 : ${pname}</h2>
<h2>가격 : ${price}</h2>
<h2>갯수 : ${cnt}</h2>
<h2>총계 : ${price*cnt}</h2>
<h2>등급표현1(만원 이상) : ${price*cnt >=10000}</h2>
<h2>등급표현2(고가/저가) : ${price*cnt >=10000?"고가":"저가"}</h2>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" name="age" />
     
       <button class="btn btn-info" type="submit">검색</button>
      
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="33%">
      <col width="34%">
      <col width="33%">
    <thead>
    
      <tr class="table-success text-center">
        <th>입력한 나이</th>
        <th>성인여부</th>
        <th>판별여부</th>
        
      </tr>
    </thead>   
    <tbody>
       <tr><td>${age01}</td><td>${age01>20}</td><td>${age01>20?"성인":"미성년"}</td></tr>
       
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