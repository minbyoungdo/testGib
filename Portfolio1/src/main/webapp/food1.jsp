<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<script type="text/javascript">
	function addtoList()
	{
		if(confirm("즐겨찾기에 추가하시겟습니까?"))
			document.addForm.submit();
		else
			document.addForm.reset();
	}
</script>
<title>상세 정보</title>
</head>
<body>
<jsp:include page="./menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class ="container">
			<h1 class="display-3">상세 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<% 
		String name = request.getParameter("name");
		String sql = "select * from food where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,name);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<img src="./resources/images/<%=rs.getString("imagefile") %>" style="width:500px; height: auto;">
			</div>
			<div class="col-md-5">
				<h3>식당명 : </h3>
				<p><b>식당 주소 : </b><%=rs.getString("name") %></p>
				<p><a href= "<%=rs.getString("map")%>">카카오 맵 이동</a></p>
				<p>전화번허 :<%= rs.getString("phone")%></p>
				<p>추천 메뉴(가격) :<%= rs.getString("bestfood")%></p>
				<p>기타 메뉴 :<%= rs.getString("otherfood")%></p>
				<p>평 점 :<%= rs.getString("grade")%></p>
				<p> <form name ="addForm" action="./addFavorite.jsp?name=<%=rs.getString("name") %>" method ="post">
					<a href ="./Favorite.jsp" class ="btn btn-warning">즐겨찾기 &raquo;</a>
					<a href ="./foods.jsp?category=<%=rs.getString("foodcategory") %>" class ="btn btn-secondary">상위 메뉴 &raquo;</a>
					</form>
			</div>
		</div>
	</div>
	<% 
		} 
		if( rs!= null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	%> 
</body>
</html>