<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--z52_ListPerson.jsp에 Person객체 List에 할당하고, gson.toJson(list)로 배열형 데이터를 출력--%>
<jsp:useBean id="gson" class="com.google.gson.Gson" />
<jsp:useBean id="p01" class="backendweb.z01_vo.Person"/>
<jsp:setProperty name="p01" property="*"/>
gson.toJson(p01)