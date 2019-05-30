<%@page import="java.sql.*,java.util.*,lib.*"%>s
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--          管理员对用户进行管理           -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<style>
	font{
		font-size: 30px;
		font-family: 黑体;
	}
	a{
		border: 10px;
		border-radius:30px;
		text-decoration:none;
		color:darkgray;
	}
	a:hover{
		color: black;
		text-decoration: underline;
	}
	span{
		margin-left : 85%;
	}
</style>
</head>
<body>
<span><a href="admin.jsp">返回管理主页面</a></span>
<table width="60%" height="100%" align="center" border="3px">
	<tr height="10%"><td>用户名</td><td>密码</td><td>用户类型</td></tr>
	<%
		//获取所有用户列表
		List<User> userList = (List<User>)request.getSession().getAttribute("userList");
		if(userList == null || userList.size() == 0)
			return;
		//rSet.absolute(row);
		for(int i = 0;i < userList.size();i++){%>
			<tr height="10%"><td width="20%"><%=userList.get(i).getUsername() %></td>
			<td width="20%"><%=userList.get(i).getPassword() %></td>
			<td width="20%"><%=userList.get(i).getType() %></td>
			<td>
			<a href="deleteUser.jsp?oldusername=<%=userList.get(i).getUsername()%>" onclick="if(confirm('您确定要删除此用户吗？') == false) return false;">删除</a>
			<a href="setManage.jsp?oldusername=<%=userList.get(i).getUsername()%>">设置为管理员</a>
			<a href="dropmanage.jsp?oldusername=<%=userList.get(i).getUsername()%>" onclick="if(confirm('您确定要取消该用户管理员权限？') == false) return false;">取消管理员权限</a></td></tr>
		<%}
	%></table>
</body>
</html>