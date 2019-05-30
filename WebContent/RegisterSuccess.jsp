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
	String type = (String)session.getAttribute("userType");
	if(type.compareTo("admin") == 0){%>
		alert("注册成功，您成为本站管理员");
	<%}else{%>
		alert("注册成功,您成为本站用户");
	<%}
%>
document.location.href="Login.jsp ";
</script>
</body>
</html>