<%@page import="lib.Goods"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--             用户进行商品搜索的页面                        -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查找商品</title>
<style type="text/css">
	div{
		width:100%;
		height:20%;
		background:lightpink;
		margin-top:10px;
		padding-top:5px;
		padding-bottom:5px;
	}
	a{
		color: black;/*网页显示链接的颜色*/
		text-decoration: none;
	}
	a:hover{/*连接访问的颜色变化*/
		color: red;
		text-decoration: none;
	}
	#a1{
		background-color: darkgray;
		text-decoration: none; 
		padding: 5px; 
		border-top-right-radius: 10px;
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	font{
		color:red;
		font-size:20px;
	}
</style>
</head>
<body>
<div>
<span style="margin-left:85% ;">用户：<%=request.getSession().getAttribute("username") %></span>
<center>
	<form action="SearchGood.action" method="post">
		<input type="text" placeholder="输入您要搜索的商品名称" name="goodname" id="goodname"/>
		<input type="submit" value="搜索"/>
		<br><a href="NewGood.jsp">返回商品页面</a>
	</form>
</center>
</div><center>
<%
	//获取查询结果信息
	String searchRes = (String)request.getSession().getAttribute("searchRes");
	if(searchRes.compareTo("success") == 0){
		//查找到该商品，从session中获取该商品的信息
		Goods good = (Goods)request.getSession().getAttribute("searchGood");
		out.print("<table align=\"center\"><tr>");
		out.print("<td><img width=\"180px\" height=\"200px\" src=\"img/"+good.getSrc()+"\"></td>");
		out.print("<td width=\"200px\" align=\"center\">"+good.getGoods_name()+"</td>");
		out.print("<td width=\"200px\" align=\"center\">"+good.getValue()+"</td></tr></table>");
		System.out.println("<a href=\"addCart.jsp?goodname="+ good.getGoods_name() +"\" id=\"a1\">加入购物车</a>");
	%>
		<a href="addCart.jsp?goodname=<%=good.getGoods_name()%>" id="a1">添加到购物车</a>
	<%
	}else{
		//没有查找到该商品
		out.print("<center>没有查找到该商品</center>");
	}
%></center>
</body>
</html>