<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="gson" class="com.google.gson.Gson"/>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
<jsp:useBean id="upt" class="backendweb.z01_vo.Dept"/>
<jsp:setProperty name="upt" property="*"/>
{"uptCnt":${dao.updateDept(upt)}}
<%-- 
${gson.toJson(dao.getDept(param.deptno))}        
--%>
    
