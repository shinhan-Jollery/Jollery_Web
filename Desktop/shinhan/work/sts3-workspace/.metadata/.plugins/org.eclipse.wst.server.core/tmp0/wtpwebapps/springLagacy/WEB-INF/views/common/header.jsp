<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
  #loginInfo {
     background-color: beige;
     border: 1px dotted gray;
  }
</style>	
<div id="loginInfo">
	<p>
	  <c:if test="${loginMember.member_name==null}">
	     손님이시군요~
	  </c:if>
	  <c:if test="${loginMember.member_name!=null}">
	     ${loginMember.member_name}님 환영합니다!!
	  </c:if>
	  <a href="${path}/auth/logout.do">로그아웃</a>
	</p>
</div>
<%-- <!-- request영역>session영역>application영역 -->
<!-- EL(Expression Language)의 내장객체 -->
1. ${company}<br>
2. ${requestScope.company}<br>
3. ${sessionScope.company}<br>
4. ${applicationScope.company}<br>

<!-- JSP내장객체이용 Expression  -->
2.<%=request.getAttribute("company") %><br>
3.<%=session.getAttribute("company") %><br>
4.<%=application.getAttribute("company") %> --%>




<%!
//멤버변수(instance field), 멤버메서드(instance method)를 만든다. 
String field1 = "instance field";
void method1(){
	
}
%>
<%
//local변수 
String myName = "AA";

/*
class Test{
	String field1 = "instance field";
	void _service(){
		String myName = "AA";
		out.write(myName);
	}
	void method1(){
		
	}
}
*/
%>
<%-- <%=myName %> --%>











