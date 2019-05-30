<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--                增加商品操作的页面                         -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>增加商品</title>
</head>
<body>
	<center>
	<!-- 建立一个表单获取要增加的商品的信息，表单提交到goodManage的goodInsert方法中-->
	<form action="goodManage!goodInsert.action" method="post">
		<table>
			<tr><td>商品名称</td><td>商品价格</td><td>商品图片路径</td></tr>
			<tr><td><input type="text" name="newGoodname" id="newGoodname"/>
			</td><td><input type="text" name="newGoodprice" id="newGoodprice"/>
			</td><td><input type="file" name="newsrc" id="newsrc"/>
			</td></tr>
		</table>
		<input type="submit" value="添加商品"/>
	</form>
	</center>
	<%
	
	%>
</body>
</html>