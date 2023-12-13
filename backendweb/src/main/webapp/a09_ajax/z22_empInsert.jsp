<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
<jsp:useBean id="emp" class="backendweb.z01_vo.EmpDTO"/>
<jsp:setProperty property="*" name="emp"/>
{"insEmp": ${dao.insertEmp01(emp)}}
