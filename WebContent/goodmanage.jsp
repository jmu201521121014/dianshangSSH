<%@page import="java.sql.*,java.util.*,lib.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--           管理员对商品的管理页面，里面有修改，删除和增加商品                       -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
<style type="text/css">
	font{
		font-size: 30px;
		font-family: 黑体;
	}
	a{
		text-decoration:none;
		color:darkgray;
	}
	a:visited{
		color: darkgray;
	}
	a:hover{
		color: black;
		text-decoration: underline;
	}
	span{
		margin-left : 85%;
	}
	#a1{
		color :blue;
		margin:100px;
		padding-left:15px;
		padding-right:15px;
		padding-bottom:10px;
		padding-top:10px;
		background: #D1D1D1;
		border: 2px;
		border-radius:30px;
	}
</style>

</head>
<body>
<span><a href="admin.jsp">返回管理主页面</a></span>
<table rules="all" align="center"><form>
	<%
		//获取所有商品列表
		List<Goods> GoodList = (List<Goods>)request.getSession().getAttribute("GoodList");
		if(GoodList == null || GoodList.size() == 0)
			return;
		//rSet.absolute(row);
		for(int i = 0;i < GoodList.size();i++){%>
			<tr><td>
			<img width="80px" height="100px" alt="<%=GoodList.get(i).getGoods_name() %>" src="img/<%=GoodList.get(i).getSrc() %>"></td>
			<td valign="middle"><font><%=GoodList.get(i).getGoods_name() %></font></td>
			<td valign="middle"><font>单价：<%=GoodList.get(i).getValue() %>元</font></td>
			<!-- 使用token网页重构进行商品修改 -->
			<td><a href="goodUpdate.jsp?oldGoodname=<%=GoodList.get(i).getGoods_name() %>">修改</a>
			<!-- 通过onclick=if(confirm('xxx') == false) return false;来决定是否进行跳转页面 -->
			<a href="goodDelete.jsp?oldGoodname=<%=GoodList.get(i).getGoods_name() %>" onclick="if(confirm('您确定要删除此商品吗？') == false) return false;">删除</a></td></tr>
		<%}	
	%>
	<tr height="60px"><td colspan="4" align="center"><a href="goodInsert.jsp" style="font-size:20px" id="a1">增加商品</a></td>
	</tr></form></table>
</body>
</html>