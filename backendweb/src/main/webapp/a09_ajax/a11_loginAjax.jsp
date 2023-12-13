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
# 로그인 ajax 처리
1. 핵심 기능
	아이디와 패스워드를 입력하고 로그인버튼 클릭시, 비동기적으로
	인증 여부를 출력처리 한다.
2. 주요 파일
	1) 화면:a11_loginAjax.jsp
	2) json데이터:z11_loginData.jsp
	3) dao및 login처리 메서드 :PreparedStmtDao  login(id,pwd)


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
/*
# form의 내장된 이벤트
1. javascript를 설정하지 않더라도 처리되는 이벤트를 default 이벤트라고 한다.
2. form 하위에 입력값을 입력하고, enter키를 입력시, default 이벤트로
	submit가 처리되는 현상을 볼 수 있다. 
3. 위 default submit 이벤트의 경우, 일반 화면전환 요청처리의 경우 유용하게 사용할
	수 있지만, ajax의 경우 불편한 경우를 발생하게 된다.
4. 위 default 이벤트를 방지하려면 다음과 같은 코드를 처리하여야 한다.
	$("form").on("keypress",function(e){
		if(e.keyCode==13){   //  enter키의 keycode는 13
			e.preventDefault() // enter키의 기본 동작을 중단 처리
		}
		
	})

 
 */
	$(document).ready(function(){
		// submit 처리 방지
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})	
		$("#logBtn").click(function(){
			//alert($("#frm01").serialize())
			ckId()
		})
		$("[name=id],[name=pwd]").keyup(function(){
			if(event.keyCode==13)
				ckId()
		})
	});
	function ckId(){
		$.ajax({
			url:"z11_loginData.jsp",
			data:$("#frm01").serialize(),
			dataType:"json",
			success:function(data){
				//alert("로그인성공여부:"+data.loginRst)
				if(data.loginRst){
					alert("로그인 성공")
				}else{
					alert("로그인 실패\n다시 로그인 하세요")
					
				}
			},
			error:function(err){
				console.log(err)
			}
		})		
		
	}
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>로그인</h2>
	</div>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="아이디" name="id" class="form-control mr-sm-2" /> 
				<input placeholder="패스워드" name="pwd" type="password" class="form-control mr-sm-2" />
				<button class="btn btn-info" id="logBtn" type="button">로그인</button>
			</nav>
		</form>
	</div>
</body>
</html>