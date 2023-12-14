<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="gson" class="com.google.gson.Gson" />
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao" />
${gson.toJson(dao.getEmp(param.empno))}
