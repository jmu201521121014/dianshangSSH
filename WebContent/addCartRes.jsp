<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Register Success</title>
</head>
<body>
<script type="text/javascript">
<%
	//从session中获取addCart操作后的返回信息
	String addCartMessage = (String)session.getAttribute("addCartMessage");
	if(addCartMessage.compareTo("success") == 0){%>
		alert("成功加入购物车");
		//跳转到购物车页面
		document.location.href="Shopping_Cart.jsp";
	<%}else{%>
		//跳转到商品页面
		alert("购物车中已经有该商品");
		document.location.href="NewGood.jsp";
	<%}
%>
</script>
</body>
</html>