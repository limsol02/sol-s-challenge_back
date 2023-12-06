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
# 자바빈(javaBeans)
1. 웹프로그래밍에서 데이터의 표현을 목적으로 사용한다.
2. 일반적인 구성 : VO개념과 동일
	1) 값을 저장하기 위한 필드
	2) 값을 수정하기 위한 setter
	3) 값을 읽기위한 getter
	
	[ex] 
	public class BeanClassName{
		private String value; // 값을 저장하기 위한 필드
		public BeanClassName(){} // 기본 생성자(반드시 선언할 것-에러 요주의)
		public String getValue(){
			필드값을 읽어오는 property
			return value;
		}
		public void setValue(String value){
			this.value=value
			필드값을 수정하기 위한 property
		}
	} 

# 자바빈 프로퍼티
1. 프로퍼티는 자바빈에 저장되어 있는 값을 표현
2. 메서드 이름을 사용해서 프로퍼티의 이름을 결정
3. 규칙 : 프로퍼티 이름이 propertyName인 경우
	- setter 프로퍼티 : public void setPropertyName(타입 변수)
	- getter 프로퍼티 : public 리턴타입 getPropertyName()
	- boolean 타입일 경우 getter에 get대신 is 사용 가능
	- 배열 지정 가능 : [ex] public void setNames(String []);
4. 읽기/쓰기
	- 읽기 전용 : get 또는 is 메서드만 존재하는 프로퍼티
	- 읽기/쓰기 : get/set 또는 is/set 메서드가 존재하는 프로퍼티

# <jsp:useBean> 태그
1. jsp에서 자바만 객체를 생성할 때 사용
2. 구현
	<jsp:useBean id="빈이름" class="패키지명.자바빈클래스이름" 
		scope="page|request|session|application">
	1) 속성
		id : jsp 페이지에서 자바빈 객체에 접근할 때, 사용할 이름
		class : 패키지 이름을 포함한 자바빈 클래스의 완전한 이름
		scope : 자바빈 객체가 저장될 영역 번위 지정
		[ex]
		<jsp:uesBean id="p01" class="vo.Person" scope="session"/>
		Person p01 = new Person();
		session.setAttribute("p01",p01);
3. 자바빈 객체의 프로타피 값 설정
	<jsp:setProperty name ="아이디명" property="프로퍼티명" value="할당값">
	1) name : 자바빈 객체의 이름, 위 useBean에 선언한 id명
	2) property : 값을 설정할 프로퍼티
	3) value : 프로퍼티의 값
	[ex]
	<jsp : setProperty name="p01" property="name" value="홍길동"/>
	==> 동일 ${p01.setName("홍길동")}
		<%
			p01.setName("홍길동")	
		%>
	<jsp:getProperty name="아이디명" property="프로퍼티명"/>
	[ex]
	<jsp:setProperty name="p01" property ="name"/>
	${p01.name}
	<%=p01.getNAme()%>
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
      <%-- 
      
      --%>   
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>uesBean활용</h2>
	<jsp:useBean id="p01" class="backendweb.z01_vo.Person" scope="session"/>
	<%-- 
	[동일한내용]
	Person p01 = new person();
	session.setAttribute("p01",p01);
	 --%>
	 <h3>객체 생성후, property호출 : ${p01.name}</h3>
	 <jsp:setProperty name="p01" property="name" value="홍길동"/>
	 <%-- 
	[동일한내용]
	p01.setName("홍길동")	 
	--%>
	<h3>set Property 호출 후, getProperty 호출 : ${p01.name}</h3>
	 <h3>get property 정석적인 호출 : 
	 <jsp:getProperty property="name" name="p01"/>
	 </h3>
	 
	 <a href="a02_showSession.jsp">세션 범위 확인</a>
	 <%--
	 ex) Member 클래스를 bean으로 설정하고, Member의 id와 name을 property
	 설정 호출하고, a02에서 출력확인
	  --%>
	 <jsp:useBean id="m01" class="backendweb.z01_vo.Member" scope="session"/>
	 <jsp:setProperty property="name" name="m01" value="홍길동"/>
	 <jsp:setProperty property="id" name="m01" value="himan"/>
</div>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="제목" />
       <input class="form-control mr-sm-2" placeholder="내용" />
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
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