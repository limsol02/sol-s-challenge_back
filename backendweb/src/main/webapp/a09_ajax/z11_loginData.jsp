<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
<jsp:useBean id="mem" class="backendweb.z01_vo.Member"/>
<jsp:setProperty property="*" name="mem"/>
{"loginRst":${dao.login(mem)}}
<%--
1. 로그인 처리 결과 {"loginRst": true/false} 처리하는 곳에서 
	어떻게 처리해야하는가??
2. 요청값 id,pwd를 어떻게 전송되어 login 메서드에 전송되는가?
	id=himan&pwd=7777 ==> Member에 id와 pwd에 할당해서 dao.login(mem)에
	전달되기때문에 해당 id/pwd 값에 따라 T/F 할당
--%>