<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="gson" class="com.google.gson.Gson" />
<jsp:useBean id="p01" class="backendweb.z01_vo.Person"/>
<jsp:setProperty name="p01" property="*"/>
${gson.toJson(p01)}
<%--z51_Person.jsp에 요청값으로 Person객체를 useBean으로 선언하고, 이름, 나이, 사는곳을 할당하여
		   	 	gson.toJson(p01)로 데이터를 출력--%>