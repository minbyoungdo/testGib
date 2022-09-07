<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate= new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:orcl" 
	driver="oracle.jdbc.driver.OracleDriver" user="market" password="market" /> 
	
<sql:update dataSource="${dataSource}" var="resultSet">
	INSERT INTO member VALUES(?,?,?,?,?,?,?,?,?);
	<sql:param value="<%=id %>"/>
	<sql:param value="<%=password %>"/>
	<sql:param value="<%=name %>"/>
	<sql:param value="<%=gender %>"/>
	<sql:param value="<%=birth %>"/>
	<sql:param value="<%=email %>"/>
	<sql:param value="<%=phone%>"/>
	<sql:param value="<%=address %>"/>
	<sql:param value="<%=timestamp %>"/>
</sql:update>