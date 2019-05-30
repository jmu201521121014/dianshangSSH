<%@page import="lib.*,java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--          修改商品信息页面                      -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改商品</title>
<%
	//获取全部商品信息
	List<Goods> GoodList = (List<Goods>)request.getSession().getAttribute("GoodList");
	//获取要修改的商品的商品名
	String oldGoodname = request.getParameter("oldGoodname");
	Goods oldgood = null;
	//获取要修改的商品的所有信息
	for(int i = 0;i < GoodList.size();i++){
		if(GoodList.get(i).getGoods_name().compareTo(oldGoodname) == 0){
			oldgood = GoodList.get(i);
			//将要修改的商品的信息放入session中
			request.getSession().setAttribute("oldgood", oldgood);
			break;
		}
	}
	//System.out.println(oldgood.getGoods_name()+","+oldgood.getValue()+","+oldgood.getSrc());
%>
</head>
<body>
	<center>
	<form action="goodManage!goodUpdate.action" method="post">
		<table>
			<tr><td>商品名称</td><td>商品价格</td><td>商品图片路径</td></tr>
			<tr><td><input type="text" name="newGoodname" id="newGoodname" value=<%=oldgood.getGoods_name()%>/>
			</td><td><input type="text" name="newGoodprice" id="newGoodprice" value=<%=oldgood.getValue()%>/>
			</td><td><input type="file" name="newsrc" id="newsrc" value=<%=oldgood.getSrc()%>/>
			</td></tr>
		</table>
		<input type="submit" action="update.jsp" method="post" value="提交修改"/>
	</form>
	</center>
	<%

	%>
</body>
</html>