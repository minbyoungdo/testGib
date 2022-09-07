<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="com.oreilly.servlet.*" %>
<%@ page import ="com.oreilly.servlet.multipart.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename ="";
	String realFolder = getServletContext().getRealPath("/") + "upload2";
	System.out.println("경로확인---->"+realFolder);
	int maxSize=5*1024*1024;
	String encType ="utf-8";
	
	MultipartRequest multi=new MultipartRequest(request,realFolder,
	maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition =multi.getParameter("condition");
	
	/* String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition =request.getParameter("condition"); */

	
	Integer price;
	if(unitPrice.isEmpty())
		price =0;
	else
		price =Integer.valueOf(unitPrice);
	long stock;
	if(unitsInStock.isEmpty())
		stock=0;
	else
		stock= Long.valueOf(unitsInStock);
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	ProductRepository dao =ProductRepository.getInstance();
	
	Product newProduct =new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	
	//jcdb 데이터베이스와jsp 연동 파트
	PreparedStatement pstmt=null;
	String sql ="insert into product values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2,name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setString(6, manufacturer);
	pstmt.setLong(7,stock);
	pstmt.setString(8, condition);
	pstmt.setString(9,fileName);
	pstmt.executeUpdate();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("products.jsp");
%>