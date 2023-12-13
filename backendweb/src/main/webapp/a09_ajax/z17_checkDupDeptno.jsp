<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
{"checkDeptno":${dao.checkDeptno(empty param.deptno?0:param.deptno)}}