<%@page import="lib.*"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--          普通用户登入后的商品显示，有分页             -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	font{
		font-size: 30px;
		font-family: 黑体;
	}
	a{
		color: dimgrey;/*网页显示链接的颜色*/
		text-decoration: none;
	}
	a:hover{/*连接访问的颜色变化*/
		color: red;
		text-decoration: none;
	}
	div{
		width:100%;
		height:20%;
		background:aquamarine;
		margin-top:10px;
		padding-top:5px;
		padding-bottom:5px;
	}
	#a1{
		background-color: darkgray;
		text-decoration: none; 
		color: black;
		padding: 5px; 
		border-top-right-radius: 10px;
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
</style>
<%
	final int onePageGoodNum = 8;	//一页最多存放的商品数量
	int totalGoodNum = 0;		//当前页面有多少商品
	int pageno=0;				//当前是第几页
	//获取目前登入的用户信息user(在LoginAction中放入Session)，和所有商品信息goodList(在showLoginRes中放入)
	User user = (User)request.getSession().getAttribute("user");
	List<Goods> goodList = (List<Goods>)request.getSession().getAttribute("GoodList");
%>
<title>商品</title>
</head>
<body>
	<%
		//获取头像
		String head = user.getHead();
		System.out.println(head);
	%>
	<!-- https://blog.csdn.net/jingjingaibiancheng/article/details/72716507?locationNum=11&fps=1 
	http://www.jb51.net/article/73968.htm-->
	<div>
		<span style="margin-left:80% ;">
			<!--   获取当前登入用户的用户名，并显示在左上角    -->
			<%="欢迎您："+ user.getUsername() %></td>
			<a href="changeHead.jsp"><img title="点击更换头像" alt="头像" src="head/<%=head %>" height="80px"></a>
		</span>
		<span style="margin-left:80%">
			<!-- 进入购物车页面 -->
			<a href="Shopping_Cart.jsp" target="_blank">购物车</a>&nbsp&nbsp&nbsp&nbsp
			<a href = "Login.jsp">退出登入</a>
		</span>
		<center>
		<!--          通过表单提交要搜索的商品名称                 -->
			<form action="SearchGood.action" method="post">
				<input type="text" placeholder="输入您要搜索的商品名称" name="goodname" id="goodname"/>
				<input type="submit" value="搜索"/>
			</form>
		</center>
	</div>
	<hr size="3">
	<table align="center">
	<%
		String s = (String)request.getParameter("pageno");
		//获取当前在第几页面
		if(s == null || s.length() == 0)
			//若取得页面为null时，当前页面置为1
			pageno = 1;
		else
			pageno = Integer.parseInt(s);
		if(pageno == 0){
			//若当前页面为0，置为1
			pageno = 1;
		}
		//获取从(pageno-1)*8+1开始的八个商品
		//计算一共多少个商品totalGoodNum
		totalGoodNum = goodList.size();
		//System.out.print(totalGoodNum);
		int i = 1;%>
		<tr height="300px">
		<%for(int cnt = 0;cnt < totalGoodNum ;cnt++){%>
			<td align="center" width="500px"><img width="200px" height="220px" alt="<%=((Goods)goodList.get(cnt)).getGoods_name() %>" src="img/<%=((Goods)goodList.get(cnt)).getSrc() %>">
				<p><%=((Goods)goodList.get(cnt)).getGoods_name() %></p><p><%=((Goods)goodList.get(cnt)).getValue() %></p>
				<p><a href="addCart.jsp?goodname=<%=((Goods)goodList.get(cnt)).getGoods_name() %>" id="a1">加入购物车</a></p>
			</td>
			<%if(i == 4){
				//判断当显示了四个商品时进行换行操作
				out.print("</tr><tr>");
			}
			i++;
		}
		//System.out.println(totalGoodNum);
	%>
	</tr></table>
	<hr size="2">
	<center><a href="NewGood.jsp?pageno=<%=pageno-1%>">上一页</a>
	<a href="NewGood.jsp?pageno=1">首页</a>
	<a href="NewGood.jsp?pageno=<%=pageno+1%>">下一页</a></center>
</body>
</html>