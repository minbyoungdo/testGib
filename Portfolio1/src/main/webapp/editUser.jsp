<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<%-- <sql:setDataSource var="dataSource"
url="jdbc:oracle:thin:@localhost:1521:orcl" 
driver="oracle.jdbc.driver.OracleDriver" user="market" password="market" /> --%>
<sql:setDataSource var="dataSource"
url = "jdbc:oracle:thin:@WIN-U920QAV753C:1522:xe"
driver="oracle.jdbc.driver.OracleDriver" user="sc" password="1234" />
<sql:query dataSource="${dataSource}" var="resultSet">
SELECT * FROM USERS WHERE ID =?
<sql:param value="<%=sessionId %>"/>
</sql:query>
<title>회원 정보 수정/열람</title>
</head>
<body onload="init()">
<jsp:include page="/menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">회원 정보 열람/수정</h1>
	</div>
	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.mail}" />
	<c:set var="mail1" value="${mail.split('@')[0]}" />
	<c:set var="mail2" value="${mail.split('@')[1]}" />

	<c:set var="birth" value="${row.birth }" />
	<c:set var="year" value="${birth.split('-')[0]}" />
	<c:set var="month" value="${birth.split('-')[1]}" />
	<c:set var="day" value="${birth.split('-')[2]}" />
	<div class="container">
		<form name = "editMember" class="form-horizontal" action="./ProcesseditUser.jsp" method="post" onsubmit="return check()">
			<div class="form-group row">
				<label class="col-sm-2">아이디 : </label>
				<div class="col-sm-3"><input type="text" name="id" id="id" class="form-control"  value="<c:out value='${row.id}'/>"
				placeholder="아이디를 입력하시오." autofocus></div>
			</div>
				<div class ="form-group row">
				<label class="col-sm-2">비밀번호 : </label>
				<div class="col-sm-3"><input name ="password" id="password" type="password" value ="<c:out value='${row.password}'/>"
				 class="form-control"placeholder="비밀번호를 입력하시오."></div>
				</div>
				<div class ="form-group row">
				<label class="col-sm-2">비밀번호 확인 : </label>
				<div class="col-sm-3"><input name ="password_confirm" id="password_confirm" type="password" class="form-control" placeholder="비밀번호를 다시 입력하시오."></div>
				</div>
				<div class ="form-group row">
				<label class="col-sm-2">성명 : </label>
				<div class="col-sm-3"><input name ="name" id="name" type="text" value="<c:out value='${row.uname}'/>"
				class="form-control"placeholder="성명를 입력하시오."></div>
				</div>
				<div class ="form-group row">
				<label class="col-sm-2">성별 : </label>
				<div class="col-sm-3">
					<c:set var="gender" value="${row.gender}"/>
					<input name="gender" type="radio" value="남"	<c:if test="${gender.equals('남')}"> <c:out value="checked" /> </c:if> >남 
						<input name="gender" type="radio" value="여"	<c:if test="${gender.equals('여')}"> <c:out value="checked" /> </c:if> >여
				</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">생일 : </label>
				<div class="col-sm-1"><input type="text" name ="year" style="width:90px"placeholder="yyyy" value="${year}"></div>
				<div class="col-sm-1" align="center">
					<select name ="month">
					<option value="1"  <c:if test="${month.equals('1')}">selected</c:if>>1</option>
					<option value="2" <c:if test="${month.equals('2')}">selected</c:if>>2</option>
					<option value="3" <c:if test="${month.equals('3')}">selected</c:if>>3</option>
					<option value="4" <c:if test="${month.equals('4')}">selected</c:if>>4</option>
					<option value="5" <c:if test="${month.equals('5')}">selected</c:if>>5</option>
					<option value="6" <c:if test="${month.equals('6')}">selected</c:if>>6</option>
					<option value="7" <c:if test="${month.equals('7')}">selected</c:if>>7</option>
					<option value="8" <c:if test="${month.equals('8')}">selected</c:if>>8</option>
					<option value="9" <c:if test="${month.equals('9')}">selected</c:if>>9</option>
					<option value="10" <c:if test="${month.equals('10')}">selected</c:if>>10</option>
					<option value="11" <c:if test="${month.equals('11')}">selected</c:if>>11</option>
					<option value="12" <c:if test="${month.equals('12')}">selected</c:if>>12</option>
					</select>
					월
				</div>
				<div class="col-sm-0"><input type="text" name ="day" style="width:50px" size="4" value="${day}">일</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">이메일 : </label>
				<div class="col-sm-3"><input type="select" name ="email" value="${mail1}">@</div>
					<select>
					<option value="naver.com" name ="email2" <c:if test="${emmil2.equals('naver.com')}">selected</c:if>>naver.com</option>
					<option value="google.com" name="email2"<c:if test="${emmil2.equals('google.com')}">selected</c:if>>google.com</option>
					</select>
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">전화번호 : </label>
			<div class="col-sm-3"><input type="text" name ="phone"value="<c:out value='${row.phone}'/>"></div>
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">주소 : </label>
			<div class="col-sm-3"><input type="text" name ="address" value="<c:out value='${row.address}'/>"></div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정 "> 
					<a href="deleteUser.jsp" class="btn btn-danger">회원탈퇴</a>
				</div>
			</div>
		</form>
	</div>
</div>
</c:forEach>
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
	function checkForm() {
	    let form ="editMember";

	    if (!document.forms[form].elements["id"].value) 
	    {
	    	alert("아이디를 입력하세요.");
	    	return false;
	    }
	    if (!document.forms[form].elements["password"].value) 
	    {
	    	alert("비밀번호를 입력하세요.");
	    	return false;
	    }
	    if (document.forms[form].elements["password"].value != document.forms[form].elements["password2"].value) 
	    {
	    	alert("비밀번호를 동일하게 입력하세요.");
	    	return false;
	    }
	    if (!document.forms[form].elements["name"].value) 
	    {
	    	alert("반드시 이름을 입력하세요.");
	    	return false;
	    }
	}
</script>