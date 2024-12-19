<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var result = "${result}";
	if (result != "") {
		alert(result)
	}
</script>
<style>
table {
	border-collapse: collapse;
	color: deeppink;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<a class="btn btn-success" href="Insert.do">신규 부서 등록(일반)</a>
	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#myModal">신규 부서 등록(모달)</button>
	<hr>
	<h1>부서목록</h1>
	<table border="1">
		<tr>
			<td>부서번호</td>
			<td>부서이름</td>
			<td>매니저번호</td>
			<td>지역번호</td>
		</tr>
		<c:forEach items="${deptList}" var="dept">
			<tr>
				<td><a href="deptDetail.do?deptid=${dept.department_id}">${dept.department_id}</a></td>
				<td>${dept.department_name}</td>
				<td>${dept.manager_id}</td>
				<td>${dept.location_id}</td>
				<td><button
						onclick="location.href='delete.do?deptid=${dept.department_id}'">삭제1</button></td>
				<td>
					<form action="delete.do" method="post">
						<input type="hidden" name="deptid" value="${dept.department_id}">
						<button>삭제2</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="deptInsert.do" method="post">
						<div class="input-group mb-3">
							<span class="input-group-text">부서번호</span> <input type="number"
								required="required" class="form-control" placeholder="숫자입력"
								name="department_id">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">부서이름</span> <input type="text"
								required="required" class="form-control" name="department_name">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">부서장</span> <input type="number"
								required="required" class="form-control" value="101"
								name="manager_id">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text">지역번호</span> <input type="number"
								required="required" class="form-control" value="1700"
								name="location_id">
						</div>

						<button type="submit" class="btn btn-primary">신규부서 등록</button>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>