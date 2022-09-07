<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<title>상품 목록</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class ="jumbotron">
	<div class =container>
		<h1 class ="display-3">식당 목록</h1>
	</div>
</div>
<div class= "container">
	<div class = "row" align ="center">
	<%-- <%@ include file="dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%> --%>
		<div class ="col-md-4">
		<img src="./resources/images/P1234.png" style ="width:100%; height: auto;">
		<h3>식당명 : </h3>
		<p>등록번호 : </p>
		<p>추천 메뉴(가격) : </p>
		</div>
		<div class ="col-md-4">
		<img src="./resources/images/P1235.png" style ="width:100%; height: auto;">
		<h3>식당명 : </h3>
		<p>등록번호 : </p>
		<p>추천 메뉴(가격) : </p>
		</div>
		<div class ="col-md-4">
		<img src="./resources/images/P1236.png"style ="width:100%; height: auto;">
		<h3>식당명 : </h3>
		<p>등록번호 : </p>
		<p>추천 메뉴(가격) : </p>
		</div>
		<%-- <% 
		} 
		if( rs!= null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
		%> --%>
	</div>
	<hr>
</div>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>