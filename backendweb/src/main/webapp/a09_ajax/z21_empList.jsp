<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
<jsp:useBean id="sch" class="backendweb.z01_vo.Emp"/>
<jsp:setProperty name="sch" property="*"/>
<c:if test="${empty sch.ename}">${sch.setEname("")}</c:if>
<c:if test="${empty sch.job}">${sch.setJob("")}</c:if>

<c:forEach var="emp" items="${dao.getEmpList(sch)}">
	<tr>
		<td>${emp.empno}</td>
		<td>${emp.ename}</td>
		<td>${emp.job}</td>
		<td>${emp.mgr}</td>
		<td><fmt:formatDate value="${emp.hiredate}"/></td>
		<td><fmt:formatNumber value="${emp.sal}"/></td>
		<td>${emp.comm}</td>
		<td>${emp.deptno}</td>
	</tr>
</c:forEach>
