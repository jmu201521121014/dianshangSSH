<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--             用户注册页面                       -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<style type="text/css">
	h2{
		font-size: 40px;
		color: #ff2244;
	}
	body{
		background-image:url("img/2.jpg");
		background-size: cover;		/*背景图片铺满页面*/
	}
	font{
		font-size: 20px;
	}
	input{
		font-size: 20px;
	}
	span{
		color: #FF2244;	
	}
</style>
<script>
	//设置一个全局变量sign
	var sign = 0;
</script>
</head>
<body>
 	<div style="text-align:center;margin-top:120px">    <!-- 将表单放在网页中心距离顶部120像素 -->
		<h2>注册</h2>
		<form action = "Register.action" method = "post">
			<table style="margin-left: 40%;">
				<tr><td><font>用户名：</font></td><td><input type="text" id="username" name="username"/></td>
					<td><span id="sp1"></span></td></tr>
				<script>
					function check1(){
						var username = document.getElementById('username');
						//获取用户名，放入str
						var str = username.value;
						if(str == ''){
							//若用户名为空，提示并将sign置为0
							document.getElementById('sp1').innerHTML =  "请输入用户名";
							sign = 0;
						}else{
							//用户名不为空，将sign置为1
							document.getElementById('sp1').innerHTML = '';
							sign = 1;
						}
					}
					//循环检测
					setInterval("check1()",500);
				</script>
				<tr><td><font>密码：</font></td><td><input type="password" id="password1" name="password1"/></td>
					<td><span id="sp2"></span></td></tr>
				<script>
					function check2(){
						var password = document.getElementById('password1');
						//获取密码
						var str = password.value;
						if(str == ''){
							//若密码为空，提示并将sign置为0
							document.getElementById('sp2').innerHTML =  "请输入密码";
							sign = 0;
						}else{
							//密码不为空，将sign置为1
							document.getElementById('sp2').innerHTML = '';
							sign = 1;
						}
					}
					//循环检测
					setInterval("check2()",500);
				</script>
				<tr><td><font>再次输入密码：</font></td><td><input type="password" id="password2"/></td>
					<td><span id="sp3"></span></td></tr>
				<script>
					function check3(){
						//获取第一次和第二次输入的密码
						var password1 = document.getElementById('password1');
						var password2 = document.getElementById("password2");
						var str1 = password1.value;
						var str2 = password2.value;
						//console.log(sign);
						if(str1 != '' && str2 != '' && str1 == str2){
							//若两次密码相同，将sign置为1
							//console.log(sign);
							document.getElementById('sp3').innerHTML = "";
							sign = 1;
						}else{
							//console.log(sign);
							//若两次密码不同（包括密码为空时），将sign置为0
							document.getElementById('sp3').innerHTML =  "两次输入密码不同";
							sign = 0;
						}
					}
					//循环检测
					setInterval("check3()",500);
				</script>
				<tr><td colspan="2" align="right"><input type="submit" value = "注册" id = "button"></td>
				<td><a href="Login.jsp">返回登入界面</a></td>></tr>
				<script>
					function setbutton(){
						//设置submit按钮是否可以点击函数
						var button = document.getElementById("button");
						if(sign == 1){
							//若sign为1，将submit设置为可点
							button.disabled = false;
						}else{
							//否则submit不可点
							button.disabled = true;
						}
					}
					setInterval("setbutton()",500);
				</script>
			</table>
		</form>
	</div>
</body>
</html>