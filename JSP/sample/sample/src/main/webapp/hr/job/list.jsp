<%@page import="hr.vo.Job"%>
<%@page import="java.util.List"%>
<%@page import="hr.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직종 목록</title>
<!-- localhost/sample/hr/job/list.jsp -->
</head>
<body>
	<h1>직종 목록</h1>
	
<%
	// Jobs 테이블에 대한 CRUD 기능이 구현된 JobDao객체를 생성
	JobDao dao = new JobDao();
	// 모든 직종정보를 반환하는 getAllJobs() 메소드를 실행
	List<Job> jobList = dao.getAllJobs();
%>
	<ul>
	<!-- 조회된 모든 직종정보로 링크를 생성해서 응답으로 보낸다 -->
<%
	for(Job j : jobList){
%>	
		<li><a href="detail.jsp?id=<%=j.getId() %>"><%=j.getTitle() %></a></li>	
<% 
	}
%>	
	</ul>
	
	<div>
		<a href="form.jsp">신규 직종 등록</a>
	</div>
</body>
</html>