<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../common/header.jsp"%>
<fmt:setLocale value="en_US"/>
<table class="table table-striped table-hover">
	<tr>
		<td>순서</td>
		<td>직원번호</td>
		<td>first_name</td>
		<td>last_name</td>
		<td>email</td>
		<td>phone</td>
		<td>job</td>
		<td>hiredate</td>
		<td>commission</td>
		<td>salary</td>
		<td>manager</td>
		<td>department</td>
		<td>get요청</td>
		<td>post요청</td>
	</tr>
	<c:forEach items="${empDatas}" var="emp" varStatus="status">
		<tr>
			<td>${status.count}
			<td><a href="${path}/emp/detail.do?empid=${emp.employee_id}">${emp.employee_id}</a>
			</td>
			<td><a href="${path}/emp/detail.do?empid=${emp.employee_id}">${emp.first_name}</a>
			</td>
			<td>${emp.last_name}</td>
			<td>${fn:toLowerCase(emp.email)}</td>
			<td>${fn:replace(emp.phone_number, ".", "-")}</td>
			<td>${emp.job_id}</td>
			<td><fmt:formatDate type="date" dateStyle="full" value="${emp.hire_date}"/></td>
			<td>${emp.commission_pct}</td>
			<td><fmt:formatNumber type="currency" value="${emp.salary}"/></td>
			<td>${emp.manager_id}</td>
			<td>${emp.department_id}</td>
			<td>
				<button class="btn btn-success"
					onclick="location.href='${path}/emp/empDelete.do?empid=${emp.employee_id}'">
					삭제(get)</button>
			</td>
			<td>
				<form action="${path}/emp/empDelete.do" method="post">
					<input type="hidden" name="empid" value="${emp.employee_id}">
					<button class="btn btn-success">삭제(post)</button>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>