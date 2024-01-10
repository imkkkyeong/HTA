<%@page import="hr.dto.EmpListDto"%>
<%@page import="java.util.List"%>
<%@page import="hr.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 목록</title>
	<style type = "text/css">
	a:link, a:visited{
			color : black;
	}
	
	a:link.active, a:visited.active {
		font_weight : bold;
		color: red;
	}
	</style>
</head>
<body>
	<h1>직원 목록</h1>
	
	<div>
		<a href="form.jsp">신규 직원 등록</a> 
		<!--  
		기준주소가 http://localhost/sample/hr/emp/ 가 있기때문에
		링크의 상대주소 : <a href="form.jsp> 만 적으면 된다. 
		 -->
	</div>
	
<%
	//요청 URL : http://localhost/sample/hr/emp/list.jsp?page=1
	
	// 한 화면에 표시할 데이터행의 개수를 결정한다.
	final int ROWS = 10;

	// 요청파라미터 값을 조회한다.
	int currentPage = Integer.valueOf(request.getParameter("page"));

	// 페이지번호에 맞는 조회범위 계산하기
	int start = (currentPage-1)*ROWS +1;
	int end = currentPage*ROWS;
	
	// EMPLOYEES테이블에 대한 CRUD작업이 구현된 EmployeeDao 객체를 생성한다.
	EmployeeDao employeeDao = new EmployeeDao();

	// 모든 직원정보를 조회하는 getEmployees() 메서드를 실행한다.
	List<EmpListDto> dtoList = employeeDao.getEmployees(start, end);
%>
	<table border="1" style="width: 100%;">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>입사일</th>
				<th>직종아이디</th>
				<th>소속부서명</th>
			</tr>
		</thead>
		<tbody>
<%
	for(EmpListDto dto : dtoList) {
%>
		
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getFirstName() %></td>
				<td><%=dto.getPhoneNumber() %></td>
				<td><%=dto.getHireDate() %></td>
				<td><%=dto.getJobId() %></td>
				<td><%=dto.getDepartmentName() %></td>
				<td><a href="detail.jsp?id=100">상세보기</a></td>
			</tr>
<%
	}
%>
		</tbody>
	</table>

<%

	// 한 화면에 표시할 페이지 개수를 결정한다.
	final int Pages = 5;
	// 현재 요청한 페이지가 포함된 블록번호를 계산한다.
	int currentBlock = (int)Math.ceil((double)currentPage/Pages);
	// 총 직원수를 조회하기
	int totalRows = employeeDao.getTotalRows();
	// 총 페이지 개수를 계산하기(ceil 값을 구한다. )
	int totalPages = (int)Math.ceil((double)totalRows/ROWS); 	
	// 총 블록 개수를 계산하기
	int totalBlocks = (int)Math.ceil((double)totalPages/Pages);
	// 화면에 출력할 페이지범위 조회하기
	int beginPage = (currentBlock-1)*Pages +1;
	int endPage =(currentBlock == totalBlocks?totalPages : currentBlock*Pages);
	

%>
	
	<p>
<% 
	if(currentPage >1) {
%>
		<a href="list.jsp?page=<%=currentPage-1 %>">이전</a>	
<%
	} else {
%>	
	<span>이전</span>
<%
 }
%>
<% 
	for (int num = beginPage; num <= endPage; num++) {
%>
  	<a href="list.jsp?page=<%= num %>" 
  	 class="<%= currentPage== num ? "active" : "" %>"><%=num %></a>
<%
  	}
%>
<% 
	if(currentPage < totalPages) {
%>
		<a href="list.jsp?page=<%=currentPage+1 %>">다음</a>  
		 <!--  이전과 다음은 for문 바깥에 있어야한다. -->
<%
	} else {
%>	
	<span>다음</span>
<%
	}
%>
	</p>

</body>
</html>