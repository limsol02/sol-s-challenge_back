<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
{"checkEmpno":${dao.checkEmpno(param.empno)}}