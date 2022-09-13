<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="#">
<script type="text/javascript">
function check()
{
    let form ="addFood";

if (!document.forms[form].elements["name"].value) 
{
	alert("이름을 입력하세요.");
	return false;
}
if (!document.forms[form].elements["address"].value) 
{
	alert("주소를 입력하세요.");
	return false;
}
if (!document.forms[form].elements["bestfood"].value) 
{
	alert("추천 메뉴를 입력하세요.");
	return false;
}
if (!document.forms[form].elements["imagefile"].value) 
{
	alert("이미지파일을 입력하세요.");
	return false;
}
}
</script>
<title>맛집 등록 페이지</title>
</head>
<body>
<jsp:include page="./menu.jsp"/>
	<div class ="jumbotron">
		<div class ="container">
			<h1 class ="display-3">맛집 리뷰 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="addFood" class="form-horizontal" action="processAddFood.jsp" method="post">
			<div class="form-group row">
				<label class="col-sm-2">*식당명 : </label>
				<div class="col-sm-3"><input type="text" name="name" id ="name"class="form-control" placeholder="식당명을 입력하시오." autofocus></div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">*주소 : </label>
				<div class="col-sm-3"><input type="text" name="address" id ="address"class="form-control" placeholder="식당주소을 입력하시오." ></div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">카카오 지도 주소 : </label>
				<div class="col-sm-3"><input type="text" name="map" id ="map"class="form-control" placeholder="식당의 카카오 맵 지도 주소을 입력하시오." ></div>			
			</div>

			<div class="form-group row">
				<label class="col-sm-2">전화번호 : </label>
				<div class="col-sm-3"><input type="text" name="phone" id ="phone"class="form-control" placeholder="식당 전화번호을 입력하시오." ></div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">*추천메뉴(가격): </label>
				<div class="col-sm-3"><input type="text" name="bestfood" id ="bestfood" class="form-control" placeholder="추천메뉴을 입력하시오." ></div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">기타 메뉴 : </label>
				<div class="col-sm-3"><input type="text" name="foods" id ="foods" class="form-control" placeholder="그 외 메뉴를 입력하시오." ></div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">식당 장점 : </label>
				<div class="col-sm-5"><textarea cols="100" rows="4"  name="Advantage" id ="Advantage" class="form-control" placeholder="식당의 장점 입력하시오." ></textarea></div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">평점 : </label>
				<div class="col-sm-5"><input type="number" name="grade" min="0" max="5" /></div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">*이미지 : </label>
				<div class="col-sm-3"><input type="file" name="imagefile" id ="imagefile"class="form-control" ></div>			
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-secondary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>