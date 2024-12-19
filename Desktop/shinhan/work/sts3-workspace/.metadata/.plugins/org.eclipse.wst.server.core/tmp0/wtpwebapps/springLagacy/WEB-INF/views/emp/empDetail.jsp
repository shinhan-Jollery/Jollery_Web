<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>직원 수정</title>
<meta charset="utf-8">
<style>
h2 {
	background-color: deeppink;
}

[readonly] {
	background-color: lightgray;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<%@ include file="../common/header.jsp"%>
		<h2>직원 정보 수정</h2>
		<form action="detail.do" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text">직원번호</span> <input type="number"
					value="${empInfo.employee_id}" required="required"
					class="form-control" name="employee_id">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">first_name</span> <input type="text"
					value="${empInfo.first_name}" class="form-control"
					name="first_name">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">last_name</span> <input type="text"
					value="${empInfo.last_name}" required="required"
					class="form-control" name="last_name">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">이메일</span> <input type="text"
					value="${empInfo.email}" required="required" class="form-control"
					name="email">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">전화번호</span> <input type="text"
					value="${empInfo.phone_number}" class="form-control"
					name="phone_number">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">입사일</span> <input type="date"
					value="${empInfo.hire_date}" required="required"
					class="form-control" name="hire_date">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">직책</span> <select required="required"
					class="form-control" name="job_id">
					<c:forEach items="${jobList}" var="job">
						<option ${job.job_id == empInfo.job_id?'selected':''}
							value="${job.job_id}">${job.job_id}/${job.job_title}</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">급여</span> <input type="number"
					value="${empInfo.salary}" class="form-control" name="salary">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">commission</span> <input type="text"
					value="${empInfo.commission_pct}" pattern="[0]\.[0-9]{1,2}"
					class="form-control" name="commission_pct">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">상사번호</span> <select
					class="form-control" name="manager_id">
					<option value="-1">매니저없음</option>
					<c:forEach items="${managerList}" var="manager">
						<option ${empInfo.manager_id == manager.employee_id?'selected':''}
							value="${manager.employee_id}">${manager.first_name}/${manager.last_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">부서번호</span> <select
					class="form-control" name="department_id">
					<option value="-1">부서없음</option>
					<c:forEach items="${deptList}" var="dept">
						<option
							${empInfo.department_id == dept.department_id?'selected':''}
							value="${dept.department_id}">${dept.department_name}</option>
					</c:forEach>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">직원 정보 수정</button>
		</form>
	</div>
</body>
</html>