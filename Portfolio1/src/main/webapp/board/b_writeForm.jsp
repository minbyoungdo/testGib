<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%-- <sql:setDataSource var="dataSource" --%>
<%-- url = "jdbc:oracle:thin:@WIN-U920QAV753C:1522:xe"
driver="oracle.jdbc.driver.OracleDriver" user="sc" password="1234" /> --%>
<sql:setDataSource var="dataSource"
url="jdbc:oracle:thin:@localhost:1521:orcl" 
driver="oracle.jdbc.driver.OracleDriver" user="market" password="market" />
<sql:query dataSource="${dataSource}" var="resultSet">
SELECT * FROM USERS WHERE ID =?
<sql:param value="<%=sessionId %>"/>
</sql:query>
<title>Board</title>
</head>
<script type="text/javascript">
function chekForm()
{
	if(!document.newWrite.subject.value)
	{
		alert("제목을 입력하세요.");
		return false;
	}
	if(!document.newWrite.content.value)
	{
		alert("내용을 입력하세요.");
		return false;
	}
}
</script>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<c:forEach var="row" items="${resultSet.rows}">
	<div class="container">
		<form name ="newWrite" action="./BoardWriteAction.do?name=${row.name}"
		class="form-horizontal" method="post" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form=control" value="${sessionId}">
			<div class="form-group row">
				<label for="title" class="col-sm-2 control-label">작성자 id</label> 
				<div class="col-sm-3">
				<input type="text" class="form-control" id="id1" name="id1" disabled
				value="<c:out value="${row.id}"/>" >
				</div>
				<label for="title" class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
				<input type="text" class="form-control" id="name12" name="name12" disabled
				value="<c:out value="${row.name}"/>" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" placeholder="subject">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control" placeholder="content"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="reset" class="btn btn-primary" value="취소">
				</div>
			</div>
		</form>
	</div>
	</c:forEach>
</body>
</html>