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
		String sql = "select * from food";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload/<%=rs.getString("imagefile") %>" style="width:500px; height: auto;">
			</div>
			<div class="col-md-6">
				<h3>식당명 : </h3>
				<p><b>식당 주소 : </b><%=rs.getString("name") %></p>
				<p><a href= "<%=rs.getString("map")%>">카카오 맵 이동</a></p>
				<p>전화번허 : rs.getString("name")</p>
				<p>등록번호 : rs.getString("name")</p>
				<p>추천 메뉴(가격) : rs.getString("name")</p>
				<p>기타 메뉴 : rs.getString("name")</p>
				<p> <form name ="addForm" action="./addFavorite.jsp?name=<%=rs.getString("name") %>" method ="post">
					<a href ="./Favorite.jsp" class ="btn btn-warning">즐겨찾기 &raquo;</a>
					<a href ="./MainHome.jsp" class ="btn btn-secondary">상위 메뉴 &raquo;</a>
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