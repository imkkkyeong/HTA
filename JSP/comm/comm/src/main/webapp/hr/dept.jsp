<%@page import="vo.Department"%>
<%@page import="java.util.List"%>
<%@page import="dao.HrDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1">
<!-- CDN으로 포함시키기 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>bootstrap</title>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="hr" name="menu" />
	</jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<h1>부서관리</h1>
				<div class="row">
					<div class="col-3">
<%
	HrDao hrDao = new HrDao();
	List<Department> deptList = hrDao.getAllDepartments();
%>
						<h3>부서목록</h3>
						<div class="list-group">
<%
	for(Department dept : deptList) {
%>

		<a href="" class="list-group-item list-group-item-action"
		onclick="getEmployees(<%=dept.getId()%>,event)"> <!-- 어떤걸 눌렀는지 알수있게 하는 코드 --> 
		<%=dept.getName() %> <!-- a태그 클릭하는 경우 -->
		</a>
<%
	}
%>
							
						</div>
					</div>
					<div class="col-9">
						<h3>사원목록</h3>
						<table class="table" id="table-employees">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>입사일</th>
									<th>직종</th>
									<th>급여</th>
								</tr>
							</thead>

							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function getEmployees(id,event){ /*아이디 전달받음*/
		event.preventDefault();
	
	
		/*
		목록의 active 삭제
		선택자가 매개변수일때만 .을 붙인다.? 이런것처럼 ?(".list-group-item.active") 
		*/
		let prevElement = document.querySelector(".list-group-item.active");
		if(prevElement) {
		prevElement.classList.remove("active");
		}
		
		let element = event.target;
		element.classList.add("active");
		
		let xhr = new XMLHttpRequest ();
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				/*
					jsonText
						[
							{"id":119,"firstName":"Karen","lastName":"Colmenares",
							"hireDate":"Aug 10, 2007, 12:00:00 AM","jobId":"PU_CLERK","salary":2500.0}
						
							{"id":119,"firstName":"Karen","lastName":"Colmenares",
								"hireDate":"Aug 10, 2007, 12:00:00 AM","jobId":"PU_CLERK","salary":2500.0}
							
							{"id":119,"firstName":"Karen","lastName":"Colmenares",
								"hireDate":"Aug 10, 2007, 12:00:00 AM","jobId":"PU_CLERK","salary":2500.0}
							
						]
				
				
				*/
				let jsonText = xhr.responseText;
				// arr에는 jsonText가 자바배열객체로 변환되어 대입된다.
				let arr = JSON.parse(jsonText);
				
				let htmlContent="";
				for(let index = 0; index < arr.length; index++) {
					// emp -> {id:100, firstName:"길동" lastName:" 홍",...}
					let emp = arr[index];
					
					let tr=`
					<tr>
						<td>\${emp.id}</td>
						<td>\${emp.firstName} ${emp.lastName}</td>
						<td>\${emp.hireDate}</td>
						<td>\${emp.jobid}</td>
						<td>\${emp.salary}</td>
					</tr> 
					`;
					
					htmlContent += tr;
				}
				document.querySelector("#table-employees tbody").innerHTML = htmlContent;
			}
		};
		
		xhr.open("GET","employees.jsp?deptId=" + id); // xhr 초기화
		xhr.send(); 					// 서버로 요청보내기
	}
</script>
</body>
</html>