<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<%
	CategoryDao categoryDao = new CategoryDao();
// 전체 카테고리 이름 리스트
ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
// 추천 카테고리 이미지 리스트(4개)
ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
%>
<body>
	<div class="container">
		<div>
			<!-- 최상단 검색바 -->
			<div class="row">
				<div class="col">Goodee Shop</div>
				<div class="col">
					<form>
						<input type="text">
						<button type="submit">검색</button>
					</form>
				</div>
				<div class="col">
					<i class='fas fa-user-alt' style='font-size: 48px'></i> <i
						class='fas fa-shopping-cart' style='font-size: 48px'></i>
				</div>
			</div>
		</div>

		<div>
			<!-- 로그인/회원가입 메뉴바 -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<!-- Links -->
				<ul class="navbar-nav">
				<%
									
				%>

					<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
				</ul>
			</nav>
		</div>

		<div>
			<!-- 전체카테고리3 / 이미지 배너9 -->
			<div class="row">
				<div class="col-sm-3">
					<!-- 전체카테고리 -->
					<div class="btn-group-vertical">
						<%
							for (Category c : categoryList1) {
						%>
						<a href="" class="btn btn-primary"><%=c.categoryName%></a>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-sm-9">
					<img src="<%=request.getContextPath()%>/images/b1">
				</div>
			</div>
		</div>

		<!-- 추천 카테고리 이미지 링크 -->
		<div>
			<%
				for (Category c : categoryList2) {
			%>
			<a href=""> <img
				src="<%=request.getContextPath()%>/images/<%=c.categoryPic%>"
				class="rounded-circle" width="200" height="200">
			</a>
			<%
				}
			%>
		</div>

		<%
			Calendar today = Calendar.getInstance(); // new Calendar()
		%>
		<!-- 카테고리별 추천상품 -->
		<div>
			<h3>
				오늘의 추천 상품 <span class="badge badge-primary"> <%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH) + 1%>.<%=today.get(Calendar.DAY_OF_MONTH)%>
				</span>
			</h3>
			<div>
				<%
					for (Category c : categoryList1) {
				%>	
				<a href="" class="btn"><%=c.categoryName%></a>
				<%
					}
				%>
			</div>
		</div>

		<%
			ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectProductList();
		%>
		<!-- 상품 목록 6개 -->
		<table>
			<tr>
				<%
					int i = 0;
					for (Product p : productList) {
						i=i+1;
				%>
						<td>
							<div class="card" style="width: 400px">
								<img class="card-img-top" src="<%=request.getContextPath()%>/images/<%=p.productPic%>">
								<div class="card-body">
									<h4 class="card-title"><%=p.productName%></h4>
									<p class="card-text"><%=p.productPrice%></p>
								</div>
							</div>
						</td>
				<%
						if(i%3==0) {
				%>
							</tr><tr>
				<%			
						}
					}
				%>
			</tr>
		</table>
		
		<!-- 최근 공지 2개 -->
		<%
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
		%>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Notice n : noticeList) {
					%>
						<tr>
							<td><%=n.noticeId %></td>
							<td><%=n.noticeTitle %></td>
						</tr>
					<%
						}
					%>
	
				</tbody>
			
			</table>
		</div>
	</div>
</body>
</html>