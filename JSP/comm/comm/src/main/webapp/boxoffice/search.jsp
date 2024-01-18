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
<title>커뮤니티::박스오피스</title>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="movie" name="menu" />
	</jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<h1>날짜별 박스오피스 조회</h1>

				<form class="border bg-light px-3 py-2 my-3">
					<div class="row my-3">
						<label class="col-sm-2 col-form-label">날짜</label>
						<div class="col-sm-8">
							<input type="date" class="form-control" name="date" />
						</div>
						<div class="col-sm-2">
							<button onclick="getBoxoffice()" type="button"
								class="btn btn-primary">조회</button>
						</div>
					</div>
				</form>
				<table class="table" id="table-boxoffice">
					<thead>
						<tr>
							<th>순위</th>
							<th>영화제목</th>
							<th>개봉일</th>
							<th>관객수</th>
							<th>누적관객수</th>
							<th>누적매출액</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		function getBoxoffice() {
			
			let tbody = document.querySelector("#table-boxoffice tbody"); 
			tbody.innerHTML =""; // tbody를 아무것도없게 초기화 
			
			let input = document.querySelector("input[name=date]");
			let targetDate = input.value.replace(/-/g,'');
			let url= "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=" + targetDate;
			
			let xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
					let jsonText = xhr.responseText;
					let obj = JSON.parse(jsonText);
					
					let items = obj.boxOfficeResult.dailyBoxOfficeList;
					
					let htmlContent ="";
					for(let index = 0; index<items.length; index++) {
						let item = items[index];
						
						let rank = item.rank;
						let title = item.movieNm;
						let openDate = item.openDt;
						let dayAudienceCount = item.audiCnt;
						let totalAudienceCount = item.audiAcc;
						let totalSales = item.salesAcc;
						
						let tr=`
							<tr>
							<td>\${rank}</td>							
							<td>\${title}</td>							
							<td>\${openDate}</td>						
							<td>\${dayAudienceCount} 명</td>				
							<td>\${totalAudienceCount} 명</td>			
							<td>\${totalSales} 원</td>					
							</tr>
						`;
							htmlContent += tr;
					}
					tbody.innerHTML =htmlContent;
				}
			}
			xhr.open("GET", url);
			xhr.send();
			
		}
	</script>
</body>
</html>