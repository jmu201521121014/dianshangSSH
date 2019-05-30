<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--             管理员登入后进入的第一个页面，页面中有商品管理和用户管理选项 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员界面</title>
<style>
	div{
		margin-top:10px;
		margin-left:20px;
		margin-bottom:10px;
		margin-right:20px;
		padding-right:30px;
		padding-left:30px;
		padding-top:20px;
		padding-bottom:20px;
		background: paleturquoise;
		border:2px;
		border-radius:30px;
	}
	a{
		font-size: 18px;
		border: 10px;
		border-radius:30px;
		text-decoration:none;
		color:red;
	}
	a:hover{
		color: black;
	}
</style>
</head>
<body background="img/3.jpg" style="background-size: cover">
	<span style="padding-left:85% ;">
	<%="欢迎您管理员："+ request.getSession().getAttribute("username") %><br/></span>
	<span style="padding-left:85% ;">
	<a href = "Login.jsp">退出登入</a></span>
	<br>
	<center><table><tr>
		<td><div><a href="goodmanage.jsp">商品管理</a></div></td>
		<td><div><a href="usermanage.jsp">用户管理</a></div></td>
	</center></tr></table>
</body>
</html>