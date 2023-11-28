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
3) 영화 장르 선택기: 사용자가 선호하는 영화 장르를 select박스로 멀티선택하고, 그에 따라 추천 영화 목록을 보여주는 페이지를 작성하세요.
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
  <h2 data-toggle="modal" data-target="#exampleModalCenter">좋아하는 영화 장르</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
	
	<select name="movie" size="2" multiple="multiple" class="form-control mr-sm-2">
	
		<option value="0">액션</option>
        <option value="1">로맨스</option>
        <option value="2">공포</option>
        <option value="3">코믹</option>
	</select>
	<button class="btn btn-info" type="submit">장르선택완료</button>
	</form>
	<%
	String[] movies = request.getParameterValues("movie");
	StringBuffer sb = new StringBuffer();
	if(movies!=null){
		for(String m01 :movies){
		switch(m01){
		case "0" : sb.append("액션 "); break;
		case "1" : sb.append("로멘스 "); break;
		case "2" : sb.append("공포 "); break;
		default : sb.append("코믹"); break;
		}
		}
	}
	

	String[] mname = new String[2]; 
       
    if (movies != null && movies.length >= 2) {
    	 int idx1 = Integer.parseInt(movies[0]); 
         int idx2 = Integer.parseInt(movies[1]); 
        // 첫 번째 장르에 따른 추천 영화
        switch (idx1) {
            case 0: mname[0] = "킬빌, 미션임파서블"; break;
            case 1: mname[0] = "어바웃타임, 러브액츄얼리"; break;
            case 2: mname[0] = "링, 주온"; break;
            case 3: mname[0] = "극한직업, 나홀로집에"; break;
            default: mname[0] = ""; break;
        }

        // 두 번째 장르에 따른 추천 영화
        switch (idx2) {
            case 0: mname[1] = "킬빌, 미션임파서블"; break;
            case 1: mname[1] = "어바웃타임, 러브액츄얼리"; break;
            case 2: mname[1] = "링, 주온"; break;
            case 3: mname[1] = "극한직업, 나홀로집에"; break;
            default: mname[1] = ""; break;
        }
    }
	%>
	
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
   
    <thead>
    
      <tr class="table-success text-center">
        <th>선호 장르</th>
        <th>선호도에 따른 추천영화1</th>
        <th>선호도에 따른 추천영화2</th>
 
      </tr>
    </thead>	
    <tbody>
    	<tr>
    	<td><%=sb%></td>        
    	<td><%=mname[0]%></td>        
    	<td><%=mname[1]%></td>        
    	
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