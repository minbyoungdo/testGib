<%@ page contentType ="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css"/>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="./MainHome.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">MainHome</font></font></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="탐색 전환">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav ml-auto">
     <c:choose>
      	<c:when test="${empty sessionId}">
        <li class="nav-item">
          <a class="nav-link active" href="./login.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">로그인</font></font></span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./addMember.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원가입</font></font></a>
        </li>
       </c:when>
        <c:otherwise>
         	<li class="nav-item">
          	<a class="nav-link active" href="./LogoutUser.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">로그아웃</font></font></span></a>
        	</li>
        	<li class="nav-item">
         	 <a class="nav-link" href="./editUser.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 정보</font></font></a>
       		</li>
        </c:otherwise>
        </c:choose> 
 		 <li class="nav-item">
          <a class="nav-link" href="<c:url value="BoardListAction.do?pageNum=1"/>">
          <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
          게시판</font></font></a>
        </li>
        
        
<!--         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">쓰러지 다</font></font></a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></a>
            <a class="dropdown-item" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></a>
            <a class="dropdown-item" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3</font></font></a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">4</font></font></a>
          </div>
        </li> 
       
      </ul>
      <form class="d-flex">
        <input class="form-control me-sm-2" type="text" placeholder="검색">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">검색</font></font></button>
      </form> -->
    </div>
  </div>
</nav>