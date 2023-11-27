<%@page import="backendweb.z01_vo.Dept"%>
<%@page import="backendweb.d01_dao.PreparedStmtDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
[1단계:개념] 1. 웹어플리케이션의 구성요소와 전송처리 순서를 기술하세요.
==> 
웹 어플리케이션은 웹 브라우저, 웹서버, 웹어플리케이션서버, 데이터베이스 로 구성되어있습니다.
1. 웹 브라우저에서 웹 서버에 무슨 기능을 원하는지 요청하고
2. 웹 서버는 그 요청한 기능을 웹 어플리케이션을 수행해서 처리한 후
3. 웹 브라우저는 웹 서버로부터의 응답결과를 출력합니다.

[1단계:개념] 2. 웹서버 호출시 사용되는 url(http://www.google.com/search?hl=en&q=jsp&aq=f)의 의미를 기술하세요.
==> 
http : 프로토콜
www.google.com : 도메인주소
search?hl=en&q=jsp&aq=f : 요청한 내용과 값


[1단계:개념] 3. JSP와 Servlet의 차이점은 무엇인가요?
   - 두 기술의 주요 차이점을 설명하세요.
==> 
servlet 은 실행 코드 방식의 특징이 있고, jsp 은 스크립트 코드 방식으로 코딩을 
하는 차이점을 가집니다. 그래서 서블렛은 java코드와 html 코드가 하나의 파일 내에서 혼합되어 있고
jsp는 html문서 내에 java코드를 넣어서 사용합니다. 그렇기때문에 jsp 파일에서는
java와 html 코드가 분리되어 있기 떄문에 가독성이 더 좋습니다.
   
[1단계:개념] 4. JSP의 주요 구성 요소는 무엇인가요?
   - JSP 페이지를 구성하는 요소들에 대해 설명하세요.
 ===>
1) 디렉티브(directive) : jsp 페이지의 전체 속성을 정의합니다.
2) 스크립트 : 
- 스크립트릿(scriplet) : <% %> 로 사용되며 자바 코드를 사용하는데 쓰입니다.
- 표현식(expression) : <%= %> 로 사용되며 결과를 출력할 때 사용됩니다.
- 선언부(declaration) : <%! %> 로 사용하며 변수, 함수, 클래스 처럼 다양하게 선언할 수 있습니다.
3) 표현언어(expression language)
4) 기본객체(implicit object)
5) 정적데이터
6) 표준액션태그(action tag)
7) 커스텀태그(custom tag)와 표준 태그 라이브러리(jstl)

   
[1단계:개념] 5. JSP에서 스크립트릿(Script)이란 3가지가 무엇인지? 그 종류와 기본 코드를 기술하세요
==>
- 스크립트릿(scriplet) : <% %> 로 사용되며 자바 코드를 사용하는데 쓰입니다.
ex ) <% String name = "솔"; %>

- 표현식(expression) : <%= %> 로 사용되며 결과를 출력할 때 사용됩니다.
ex ) <%=name%> -> 위에서 선언한 솔 출력

- 선언부(declaration) : <%! %> 로 사용하며 변수, 함수, 클래스 처럼 다양하게 선언할 수 있습니다.
ex )<%! 
	public int plus(int a, int b){
		return a+b;
	}
	%>

[1단계:개념] 6. JSP 디렉티브(Directive)의 종류와 기능은 무엇인가요?
   - JSP 디렉티브의 예시와 그들의 역할을 설명하세요.
==>
디렉티브의 종류는 
1. page 
- contentType : jsp가 생성할 문서의 타입을 지정
ex] <% page contentType="text/html;charset=utf-8"%>

- import : jsp 페이지에서 사용할 자바 클래스를 지정합니다.
ex] <%page import="backendweb.z01_vo.Person"%>

- session : jsp 페이지가 세션을 사용할 지의 여부를 지정합니다.
- info : jsp페이지에 대한 설명을 입력합니다.
- errorPage : 에러가 발생할 때, 보여줄 페이지 지정합니다.
- isErrorPage : 여러 페이지인지의 여부를 지정합니다. 

2. taglib : 사용할 태그 라이브러리를 지정합니다.
3. include : 다른 문서를 포함 처리 할때 사용합니다.
   
   
[1단계:개념] 7. dao를 이용해서 부서정보를 출력하는 화면을 만드세요.


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<%
String dname = request.getParameter("dname");
if(dname==null) dname="";

String loc = request.getParameter("loc");
if(loc==null) loc="";

PreparedStmtDao dao = new PreparedStmtDao();
List<Dept> dlist = dao.getDeptList(dname, loc);

%>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="dname" value="<%=dname %>" class="form-control mr-sm-2" placeholder="부서명" />
	    <input name="loc" value="<%=loc%>" class="form-control mr-sm-2" placeholder="지역" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="34%">
   	
    <thead>
    
      <tr class="table-success text-center">
        <th>부서번호</th>
        <th>부서명</th>
        <th>지역명</th>
      </tr>
    </thead>	
    <tbody>
    <%for(Dept d : dlist){ %>
    	<tr>
    	<td><%=d.getDeptno() %></td>
    	<td><%=d.getDname() %></td>
    	<td><%=d.getLoc() %></td>
    	</tr>
    <%} %>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>