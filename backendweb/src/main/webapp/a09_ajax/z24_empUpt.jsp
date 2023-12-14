<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="gson" class="com.google.gson.Gson"/>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
<jsp:useBean id="upt" class="backendweb.z01_vo.EmpDTO"/>
<jsp:setProperty name="upt" property="*"/>
{"uptCnt":${dao.updateEmp01(upt)}}
<%-- 
${gson.toJson(dao.getDept(param.deptno))}        
--%>
    
