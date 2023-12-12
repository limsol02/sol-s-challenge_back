<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
<jsp:useBean id="dept" class="backendweb.z01_vo.Dept"/>
<jsp:setProperty property="*" name="dept"/> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="d" items="${dao.getDeptList(param.dname,param.loc)}">
	<tr>
	<td>${d.deptno}</td>
	<td>${d.dname}</td>
	<td>${d.loc}</td>
	</tr>
</c:forEach>
<%--z12_deptList.jsp?dname=O&loc=YORK--%>