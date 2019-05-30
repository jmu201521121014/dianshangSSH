<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--         对商品操作返回结果页面                      -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String goodManagerRes = (String)request.getSession().getAttribute("goodManageRes");
		if(goodManagerRes!=null && goodManagerRes.compareTo("success") == 0){
			out.println("<script>alert(\"操作成功\")</script>");
			out.println( "<script>document.location.href=\"goodmanage.jsp \" </script>"); 
		}else{
			out.println("<script>alert(\"操作失败\")</script>");
			out.println( "<script>document.location.href=\"goodmanage.jsp \" </script>"); 
		}
 	%>
</body>
</html>