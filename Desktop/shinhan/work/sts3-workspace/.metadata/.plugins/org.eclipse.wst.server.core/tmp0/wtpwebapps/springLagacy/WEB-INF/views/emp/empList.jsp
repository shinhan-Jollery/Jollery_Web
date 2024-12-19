<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%@ include file="../common/header.jsp"%>
		<hr>
		<button id="btnSalary" class="btn btn-danger">조회(급여)</button>
		<button id="btnJob" class="btn btn-danger">조회(직책)</button>
		<button id="btnDept" class="btn btn-danger">조회(ㅂㅅ)</button>
		<button id="btnJobJoin" class="btn btn-danger">조회(직책조인)</button>
		<button id="btnArray" class="btn btn-danger">조회(ㅂㅅ배열)</button>
		<button id="btnTransfer" class="btn btn-danger">Transaction연습</button>
		<hr>
		<div class="input-group mt-5 mb-5">
			<span class="input-group-text">부서</span> <select class="form-control"
				name="department_id">
				<option value="-1">선택안함</option>
				<c:forEach items="${deptList}" var="dept">
					<option value="${dept.department_id}">
						${dept.department_name}</option>
				</c:forEach>
			</select> <span class="input-group-text">직책</span> <select required="required"
				class="form-control" name="job_id">
				<option value="-1">선택안함</option>
				<c:forEach items="${jobList}" var="job">
					<option ${job.job_id=='IT_PROG'?'selected':''}
						value="${job.job_id}">${job.job_id}/${job.job_title}</option>
				</c:forEach>
			</select> <span class="input-group-text">급여(이상)</span> <input type="number"
				class="form-control" name="salary" value="2000"> <span
				class="input-group-text">입사일(이후)</span> <input type="date"
				class="form-control" name="hire_date">

			<div class="input-group-text">
				<input class="form-check-input mt-0" type="checkbox" value="1"
					name="chkDate" aria-label="Checkbox for following text input"><span>모든일자</span>
			</div>
			<button id="btn_condition" class="btn btn-primary">조건조회</button>
		</div>

		<hr>
		<h1>직원List</h1>
		<div id="table_here"></div>
	</div>
	<script>
		$(function() {
			var result = "${resultMessage}";
			if (result != "") {
				alert(result);
			}

			var d = new Date();
			d.setFullYear(d.getFullYear() - 20);
			$('[name="hire_date"]').val(d.toISOString().split("T")[0]);
			$("#btn_condition").on("click", f_ajax);
			$("#btnSalary").on("click", f_salary);
			$("#btnJob").on("click", f_job);
			$("#btnDept").on("click", f_dept);
			$("#btnJobJoin").on("click", f_JobJoin);
			$("#btnArray").on("click", f_deptArray);
			$("#btnTransfer").on("click", f_transfer);
		});
		
		function f_transfer() {
			$.ajax({
				url : "${path}/emp/transfer.do",
				success : function(responseData) {
					alert(responseData);
				},
				error : function() {
				}
			});
		}

		function f_deptArray() {
			$.ajax({
				url : "${path}/emp/listByArray.do",
				data : {
					deptAry : [ 10, 60, 90 ]
				},
				success : function(responseData) {
					$("#table_here").html(responseData);
				},
				error : function() {
				}
			});
		}

		function f_salary() {
			$.ajax({
				url : "${path}/emp/listBySalary.do",
				data : {
					salary : $("input[name='salary']").val()
				},
				success : function(responseData) {
					$("#table_here").html(responseData);
				},
				error : function() {
				}
			});
		}

		function f_job() {
			$.ajax({
				url : "${path}/emp/listByJob.do",
				data : {
					job_id : $("select[name='job_id']").val()
				},
				success : function(responseData) {
					$("#table_here").html(responseData);
				},
				error : function() {
				}
			});
		}

		function f_dept() {
			$.ajax({
				url : "${path}/emp/listByDept.do",
				data : {
					deptid : $("select[name='department_id']").val()
				},
				success : function(responseData) {
					$("#table_here").html(responseData);
				},
				error : function() {
				}
			});
		}

		function f_JobJoin() {
			$.ajax({
				url : "${path}/emp/listByJobJoin.do",
				data : {
					job_id : $("select[name='job_id']").val()
				},
				success : function(responseData) {
					$("#table_here").html(responseData);
				},
				error : function() {
				}
			});
		}

		function f_ajax() {
			$.ajax({
				url : "${path}/emp/list2.do",
				type : "get",
				data : {
					"deptid" : $('[name="department_id"]').val(),
					"jobid" : $('[name="job_id"]').val(),
					"salary" : $('[name="salary"]').val(),
					"hdate" : $('[name="hire_date"]').val(),
					"chk" : $('[name="chkDate"]').prop("checked")
				},
				success : function(responseData) {
					//2.data를 받아서 HTML만들까?NO
					//3.JSP를 받아서 현재화면에 대치(replace)?OK
					$("#table_here").html(responseData);
				},
				error : function(err) {
					alert(err);
				}
			});
		}
	</script>
</body>
</html>