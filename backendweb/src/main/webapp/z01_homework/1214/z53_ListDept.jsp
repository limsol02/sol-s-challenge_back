<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="gson" class="com.google.gson.Gson" />
<jsp:useBean id="dept" class="backendweb.z01_vo.Dept"/>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
<jsp:setProperty name="dept" property="*"/>
${gson.toJson(dao.getDeptList(param.dname,param.loc))}
<%--z53_ListDept.jsp로 요청값으로 부서위치, 부서명으로 전송하여 dao의 기능 메서드로 검색 리스트를 출력--%>