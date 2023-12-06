<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
[1단계:개념] 1. c:forEach의 기본형식을 일반 카운트와 배열형데이터를 나누어서 예제와 함께 설명하세요
[1단계:확인] 2. 아래 내용을 <c:forEach><c:if>를 사용
		1) <c:forEach>를 사용하여 1부터 20까지의 숫자를 출력하되, 홀수일 때는 '홀수', 짝수일 때는 '짝수'라고 표시하세요."
		2) 구구단을 테이블로 출력하세요 
		3) 현재 달의 1일부터 마지막 날까지를 테이블 사용하여 타이틀은 요일 표시하여 날짜를 출력하세요.
[1단계:개념] 3. DB연동 후, <c:forEach> 처리하는 모듈 처리 순서를 기술하세요.
[1단계:확인] 4. <c:forEach>  사원정보 ename과 job으로 검색처리하여 출력하는 화면을 구현하세요
[1단계:개념] 5. <fmt:formatNumber>, <fmt:formatDate>의 속성과 속성값을 기본 예제를 통해서 기술하세요
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
	=================
  

### 1. `<c:forEach>`의 기본 형식

#### 일반 카운트
`<c:forEach>`는 주어진 범위 내에서 반복을 수행합니다. `begin`, `end`, `step` 속성을 사용하여 카운트를 제어할 수 있습니다.

**예제**:
```jsp
<c:forEach var="i" begin="1" end="5">
    Count: ${i}<br/>
</c:forEach>
```
이 코드는 1부터 5까지의 숫자를 출력합니다.

#### 배열형 데이터
배열이나 컬렉션을 반복 처리할 때 사용합니다. `items` 속성으로 반복할 데이터를 지정하고, `var` 속성으로 각 요소에 접근합니다.

**예제**:
```jsp
<c:forEach var="fruit" items="${fruits}">
    Fruit: ${fruit}<br/>
</c:forEach>
```
이 코드는 `fruits`라는 배열 또는 컬렉션의 각 요소를 출력합니다.

### 2. `<c:forEach>`와 `<c:if>` 사용 예제

#### 1) 홀수와 짝수 구분 출력
```jsp
<c:forEach var="num" begin="1" end="20">
    <c:choose>
        <c:when test="${num % 2 == 0}">
            ${num}는 짝수<br/>
        </c:when>
        <c:otherwise>
            ${num}는 홀수<br/>
        </c:otherwise>
    </c:choose>
</c:forEach>
```

#### 2) 구구단 테이블 출력
```jsp
<table>
    <c:forEach var="i" begin="1" end="9">
        <tr>
            <c:forEach var="j" begin="1" end="9">
                <td>${i} x ${j} = ${i*j}</td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>
```

#### 3) 현재 달의 날짜와 요일 출력
```jsp
<table>
    <tr>
        <th>일</th>
        <th>월</th>
        <th>화</th>
        <th>수</th>
        <th>목</th>
        <th>금</th>
        <th>토</th>
    </tr>
    <c:forEach var="date" begin="-4" end="${lastDayOfMonth+6}">
        <c:if test="${date == -4 || date % 7 == 3}">
            <tr>
        </c:if>
        <td>${date>0 and date<=lastDayOfMonth?date:''> </td>
        <c:if test="${date % 7 == 2}">
            </tr>
        </c:if>
    </c:forEach>
</table>
```
`lastDayOfMonth`와 `dayOfWeek`는 현재 달의 마지막 날과 각 날짜의 요일을 계산하는 로직이 필요합니다.

### 3. DB 연동 후 `<c:forEach>` 처리 순서

1. **DB 설정**: 데이터베이스 연결 설정을 진행합니다.
2. **SQL 작성**: 필요한 데이터를 조회하는 SQL 쿼리를 작성합니다.
3. **데이터 조회**: 서블릿 또는 JSP 페이지에서 SQL 쿼리를 실행하여 데이터를 조회합니다.
4. **데이터 저장**: 조회한 데이터를 request 또는 session 범위에 저장합니다.
5. **JSP에서 `<c:forEach>` 사용**: JSP 페이지에서 `<c:forEach>`를 사용하여 저장된 데이터를 순회하며 출력합니다.

### 4. `<c:forEach>`를 사용한 사원 정보 검색 출력

```jsp
<table>
    <tr>
        <th>이름</th>
        <th>직무</th>
    </tr>
    <c:forEach var="employee" items="${employees}">
        <tr>
            <td>${employee.ename}</td>
            <td>${employee.job}</td>
        </tr>
    </c:forEach>
</table>
```
`employees`는 검색 결과를 담은 컬렉션입니다.

### 5. `<fmt:formatNumber>`, `<fmt:formatDate>` 속성과 예제

#### `<fmt:formatNumber>`
- **

`type`**: 'number', 'currency', 'percent' 중 하나를 지정합니다.
- **`pattern`**: 숫자 포맷을 지정합니다.
- **`currencyCode`**: 통화 코드를 지정합니다.

**예제**:
```jsp
<fmt:formatNumber value="${salary}" type="currency" currencyCode="USD"/>
```
이 코드는 `salary` 값을 미국 달러로 포맷합니다.

#### `<fmt:formatDate>`
- **`pattern`**: 날짜/시간 포맷을 지정합니다.
- **`type`**: 'date', 'time', 'both' 중 하나를 지정합니다.
- **`dateStyle`/`timeStyle`**: 'short', 'medium', 'long', 'full' 중 하나를 지정합니다.

**예제**:
```jsp
<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 EEEE" type="date"/>
```
이 코드는 `today` 날짜를 '연도 월 일 요일' 형식으로 포맷합니다.
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
  <h2>12월 달력</h2>

</div>
<%-- 
		
--%>
<div class="container">
   <table class="table table-hover table-striped">
   	<col width="1/7">
   	<col width="1/7">
   	<col width="1/7">
   	<col width="1/7">
   	<col width="1/7">
   	<col width="1/7">
   	<col width="1/7">
    <thead>
    
      <tr class="table-success text-center">
        <th>일</th>
        <th>월</th>
        <th>화</th>
        <th>수</th>
        <th>목</th>
        <th>금</th>
        <th>토</th>
      </tr>
    </thead>	
    <fmt:formatDate value="<%=new Date()%>" var="toDay" pattern="dd"/>
    <c:set var="lastDayOfMonth" value="31"/>
    <tbody>
	     <c:forEach var="date" begin="1" end="${lastDayOfMonth}" varStatus="sts">
	        <c:if test="${date == 1 or date % 7 == 3}">
	            <tr>
	        </c:if>
	        <c:if test="${sts.first}">
	        	<c:forEach var="lstDate" begin="26" end="30">
	        		<td>${lstDate}</td>
	        	</c:forEach>
	        </c:if>
	        <td style="background:${toDay==date?'yellow':''}">${date} </td>
	        <c:if test="${sts.last}">
	        	<c:forEach var="firstDate" begin="1" end="6">
	        		<td >${firstDate}</td>
	        	</c:forEach>
	        </c:if>	        
	        
	        <c:if test="${date % 7 == 2}">
	            </tr>
	        </c:if>
	    </c:forEach>   
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