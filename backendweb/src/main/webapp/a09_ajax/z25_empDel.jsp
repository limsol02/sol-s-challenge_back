<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="gson" class="com.google.gson.Gson"/>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
{"delCnt":${dao.deleteEmp01(param.empno)}}