<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>부서 정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
h2 {
	color: aqua;
}

[readonly] {
	background-color: lightgray;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>부서 정보 수정</h2>
		<form action="deptDetail.do" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text">부서번호</span> <input type="number"
					value="${deptInfo.department_id}" readonly="readonly"
					class="form-control" name="department_id">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">부서이름</span> <input type="text"
					value="${deptInfo.department_name}" required="required"
					class="form-control" name="department_name">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">부서장</span> <input type="number"
					value="${deptInfo.manager_id}" required="required"
					class="form-control" name="manager_id">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">지역번호</span> <input type="number"
					value="${deptInfo.location_id}" required="required"
					class="form-control" name="location_id">
			</div>

			<button type="submit" class="btn btn-primary">부서 정보 수정</button>
		</form>
	</div>
</body>
</html>