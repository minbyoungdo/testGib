<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<script type="text/javascript">
/* 	function addtoList()
	{
		if(confirm("즐겨찾기에 추가하시겟습니까?"))
			document.addForm.submit();
		else
			document.addForm.reset();
	} */
</script>
<%
	String sessionId2 = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
url="jdbc:oracle:thin:@localhost:1521:orcl" 
driver="oracle.jdbc.driver.OracleDriver" user="market" password="market" />
<%-- <sql:setDataSource var="dataSource"
url = "jdbc:oracle:thin:@WIN-U920QAV753C:1522:xe"
driver="oracle.jdbc.driver.OracleDriver" user="sc" password="1234" /> --%>
<sql:query dataSource="${dataSource}" var="resultSet">
SELECT * FROM USERS WHERE ID =?
<sql:param value="<%=sessionId2 %>"/>
</sql:query>
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
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<img src="./upload/<%=rs.getString("imagefile") %>" style="width:500px; height: auto;">
			</div>
			<div class="col-md-5">
				<h3>식당명 : </h3>
				<p><b>식당 주소 : </b><%=rs.getString("name") %></p>
				<p><a href= "<%=rs.getString("map")%>">카카오 맵 이동</a></p>
				<p>전화번허 :<%= rs.getString("phone")%></p>
				<p>추천 메뉴(가격) :<%= rs.getString("bestfood")%></p>
				<p>기타 메뉴 :<%= rs.getString("otherfood")%></p>
				<p>평 점 :<%= rs.getString("grade")%></p>
				<p> <form name ="addForm" action="./deleteFood.jsp?name=<%=rs.getString("name") %>" method ="post">
					<c:forEach var="row" items="${resultSet.rows}">
      				<c:if test="${row.power eq 1}">
					<a href ="./deleteFood.jsp?name=<%=rs.getString("name") %>" class ="btn btn-danger">삭제하기 &raquo;</a>
					</c:if></c:forEach>
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