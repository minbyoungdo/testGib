<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id =request.getParameter("id");
	String password= request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String birth = year+"-" +month+"-"+day;
	String email1 = request.getParameter("email");
	String email2 = request.getParameter("email2");
	String email = email1+"@"+email2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	//가입날짜?
/* 	java.sql.Date currentDatetime = new java.sql.Date(System.currentTimeMillis());
	java.sql.Date sqlDate= new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime()); */
	java.util.Date currentDatetime = new java.util.Date(System.currentTimeMillis());
	java.sql.Date sqlDate= new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
	
	String sql = "insert into users values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, email);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
	pstmt.setInt(9, 0);//관리자는 1 나머지 숫자는 유저
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("MainHome.jsp");
%>
