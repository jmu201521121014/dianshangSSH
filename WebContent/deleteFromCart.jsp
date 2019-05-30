<%@page import="java.sql.*,lib.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--           将商品名放入session并跳转到deleteFromCartAction           -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>从购物车中移除</title>
</head>
<body>
<%
	if(request.getSession().getAttribute("username") == null){
		out.print("<script>alert(\"请您先登入\")</script>");
		out.print("<script>document.location.href=\"Login.jsp\"</script>");
	}
	//从url中解析出goodname
	String goodname = (String)request.getParameter("goodname");
	request.getSession().setAttribute("goodname", goodname);
%>
	<script>
		//跳转到delectFromCartAction
		document.location.href="deleteFromCartAction.action";
	</script>
</body>
</html>