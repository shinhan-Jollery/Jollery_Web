<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>업무선택</h1>
	<ul>
		<li><a href="${path}/auth/login.do">로그인</a></li>
		<li><a href="${path}/emp/empList.do">직원조회</a></li>
		<li><a href="${path}/emp/empInsert.do">직원입력</a></li>
		<li><a href="${path}/dept/deptList.do">부서조회</a></li>
		<li><a href="${path}/dept/deptInsert.do">부서입력</a></li>
	</ul>
</body>
</html>