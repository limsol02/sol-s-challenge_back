<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.d01_dao.PreparedStmtDao"
	import="backendweb.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


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
  <h2 data-toggle="modal" data-target="#exampleModalCenter">사원정보</h2>

</div>
<%
String ename = request.getParameter("ename");
if(ename==null){ename="";}

String job = request.getParameter("job");
if(job==null){job="";}

String deptnoStr = request.getParameter("deptno");
int deptno = 0;
if(deptnoStr !=null){deptno = Integer.parseInt(deptnoStr);}

PreparedStmtDao dao = new PreparedStmtDao();

List<Emp> elist = dao.getEmpList(new Emp(ename,job,deptno));
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("[name=deptno]").val("<%=deptno%>");
	})
</script>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="ename" value = "<%=ename%>" class="form-control mr-sm-2" placeholder="사원명" />
	    <input name="job" value = "<%=job%>" class="form-control mr-sm-2" placeholder="직책명" />
	    <select name="deptno" class="form-control mr-sm-2">
		<option value="0">전체</option>
	    <option>10</option>
	    <option>20</option>
	    <option>30</option>
	    <option>40</option>
	    </select>
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   
    <thead>
    
      <tr class="table-success text-center">
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책</th>
        <th>급여</th>
        <th>부서번호</th>
     </tr>
    </thead>	
    <tbody>
    	<% for(Emp e : elist){ %>
    	<tr>
    	<td><%=e.getEmpno() %></td>
    	<td><%=e.getEname() %></td>
    	<td><%=e.getJob() %></td>
    	<td><%=e.getSal() %></td>
    	<td><%=e.getDeptno() %></td>
    	</tr>
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