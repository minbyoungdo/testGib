<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "market";
		String password = "market";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");//이게 어디서 나왔더라?
		conn = DriverManager.getConnection(url,user,password);
	}
	catch(SQLException ex)
	{
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: "+ex.getMessage());
	}
%>