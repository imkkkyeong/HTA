<%@page import="hr.vo.Department"%>
<%@page import="java.util.List"%>
<%@page import="hr.dao.DepartmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- localhost/sample/hr/dept/list.jsp -->
</head>
<body>
	<h1>부서목록</h1>
	
<%
	DepartmentDao dao = new DepartmentDao();
	List<Department> departmentList = dao.getAllDepartment();
%>
	
	<ul>
<%
	for(Department dept : departmentList){
%>	
	<li><a href="detail.jsp?deptId=<%=dept.getId() %>"><%=dept.getName() %></a></li>	
<% 
	}
%>	

	</ul>
</body>
</html>