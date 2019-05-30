<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login fail</title>
</head>
<body>
<script>
/*  获取session中的错误信息，并用提示框输出  */
alert("<%=session.getAttribute("LoginFailMessage") %>");
</script>
<script>
/*   跳转回登入页面   */
document.location.href="Login.jsp " 
</script>
</body>
</html>