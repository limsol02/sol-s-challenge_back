<%@page import="backendweb.z01_vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>

  <h2>타이틀</h2>
<%
	Product p01 = new Product("사과",3000,2);
	%>
<script>
function call(){
	alert("공통함수가 호출되네요");
}

</script>
