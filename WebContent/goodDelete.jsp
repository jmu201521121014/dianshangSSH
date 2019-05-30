<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--        删除商品操作的页面           -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>删除商品</title>
</head>
<body>
<%
	String oldGoodname = request.getParameter("oldGoodname");
	request.getSession().setAttribute("oldgoodname", oldGoodname);
%>
<script type="text/javascript">
	document.location.href="goodManage!goodDelete.action";
</script>
</body>
</html>