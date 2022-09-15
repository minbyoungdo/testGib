<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import ="dto.Food" %>
<%@ page import ="dao.FoodRepository" %>
<%
	String name =request.getParameter("name");
	if(name==null|| name.trim().equals(""))
	{
		response.sendRedirect("Foods.jsp");
		return;
	}
%>