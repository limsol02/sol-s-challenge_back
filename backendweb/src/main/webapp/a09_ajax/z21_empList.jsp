<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="gson" class="com.google.gson.Gson" />
<jsp:useBean id="gb" class="com.google.gson.GsonBuilder" />
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao" />
<jsp:useBean id="sch" class="backendweb.z01_vo.Emp" />
<jsp:setProperty name="sch" property="*"/>
<c:if test="${empty sch.ename}">${sch.setEname("")}</c:if>
<c:if test="${empty sch.job}">${sch.setJob("")}</c:if>
<c:set var="gson2" value='${gb.setDateFormat("yyyy-MM-dd").create()}'/>
${gson2.toJson(dao.getEmpList(sch))}

<%--
1. WEB-INF\lib\gson-2.8.2.jar 복사 추가
2. gson.toJson(객체) : 객체를 json 문자열 데이터로 변환처리 메서드.
<c:forEach var="emp" items="${dao.getEmpList(sch)}">
	<tr><td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.job}</td>
		<td>${emp.mgr}</td>
		<td><fmt:formatDate value="${emp.hiredate}"/></td>
		<td><fmt:formatNumber value="${emp.sal}"/></td>
		<td><fmt:formatNumber value="${emp.comm}"/></td>
		<td>${emp.deptno}</td></tr>
</c:forEach>
--%>
<%-- z21_empList.jsp?ename=A&job=A&deptno=10 확인 --%>