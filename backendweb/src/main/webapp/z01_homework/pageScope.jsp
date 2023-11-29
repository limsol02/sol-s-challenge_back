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
1) Page Scope 사용하기: 단일 JSP 페이지에서만 사용되는 임시 계산 변수를 page 범위로 선언하고 사용하는 예제를 작성하세요.

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
 
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>pageScope 예제</h2>

</div>
<%
String num01Str = request.getParameter("num01");
int num01 = 0;
if(num01Str!=null) num01 = Integer.parseInt(num01Str);
pageContext.setAttribute("num01", num01);

String num02Str = request.getParameter("num02");
int num02 = 0;
if(num02Str!=null) num02 = Integer.parseInt(num02Str);
pageContext.setAttribute("num02", num02);

String calcul = request.getParameter("calcul");
if(calcul==null) calcul="";
pageContext.setAttribute("calcul",calcul);

int result=0;
if(!(num01==0&&num02==0&&calcul==null)){
switch(calcul){
case "+" : result = num01+num02; break;
case "-" : result = num01-num02; break;
case "*" : result = num01*num02; break;
case "/" : result = num01/num02; break;
default : result = 0; break;
}}
%>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input type="number" name="num01" class="form-control mr-sm-2" placeholder="숫자1(더 큰수!)" />
       <input type="number" name="num02" class="form-control mr-sm-2" placeholder="숫자2(작은수!)" />
       <input type="text" name="calcul" class="form-control mr-sm-2" placeholder="계산할 연산식(+ , - , * , /)" />
       <button class="btn btn-info" type="submit">계산</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="25%">
      <col width="25%">
      <col width="25%">
      <col width="25%">
    <thead>
    
      <tr class="table-success text-center">
        <th>입력한 큰 숫자</th>
        <th>입력한 작은 숫자</th>
        <th>입력한 연산식</th>
        <th>결과</th>
      </tr>
    </thead>   
    <tbody>
       <tr>
       <td>${num01}</td>
       <td>${num02}</td>
       <td>${calcul}</td>
       <td><%=result%></td>
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