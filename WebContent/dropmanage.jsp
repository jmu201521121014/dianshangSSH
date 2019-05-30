<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--             取消用户的管理员权限                      -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String username = (String)request.getParameter("oldusername");
	request.getSession().setAttribute("oldusername", username);
%>
	<script type="text/javascript">
		document.location.href="userManage!dropManage.action";
	</script>
</body>
</html>