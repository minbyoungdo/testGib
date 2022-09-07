<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel ="stylesheet" href ="../resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="#">
<script type="text/javascript">
function test()
{
	/* var test_id =document.getElementById("id").value;
	var p1 = document.getElementById('passwd').value;
	var p2 = document.getElementById('passwd2').value;
	var test_name= document.getElementById("name").value;
	if(test_id == ""   || passwd ==""  || passwd2 =="" || test_name == "" )
	{
		alert("아이디,비밀번호,이름은 반드시 입력해야 합니다.");
		return false;
	}
    if( p1 != p2 ) {
        alert("비밀번호가 일치 하지 않습니다");
        return false;
     } */
    
    let form1 =  "addMember";
//	let form2 = document.forms[form1];
//	let form3 = document.forms[form1].elements["id"];

if (!document.forms[form1].elements["id"].value) {
	alert("아이디를 입력하세요.");
	return false;
}

if (!document.newMember.password.value) {
	alert("비밀번호를 입력하세요.");
	return false;
}

if (document.newMember.password.value != document.newMember.password_confirm.value) {
	alert("비밀번호를 동일하게 입력하세요.");
	return false;
}
}
</script>
<title>회원 가입</title>
</head>

<body>
<jsp:include page="../menu.jsp"/>
	<div class ="jumbotron">
		<div class ="container">
		<h1 class ="display-3">회원가입</h1>
<%-- 		<%@ include file="../dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs= null;
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
			%> --%>
		</div>
	</div>
	<div class="container">
		<form name ="addMember"  class ="form-horizontal"
		action="processAddMember.jsp" method="post" onsubmit="return test()" >
			<div class ="form-group row">
			<label class="col-sm-2">아이디 : </label>
			<div class="col-sm-3"><input name ="id" id="id" type="text" class="form-control"  autofocus></div>
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">비밀번호 : </label>
			<div class="col-sm-3"><input name ="password" id="password" type="password" class="form-control"></div>
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">비밀번호 확인 : </label>
			<div class="col-sm-3"><input name ="password2" id="password2" type="password" class="form-control" ></div>
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">성명 : </label>
			<div class="col-sm-3"><input name ="name" id="name" type="text" class="form-control"></div>
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">성별 : </label>
			<div class="col-sm-3"><input type="radio" name ="gender" value="m">남<input type="radio" name ="gender"value="f">여</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">생일 : </label>
				<div class="col-sm-1"><input type="text" name ="year" style="width:90px"></div>
				<div class="col-sm-1" align="center">
					<select name ="month">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select>
					월
				</div>
				<div class="col-sm-0"><input type="text" name ="day" style="width:50px">일</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">이메일 : </label>
				<div class="col-sm-3"><input type="select" name ="email">@</div>
					<select>
					<option value="naver.com" name ="email2">naver.com</option>
					<option value="google.com" name="email2">google.com</option>
					</select>
				
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">전화번호 : </label>
			<div class="col-sm-3"><input type="text" name ="phone"></div>
			</div>
			<div class ="form-group row">
			<label class="col-sm-2">주소 : </label>
			<div class="col-sm-3"><input type="text" name ="adress"></div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
<%-- 	<%} %> --%>
</body>
</html>