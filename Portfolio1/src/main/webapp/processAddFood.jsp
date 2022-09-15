<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String filename = "";
	String realFolder = getServletContext().getRealPath("/") + "upload";
	System.out.println("경로확인---->"+realFolder);

	String encType = "utf-8"; 
	int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
		new DefaultFileRenamePolicy());
	
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String map = request.getParameter("map");
	String phone =request.getParameter("phone");
	String bestFood =request.getParameter("bestfood");
	String otherFood =request.getParameter("foods");
	String Advantage= request.getParameter("adv");
	String grade =request.getParameter("grade");
	int i_grade =Integer.parseInt(grade);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql ="insert into food values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2, address);
	pstmt.setString(3, map);
	pstmt.setString(4, phone);
	pstmt.setString(5, bestFood);
	pstmt.setString(6, otherFood);
	pstmt.setString(7, Advantage);
	pstmt.setString(8,fileName);
	pstmt.setInt(9,i_grade);
	
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("MainHome.jsp");
%>