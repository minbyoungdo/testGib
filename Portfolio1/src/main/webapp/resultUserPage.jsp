<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>유저 결과창</title>
</head>
<body>
<jsp:include page="./menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3" align = "center">*%~~~%*</h1>
	</div>
	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");
			if(msg!= null)
			{
				if(msg.equals("0"))//정보 수정
				{
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				}
				else if(msg.equals("1"))//삭제
				{
					out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
				}
				else if(msg.equals("2"))//로그인 실패
				{
					out.println("<h2 class='alert alert-danger'>로그인에 실패하셧습니다.</h2>");
				}
			}
		%>
	</div>
</div>
</body>
</html>