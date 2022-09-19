<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	BoardDTO1 notice = (BoardDTO1) request.getAttribute("board");
	int number = notice.getNum();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String sessionId1 = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<sql:setDataSource var="dataSource"
url="jdbc:oracle:thin:@localhost:1521:orcl" 
driver="oracle.jdbc.driver.OracleDriver" user="market" password="market" />
<sql:query dataSource="${dataSource}" var="resultSet">
SELECT * FROM USERS WHERE ID =?
<sql:param value="<%=sessionId1 %>"/>
</sql:query>
<title>Board</title>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../menu.jsp"/>
	<main class="mt-2 pt-8">
	<div class="container" style="height:150px;">
		<h1 class="mt-3">게시글</h1>
		<div class="card mb-4">
			<div class="card-body">
				<form name="newUpdate" action="BoardUpdateAction.do?number=<%=notice.getNum()%>&pageNum=<%=nowpage %>
				&name=<%=notice.getName() %>"
			class="form-horizontal" method="post">
				<div class="row">
					<div class="col-sm-2">
						<label for="num" class="form-label">게시글 번호</label> <input type="text"
							class="form-control" id="num" name="num" value="<%=notice.getNum()%>"
							disabled>
					</div>
					<div class="col-sm-2">
						<label for="title" class="form-label">작성자</label> 
						<input type="text" class="form-control" id="name" name="name"
							value="<%=notice.getName()%>" disabled>
					</div>
					<div class="col-sm-2">
						<label for="hit" class="form-label">조회수</label> 
						<input type="text"  class="form-control" id="hit" name="hit"
							value="<%=notice.getHit()%>" disabled>
					</div>
				</div>
					<div class="mb-2">
						<label for="writer" class="form-label">제목</label> 
						<input type="text" class="form-control" id="subject1" name="subject1"
							value="<%= notice.getSubject() %>" >
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea class="form-control" id="content1" name="content1" cols="50" rows="5"
							><%=notice.getContent()%></textarea>
					</div>
					<div class="row">
					<div class="col-sm-4">
						<label for="regist_day" class="form-label">작성 시간</label> <input
							type="text" class="form-control" id="regist_day" name="regist_day"
							value="<%= notice.getRegist_day() %>" disabled>
					</div>
					<!-- </form><form action="../MainHome.jsp" class="form-horizontal" method="post"> -->
					<div  class="col-sm-4 " align ="center">
					<c:set var="userId" value="<%=notice.getId() %>"/>
					<c:if test="${sessionId==userId}">
						<p>
						<a href="BoardDeleteAction.do?number=<%=notice.getNum()%>& pageNum=<%=nowpage%>"
						class="btn btn-outline-danger">삭제</a>
						<input type="submit" class="btn btn-outline-success" value="수정">
					</c:if>
					<c:forEach var="row" items="${resultSet.rows}">
					<c:if test="${row.power==1}">
						<p>
						<a href="BoardDeleteAction.do?number=<%=notice.getNum()%>& pageNum=<%=nowpage%>"
						class="btn btn-outline-danger">삭제</a>
						<input type="submit" class="btn btn-outline-success" value="수정">
					</c:if>
					</c:forEach>
					<a href="./BoardListAction.do?pageNum=<%=nowpage %>" class="btn btn-outline-primary">목록</a>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
</body>
</html>