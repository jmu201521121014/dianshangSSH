<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更换头像</title>
</head>
<body>
	<center>
		<!-- enctype="multipart/form-data"不要忘记加，否则无法获取到File -->
		<s:form action="changeHead.action" method="post" enctype="multipart/form-data">
			<s:file name="upload" lable="选择文件"></s:file>
			<s:submit value="更改"></s:submit>
		</s:form>
	</center>
</body>
</html>