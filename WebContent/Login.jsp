<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>
<!--          用户登入页面                       -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  
<title>登录界面</title>    
<style type="text/css">
	h2{
		font-size: 40px;
		color: #ff2244;
	}
	body{
		background-image:url("img/1.jpg");
		background-size: cover;		/*背景图片铺满网页*/
	}
	font{
		font-size: 20px;
	}
	input{
		font-size: 20px;
	}
	table{
		 margin-left:40%;
	}
	span{
		font-size: 20px;
		color: blueviolet;
		font-weight: bolder ;
	}
</style>
<script>
	function change(){
		var sp = document.getElementById("sp1");
		//用字符串存储四位验证码以免第一位是0时用数字无法表达
		var str = '';	
		for(var i = 0;i < 4;i++){
			//注意这里要使用floor()函数将random生成 的随机数(浮点型)
			//转换为整型(因为js是弱数据类型不能强制转换)
			var a = Math.floor(Math.random()*10);
			str += a;
		}
		sp.innerHTML = str;
		return str;
	}
</script>
</head>    
<body>    
  <div style="text-align:center;margin-top:120px">    <!-- 将文字放在网页中心距离顶部120像素 -->
    <h2>登入</h2>    
    <form action="Login.action" method="post">    
        <table>		<!-- 将表格放在网页左侧40%处-->	
            <tr>    
                <td><font>登录名：</font></td>    
                <td><input name="username" type="text" size="21" id="username" value=""+
                "<%=request.getParameter("username") == null ? "" : request.getParameter("username")%>"></td>
            </tr>    
            <tr>    
                <td align="right"><font>密码：</font></td>    
                <td><input name="password" type="password" size="21" id="password" value=""></td>    
            </tr>
        	 <tr>
        	 	
        	 	<td align="right"><font>验证码：</font></td>
            	<td><input type="text" id="checkcode" name="checkcode" size="21" value=""></td>
            	<td>
            		<span onclick="change()" id="sp1" name="sp1" title="点击切换">
            			<script>change()</script>
            		</span>
            		<input type="hidden" id="hd" name = "hidden">
            		<script type="text/javascript">
            			//在js中获取系统生成的随机四位验证码
            			var str = document.getElementById("sp1").innerHTML;
            			//将hidden的value设置为四位验证码，使过滤器能够获取
            			document.getElementById("hd").value = str;
            		</script>
            	</td>
            </tr>    
            <tr>
            	<td colspan="3" align="center">
            		<input type="submit" value="登录" onclick="check()">
            	    <input type="reset" value="重置">
            	    <a href="register.jsp"><font>注册</font></a> </td>
            </tr>
        </table>   
    </form><br>        
  </div>  
</body>    
</html>