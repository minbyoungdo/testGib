<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password= request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String birth = year+"-"+month+"-"+day;
	String mail1= request.getParameter("email");
	String mail2 = request.getParameter("email2");
	String mail = mail1+"@"+mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:orcl"
	driver="oracle.jdbc.driver.OracleDriver"
	user ="market" password="market"/>

<sql:update dataSource="${dataSource}" var="resoultSet">
UPDATE USERS SET PASSWORD=?,NAME=?,GENDER=?,BIRTH=?,MAIL=?,PHONE=?,ADDRESS=? WHERE ID=?
<sql:param value="<%= password%>"/>
<sql:param value="<%= name%>"/>
<sql:param value="<%= gender%>"/>
<sql:param value="<%= birth%>"/>
<sql:param value="<%= mail%>"/>
<sql:param value="<%= phone%>"/>
<sql:param value="<%= address%>"/>
<sql:param value="<%= id%>"/>
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultUserPage.jsp?msg=0"/>
</c:if>

