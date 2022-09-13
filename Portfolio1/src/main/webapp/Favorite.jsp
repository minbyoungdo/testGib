<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Food" %>
<%-- <%@ page import = "dao.ProductRepository" %>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<%
String FavoriteId = session.getId();
%>
<title>즐겨 찾기</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3">즐겨찾기</h1>
		</div>
	</div>
	<div class="container">
		<table class="table table-hover">
			<tr>
				<th>식당명</th>
				<th>카카오 맵</th>
				<th>추천메뉴</th>
				<th>평점</th>
			</tr>
			<%
			ArrayList<Food> FavoriteFoods = (ArrayList<Food>)session.getAttribute("FavoriteFoods");
					if(FavoriteFoods == null)
						FavoriteFoods= new ArrayList<Food>();
					for(int i=0; i<FavoriteFoods.size();i++)
					{
						Food f = FavoriteFoods.get(i);
			%>
			<tr>
				<td><%=f.getName() %></td>
				<td><%=f.getKakaomap() %></td>
				<td><%=f.getBestfood()%></td>
				<td><%= f.getGrade() %></td>
				<td><a href="./deleteCart.jsp?FavoriteId=<%=FavoriteId %>" class= "btn btn-danger">삭제하기</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<a href="./foods.jsp" class="btn btn-light">&laquo;상위 탭으로 이동</a>
	</div>
</body>
</html>