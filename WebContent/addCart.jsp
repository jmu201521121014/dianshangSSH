<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--              将商品加入购物车操作页面                 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加到购物车</title>
</head>
<body>
<%
	if(request.getSession().getAttribute("username") == null){
		out.print("<script>alert(\"请您先登入\")</script>");
		out.print("<script>document.location.href=\"Login.jsp\"</script>");
	}
	//从url获取goodname
	String goodname = (String)request.getParameter("goodname");
	//将goodname保存到session中
	request.getSession().setAttribute("goodname", goodname);

%>
	<form action="addCart.action" method="post" name="form">
		<input type="hidden" name="goodname" value="<%=goodname %>">
	</form>
	<script type="text/javascript">
		document.form.submit();
	</script>
</body>
</html>