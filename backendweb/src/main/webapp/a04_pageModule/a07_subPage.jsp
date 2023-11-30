<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<%
String name = "홍길동";
int age = 25;
String loc = "서울";
%>
<h2>포함될 내용</h2>

<script>
	$("h4").text("안녕하세요(subpage에서 할당)")
</script>
<%--
jquery가 없는데도 메인페이지에 있어서 바로 처리 가능
--%>