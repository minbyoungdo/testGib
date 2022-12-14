<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO1"%>

<%
	BoardDTO1 notice = (BoardDTO1) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../menu.jsp"/>
	<main class="mt-2 pt-8">
	<div class="container" style="height:150px;">
		<h1 class="mt-3">게시글</h1>
		<div class="card mb-4">
			<div class="card-body">
				<form>
				<div class="row">
					<div class="col-sm-2">
						<label for="bno" class="form-label">num</label> <input type="text"
							class="form-control" id="bno" name="num" value="<%=notice.getNum()%>"
							disabled>
					</div>
					<div class="col-sm-2">
						<label for="title" class="form-label">작성자</label> 
						<input type="text" class="form-control" id="name" name="name"
							value="<%=notice.getName()%>" disabled>
					</div>
				</div>
					<div class="mb-2">
						<label for="writer" class="form-label">제목</label> <input
							type="text" class="form-control" id="subject" name="subject"
							value="<%= notice.getSubject() %>">
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea class="form-control" id="content" name="content" cols="50" rows="5"
							><%=notice.getContent() %></textarea>
					</div>
					<div class="row">
					<div class="col-sm-4">
						<label for="regist_day" class="form-label">작성 시간</label> <input
							type="text" class="form-control" id="regist_day" name="regist_day"
							value="<%= notice.getRegist_day() %>" disabled>
					</div>
					<div  class="col-sm-4 " align ="center">
					<c:set var="userId" value="<%=notice.getId() %>"/>
					<c:if test="${sessionId==userId}">
						<p>
						<input type="submit" class="btn btn-outline-success" value="수정 완료">
					</c:if>
					<a href="./BoardListAction.do?pageNum=<%=1 %>" class="btn btn-outline-primary">목록</a>
					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
</body>
</html>