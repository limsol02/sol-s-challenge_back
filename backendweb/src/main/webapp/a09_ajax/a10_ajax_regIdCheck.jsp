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
	 
	   
      $("#checkIdBtn").click(function(){
    		  var idVal = $("[name=id]").val()
    	  $.ajax({
			url:"z10_checkData.jsp",
			ㄴ-> {"hasMember:true/false"}
			
			data:"id="+idVal,
			dataType:"json", // 문자열 json 데이터를 객체형으로 전환
			success:function(rs){
				// rs = {"hasMember"=true}
				console.log(rs)
				console.log(rs.hasMember)
				if(rs.hasMember){
					alert("등록된 아이디가 있습니다.\n다른아이디로 등록하세요")
					$("[name=id]").val("").focus()
					
				}else{
					alert("해당 아이디로 등록 가능합니다.")
					$("#ckId").val("Y")
				}
			},
			error:function(err){
				console.log(err)
			}
    	  })
      })
   });
   
   /*
   처리가 완료된 분들은 PreparedStmtDao에 있는 login() 기능 메서드 활용 
   로그인 폼 만들고 ajax로 로그인 성공여부를 처리해보세여
   */
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>회원등록</h2>

</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="아이디 입력" name="id" />
       <button class="btn btn-info" type="button" id="checkIdBtn">아이디 등록 여부 확인</button>
      
       <input type="hidden" id="ckId" value="N"/>
       <%--
       최종적으로 회원등록시, 아이디 입력을 통해 등록여부를 확인해서 
       유효한 id 입력시에 Y로 값이 변경되고, 해당 값일 때만 회원등록 처리가능
       
       mem = new Member(rs.getInt("mno"), rs.getString("name"), rs.getString("id"), rs.getString("pwd"),
							rs.getString("auth"), rs.getInt("point"));
       
        --%>
      
    </nav>
   </form>
   <table class="table table-hover table-striped">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
      <col width="16%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>이름</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>권한</th>
        <th>포인트</th>
      </tr>
    </thead>   
    <tbody>
      
    </tbody>
   </table>    
    
</div>

</body>
</html>