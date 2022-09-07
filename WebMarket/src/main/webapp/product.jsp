<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <%@ page import ="dto.Product" %>
<%@ page import ="dao.ProductRepository" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<jsp:useBean id="productDAO" class ="dao.ProductRepository" scope = "session"/> --%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart()
	{
		if(confirm("상품을 장바구니에 추가하시겟습니까?"))
			document.addForm.submit();
		else
			document.addForm.reset();
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class ="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
<%-- 	<%
		String id = request.getParameter("id");
		ProductRepository dao =ProductRepository.getInstance();
		//Product product =dao.getProductById(id);
		Product product = productDAO.getProductById(id);
	%> --%>
	<%@ include file="dbconn.jsp" %>
	<% 
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class ="container">
		<div class="row">
			<div class="col-md-5">
				<%-- <img src ="./upload2/<%=product.getFilename()%>" style ="width: 100%"> --%>
				<img src ="./upload2/<%=rs.getString("p_fileName")%>" style ="width: 100%">
			</div>
			<div  class="col-md-6">
				<%-- <h3><%=product.getPname() %></h3> --%>
				<h3><%=rs.getString("p_name") %></h3>
				<%-- <p><%= product.getDescription() %></p> --%>
				<p><%= rs.getString("p_description") %></p>
				<p> <b>상품 코드 : </b> <span class ="badge badge-danger">
				<%-- <%=product.getProductId() %></span> --%>
				<%=rs.getString("p_id") %></span>
				<%-- <p> <b>제조사</b> : <%=product.getmanufacturer() %> --%>
				<p> <b>제조사</b> : <%=rs.getString("p_manufacturer") %>
				<p> <b>분류</b> : <%=rs.getString("p_category") %>
				<%-- <p> <b>재고 수</b> : <%=product.getUnitsInStock() %> --%>
				<p> <b>재고 수</b> : <%=rs.getInt("p_unitsInStock") %>
				<%-- <h4><%=product.getUnitPrice() %>원</h4> --%>
				<h4><%=rs.getInt("p_unitPrice") %>원</h4>
				<p> <form name ="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id") %>" method ="post">
					<a href ="#" class="btn btn-info"  onclick ="addToCart()">상품 주문 &raquo;</a>
					<a href ="./cart.jsp" class ="btn btn-warning">장바구니 &raquo;</a>
					<a href ="./products.jsp" class ="btn btn-secondary">상품 목록 &raquo;</a>
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
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>