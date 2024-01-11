<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직종 등록</title>

</head>
<body>
<!-- form태그, 입력양식태그를 이용해서 신규직종 입력폼을 구성 -->	
	<h1>신규 직종 입력폼</h1>
	
	<form action="add.jsp" method="post">
		<div>
			<label>아이디	</label><br>
			<input type="text" name="id"  />
		</div>
		<div>
			<label>직종 제목</label><br>
			<input type="text" name="title" />
		</div>
		<div>
			<label>직종 최소 급여</label><br>
			<input type="number" name="minSalary" min="1000" max="30000" step="100" value="1000" />
		</div>
		<div>
			<label>직종 최대 급여</label><br>
			<input type="number" name="maxSalary" min="1000" max="30000" step="100" value="1000" />
		</div>
		<button>등록</button>
	</form>

</body>
</html>