<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String filename ="";
	String realFolder = getServletContext().getRealPath("/") + "upload";
	System.out.println("경로확인---->"+realFolder);
	int maxSize=5*1024*1024;
	String encType ="utf-8";

	MultipartRequest multi=new MultipartRequest(request,realFolder,
			maxSize, encType, new DefaultFileRenamePolicy());
	
	/* String name = request.getParameter("name");
	System.out.println(name);
	String address = request.getParameter("address");
	String map = request.getParameter("map");
	String phone =request.getParameter("phone");
	String bestFood =request.getParameter("bestfood");
	String otherFood =request.getParameter("foods");
	String Advantage= request.getParameter("adv");
	String grade =request.getParameter("grade");
	int i_grade =Integer.parseInt(grade);
	String category = request.getParameter("category");
	 */
	String name = multi.getParameter("name");
	String address = multi.getParameter("address");
	String map = multi.getParameter("map");
	String phone =multi.getParameter("phone");
	String bestFood =multi.getParameter("bestfood");
	String otherFood =multi.getParameter("foods");
	String Advantage= multi.getParameter("adv");
	String grade =multi.getParameter("grade");
	
	int i_grade =Integer.parseInt(grade);
	String category = multi.getParameter("category");
	System.out.println(category);
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql ="insert into food values(?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2, map);
	pstmt.setString(3, address);
	pstmt.setString(4, bestFood);
	pstmt.setString(5, otherFood);
	pstmt.setString(6,fileName);
	pstmt.setString(7, phone);
	pstmt.setString(8, Advantage);
	pstmt.setInt(9,i_grade);
	pstmt.setString(10,category);
	
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("MainHome.jsp");
%>