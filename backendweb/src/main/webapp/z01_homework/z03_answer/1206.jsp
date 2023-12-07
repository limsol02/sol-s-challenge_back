<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
[1단계:개념] 1. jsp:useBean 속성의 의미를 기본 예제를 통해서 설명하세요
[1단계:개념] 2. property란 무엇인지? jsp:setProperty/jsp:getProperty를 통해서 설명하세요
[1단계:확인] 3. 실습예제(아래 내용을 class와 form을 추가하여 처리하세요)
	1) useBean 태그를 사용하여 Order 객체의 orderId와 orderDate 속성을 출력하는 코드를 작성하세요
	2) useBean과 getProperty를 사용해 사용자의 이메일 주소를 표시하는 페이지를 만드세요.
	3) 사칙연산을 수행하는 간단한 계산기를 구현하세요(form,vo,useBean 출력)
[1단계:확인] 4. useBean dao 처리 예제를 기반으로 부서정보리스트와 부서정보등록을 useBean을 통해서 처리하세요.
[1단계:개념] 5. 쿠키와 세션의 차이점을 기술(개념과 코드)하세요.
# 조별로 파악사항(아래사항 조별로 취합 전달 17:20까지 전달)
1. 오늘 가장 어려웠던 부분 best3 및 내일 자세한 설명 필요한 부분
2. 오늘 지각(9:00기준)/수업시간 엄수(매시간:00)/과제제출 인원과 사유
3. 수업 시간 긍적적으로 집중하였는가?
# 프로젝트/소스진행방향 도움
1. 16:00~17:00 과제
2. 17:00~18:00 프로젝트형과제
3. 소스 도움 요청(진행방향) 해당 시간에 조 우선
	16:00~16:30 1조
	16:30~17:00 2조
	17:00~17:30 3조
	17:30~18:00 4조
	
### 1단계: 개념

#### 1. `jsp:useBean` 속성의 의미 및 기본 예제
`jsp:useBean` 태그는 JSP 페이지에서 Java Bean을 사용하기 위한 태그입니다. 이 태그를 통해, JSP 페이지에서 Java 객체를 쉽게 만들고 접근할 수 있습니다. 만약 해당 이름의 Bean이 이미 존재한다면 그 객체를 재사용하고, 존재하지 않으면 새로 생성합니다.

**기본 예제:**
```jsp
<jsp:useBean id="user" class="com.example.User" />
```
여기서 `id`는 Bean에 대한 참조 이름이고, `class`는 Java Bean의 클래스 이름입니다.

#### 2. Property의 의미 및 `jsp:setProperty`/`jsp:getProperty` 설명
Property는 Java Bean의 데이터를 나타내는 필드(또는 속성)를 의미합니다. `jsp:setProperty`는 Bean의 속성에 값을 설정할 때, `jsp:getProperty`는 Bean의 속성 값을 가져올 때 사용합니다.

**예시:**
```jsp
<jsp:useBean id="user" class="com.example.User" />
<jsp:setProperty name="user" property="username" value="JohnDoe" />
<jsp:getProperty name="user" property="username" />
```
여기서 `user` 객체의 `username` 속성에 "JohnDoe" 값을 설정한 후, 그 값을 가져와서 출력합니다.

### 1단계: 확인

#### 3. 실습예제
1) **Order 객체의 orderId와 orderDate 속성 출력:**
```jsp
<jsp:useBean id="order" class="com.example.Order" />
Order ID: <jsp:getProperty name="order" property="orderId" /><br>
Order Date: <jsp:getProperty name="order" property="orderDate" />
```

2) **사용자의 이메일 주소 표시:**
```jsp
<jsp:useBean id="user" class="com.example.User" />
Email: <jsp:getProperty name="user" property="email" />
```

3) **간단한 계산기 구현:**
   - **CalcVO.java (Java Bean)**
     ```java
     public class CalcVO {
         private int num1;
         private int num2;
         // getters and setters
     }
     ```
   - **계산기 JSP 페이지**
     ```jsp
     <jsp:useBean id="calc" class="com.example.CalcVO" />
     <jsp:setProperty name="calc" property="*" />
     Sum: <%= calc.getNum1() + calc.getNum2() %><br>
     Difference: <%= calc.getNum1() - calc.getNum2() %>
     ```

#### 4. useBean DAO 처리 예제
- **부서정보리스트와 부서정보등록 처리:**
   - JSP 페이지에서 `jsp:useBean` 태그를 사용하여 DAO 객체를 생성하고, 해당 객체의 메소드를 호출하여 부서 정보를 처리합니다.
   - 예를 들어, 부서 목록을 가져오는 메소드와 새로운 부서를 등록하는 메소드가 DAO 클래스에 구현되어 있다고 가정합니다.

#### 5. 쿠키와 세션의 차이점
- **쿠키 (Cookie):**
  - 클라이언트 측에 저장되는 작은 데이터 조각입니다.
  - 브라우저를 닫아도 유지되며, 만료 날짜/시간이 설정됩니다.
  - 예: 사용자의 로그인 상태, 환경 설정 등을 저장할 때 사용됩니다.

  **쿠키 설정 예제:**
  ```java
  Cookie cookie = new Cookie("username", "JohnDoe");
  cookie.setMaxAge(60*60*24); // 1 day
  response.addCookie(cookie);
  ```

- **세션 (Session):**
  - 서버 측에 저장되는 데이터로, 사용자별로 구분되어 관리됩니다.
  - 브라우저가 닫히거나 세션 타임아웃이 되면 종료됩니다.
  - 예: 사용자 인

증 정보 등을 저장할 때 사용됩니다.

  **세션 설정 예제:**
  ```java
  HttpSession session = request.getSession();
  session.setAttribute("username", "JohnDoe");
  ```

쿠키는 클라이언트 측에 정보를 저장하여 서버의 부담을 줄이는 반면, 보안이 약할 수 있습니다. 세션은 서버 측에 정보를 저장하여 보안이 강하지만, 서버의 부하가 증가할 수 있습니다.	
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
<script type="text/javascript">
	$(document).ready(function(){
	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>계산기</h2>
  <jsp:useBean id="calc" class="backendweb.z01_vo.Calculator"/>
  <jsp:setProperty property="*" name="calc"/>
  <h3>${calc.num01} ${calc.calStr} ${calc.num02} = ${calc.tot}</h3>	
</div>
<%-- 
num01, num02, cal ==> 숫자형 VO		
--%>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="숫자1입력" name="num01" value="${calc.num01 }" class="form-control mr-sm-2" />
	    <select name="cal"
	    	onchange="$('#frm01').submit();"
	    	class="form-control mr-sm-2" >
	    	<option value="-1">선택하세요</option>
	    	<option value="0"> + </option>
	    	<option value="1"> - </option>
	    	<option value="2"> × </option>
	    	<option value="3"> ÷ </option>
	    </select>
	    <script type="text/javascript">
	    	$("[name=cal]").val("${calc.cal}")
	    </script>
	    <input placeholder="숫자2입력" name="num02" " value="${calc.num02 }"   class="form-control mr-sm-2" />
	    <button class="btn btn-info" type="submit">계산</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
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