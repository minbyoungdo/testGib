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
<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class ="container">
			<h1 class="display-3">상세 정보</h1>
		</div>
	</div>
	<%-- 	<%
		String id = request.getParameter("id");
		ProductRepository dao =ProductRepository.getInstance();
		//Product product =dao.getProductById(id);
		Product product = productDAO.getProductById(id);
	%> --%>
<%-- 	<%@ include file="dbconn.jsp" %>
	<% 
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%> --%>
	<div class="container">
		<div class="row">
			<div clas="col-md-5">
				<img src="./resources/images/P1234.png" style="width:500px; height: auto;">
			</div>
			<div class="col-md-6">
				<%-- <h3>식당명 : <%=product.getPname()%></h3>
				<h3>식당명 : <%=rs.getString("p_filename")%></h3> --%>
				<h3>식당명 : </h3>
				<p><b>식당 주소 : </b> ㅋㅋ</p>
				<p><a href="#">카카오 맵 이동</a></p>
				<p>전화번허 : </p>
				<p>등록번호 : </p>
				<p>추천 메뉴(가격) : </p>
				<p>기타 메뉴 : </p>
				<p> <form name ="addForm" action="#<%-- ./addCart.jsp?id=<%=rs.getString("p_id") %> --%>" method ="post">
					<a href ="./cart.jsp" class ="btn btn-warning">즐겨찾기 &raquo;</a>
					<a href ="./products.jsp" class ="btn btn-secondary">상위 메뉴 &raquo;</a>
					</form>
			</div>
		</div>
	</div>
	<%-- 	<% 
		} 
		if( rs!= null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	%> --%>
</body>
</html>