<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- ?name=사과&price=3000&cnt=2 형식으로 전송되었을 시, 요청값 받은 내용 --%>
{"pname":"${param.pname}",
"price":${param.price},
"cnt":${param.cnt},
"total":${param.cnt*param.price}}