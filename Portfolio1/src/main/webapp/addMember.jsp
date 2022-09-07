<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel ="stylesheet" href ="../resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="#">
<title>회원 가입 페이지</title>
</head>
<body>
<jsp:include page ="./menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">회원 가입</h1>
	</div>
	<div class="container">
		<form name = "addMenber" class="form-horizontal" action="processAddMenber.jsp" method="post">
			<div class="form-group row">
				<label class="col-sm-2">*아이디 : </label>
				<div class="col-sm-3"><input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력하시오." autofocus></div>
			</div>
				<div class ="form-group row">
				<label class="col-sm-2">*비밀번호 : </label>
				<div class="col-sm-3"><input name ="password" id="password" type="password" class="form-control"placeholder="비밀번호를 입력하시오."></div>
				</div>
				<div class ="form-group row">
				<label class="col-sm-2">*비밀번호 확인 : </label>
				<div class="col-sm-3"><input name ="password2" id="password2" type="password" class="form-control" placeholder="비밀번호를 다시 입력하시오."></div>
				</div>
				<div class ="form-group row">
				<label class="col-sm-2">*성명 : </label>
				<div class="col-sm-3"><input name ="name" id="name" type="text" class="form-control"placeholder="성명를 입력하시오."></div>
				</div>
				<div class ="form-group row">
				<label class="col-sm-2">성별 : </label>
				<div class="col-sm-3"><input type="radio" name ="gender" value="m">남<input type="radio" name ="gender"value="f">여</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">생일 : </label>
				<div class="col-sm-1"><input type="text" name ="year" style="width:90px"placeholder="yyyy"></div>
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
			<div class="col-sm-3"><input type="text" name ="address"></div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>