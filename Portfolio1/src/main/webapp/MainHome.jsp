<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>

<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<meta charset="utf-8">
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
<title>MainHome</title>
</head>
<body>
<%@ include file="./menu.jsp" %>
<div class="jumbotron">
	<div class="container">
		<h1 class="dsiplay-3" align="center">맛집 탐방 부산 서면편</h1>
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
				<c:forEach var="row" items="${resultSet.rows}">
      			<c:if test="${row.power eq 1}">
				<li class="nav-item"><a class="nav-link" href="./addfood.jsp">식당 추가</a></li>
				</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</nav>
<div class= "container">
	<div class = "row" align ="center">
		<div class ="col-md-4">
			<a href="./foods.jsp?category=100"><img src="./resources/images/p2.PNG" style="width:360px; height:250px"></a>
		</div>
		<div class ="col-md-4">
			<a href="./foods.jsp?category=200"><img src="./resources/images/p6.PNG" style="width:360px; height:250px"></a>
		</div>
		<div class ="col-md-4">
			<a href="./foods.jsp?category=300"><img src="./resources/images/p9.PNG" style="width:360px; height:250px"></a>
		</div>
		<div class ="col-md-4">
			<a href="./foods.jsp?category=400"><img src="./resources/images/p11.PNG" style="width:360px; height:250px"></a>
		</div>
		<div class ="col-md-4">
			<a href="./foods.jsp?category=500"><img src="./resources/images/p16.PNG" style="width:360px; height:250px"></a>
		</div>
	</div>
	<hr>
</div>
</body>
</html>