<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="backendweb.d01_dao.MemberDao"/>
<jsp:useBean id="mem" class="backendweb.z01_vo.Member"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:setProperty name="mem" property="*"/>
<c:set var="m01" value="${dao.getMember(param.mno)}"/>
<tr>
<td>${m01.mno}</td>
<td>${m01.name}</td>
<td>${m01.id}</td>
<td>${m01.pwd}</td>
<td>${m01.auth}</td>
<td>${m01.point}</td>
</tr>

