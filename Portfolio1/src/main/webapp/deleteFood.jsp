<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	String name = (String)request.getParameter("name");
	String category =(String)request.getAttribute("category");
	System.out.println(category);
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:orcl" 
	driver="oracle.jdbc.driver.OracleDriver" user="market" password="market" /> 

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM food WHERE name = ?
   <sql:param value="<%=name%>" />
</sql:update>
<c:redirect url="./MainHome.jsp"/>

