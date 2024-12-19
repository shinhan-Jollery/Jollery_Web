<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../common/header.jsp"%>
<fmt:setLocale value="en_US" />
<table class="table table-striped table-hover">
	<tr>
		<td>순서</td>
		<td>직원번호</td>
		<td>first_name</td>
		<td>급여</td>
		<td>부서</td>
		<td>도시</td>
		<td>국가</td>
	</tr>
	<c:forEach items="${empDatas}" var="emp" varStatus="status">
		<tr>
			<td>${status.count}
			<td><a href="${path}/emp/detail.do?empid=${emp.employee_id}">${emp.employee_id}</a>
			</td>
			<td><a href="${path}/emp/detail.do?empid=${emp.employee_id}">${emp.first_name}</a>
			</td>
			<td>${emp.salary}</td>
			<td>${emp.department_name}</td>
			<td>${emp.city}</td>
			<td>${emp.country_name}</td>
		</tr>
	</c:forEach>
</table>