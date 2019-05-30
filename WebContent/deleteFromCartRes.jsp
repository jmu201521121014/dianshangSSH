<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>deleteFromCartRes</title>
</head>
<body>
<script type="text/javascript">
<%
	//从session中获取deleteFromCart操作后的返回信息
	String deleteCartMessage = (String)session.getAttribute("message");
	if(deleteCartMessage.compareTo("success") == 0){%>
		alert("成功从购物车中删除");
		//跳转到购物车页面
		document.location.href="Shopping_Cart.jsp";
	<%}else{%>
		//跳转到商品页面
		alert("删除失败");
		document.location.href="Shopping_Cart.jsp";
	<%}
%>
</script>
</body>
</html>