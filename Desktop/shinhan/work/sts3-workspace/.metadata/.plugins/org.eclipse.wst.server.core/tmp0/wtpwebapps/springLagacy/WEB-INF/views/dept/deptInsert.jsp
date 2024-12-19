<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
</head>
<body>
	<div class="container mt-3">
	<%@ include file="../common/header.jsp" %>
		<h2>부서등록</h2>
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
			<button id="btn_ajax" type="button" class="btn btn-danger">신규부서 등록(Ajax)</button>
		</form>
	</div>
	
<script>
$("#btn_ajax").on("click", f_jsonInsert);
function f_jsonInsert() {
	var obj = {
		"deptid":$('[name="department_id"]').val(),
		"deptname":$('[name="department_name"]').val(),
		"mid":$('[name="manager_id"]').val(),
		"locid":$('[name="location_id"]').val()
	};
	
	var jsonStr = JSON.stringify(obj);

	$.ajax({
		url:"${path}/json.do",
		type:"get",
		data:{"jsonInfo":jsonStr},
		success: function(responseData){
			alert(responseData);
		},
		error: function(err){
			alert(err);
		},
		complete:function(){
			slert("완료");
		}
	});
}
</script>
</body>
</html>
