<%@page import="lib.*"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--              用户购物车页面                       -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车</title>
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
		color: dimgrey;/*网页显示链接的颜色*/
		text-decoration: none;
	}
	a:hover{/*连接访问的颜色变化*/
		color: red;
		text-decoration: none;
	}
</style>
</head>
<body>
<div>
<span style="margin-left:85%; color:darkviolet">用户：<%=request.getSession().getAttribute("username") %></span>
</div>
<%
	if(request.getSession().getAttribute("username") == null){
		out.print("<script>alert(\"请您先登入\")</script>");
		out.print("<script>document.location.href=\"Login.jsp\"</script>");
	}
	//获取该用户购物车内的商品信息
	List<Goods> userCartGood = (List<Goods>)request.getSession().getAttribute("userCartGood");
		%>
		<table align="center">
		<%
		if(userCartGood.size() == 0){
			out.print("<center><p>您还未添加任何商品到购物车</p>");
			out.print("<a href=\"NewGood.jsp\">点击这里返回添加商品</a></center>");
			return;
		}
		for(int i = 0;i<userCartGood.size();i++){
			%>
			<tr><td><img width="180px" height="200px" alt="<%=userCartGood.get(i).getGoods_name() %>" src="img/<%=userCartGood.get(i).getSrc() %>"></td>
			<td width="200px" align="center"><p><%=userCartGood.get(i).getGoods_name() %></p><p><%=userCartGood.get(i).getValue() %></p>
			<p><a href="deleteFromCart.jsp?goodname=<%=userCartGood.get(i).getGoods_name()%>">从购物车中移除</a></p></td></tr>
			<tr><td colspan="2"><hr size="2px"></tr>
			<%
		}
%>
</table></body>
</html>