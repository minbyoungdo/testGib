<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String category=(String)request.getParameter("category");
%>
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
<nav class ="navbar navbar-expand navbar-dark bg-primary">
	<div class="container">
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class ="nav-link" href="./foods.jsp?category=100">한식</a></li>
				<li class="nav-item"><a class="nav-link" href="./foods.jsp?category=200">중식</a></li>
				<li class="nav-item"><a class="nav-link" href="./foods.jsp?category=300">일식/돈까스</a></li>
				<li class="nav-item"><a class="nav-link" href="./foods.jsp?category=400">뷔페</a></li>
				<li class="nav-item"><a class="nav-link" href="./foods.jsp?category=500">햄버거</a></li>
			</ul>
		</div>
	</div>
</nav>
<div class= "container">
	<div class = "row" align ="center">
	<%@ include file="dbconn.jsp" %>
		<%
			String sql = "select * from food where foodcategory = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,category);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
		<div class ="col-md-4">
			<img src="./upload/<%=rs.getString("imagefile") %>" style="width:350px; height:250px">
			<h3>식당명 :  <%=rs.getString("name")%></h3>
			<p>추천 메뉴 : <%=rs.getString("bestfood") %></p>
			<p>평점 : <%=rs.getString("grade") %></p>
			<p><a href="./food1.jsp?name=<%=rs.getString("name")%>" class="btn btn-info" role ="button">상제정보 &raquo;</a></p>
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
	</div>
	<hr>
</div>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>