package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import lib.*;
/**********在成功后将当前登入用户信息user，和全部用户信息userList放入session中***********/
public class LoginAction extends ActionSupport{
	User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Autowired
	UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//获取Login.jsp中的表单元素
	private String username,password,checkcode,hidden;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	//获取Context和Session
	private ActionContext context = ActionContext.getContext();
	private Map<String, Object> session = context.getSession();
	//获取用户类型
	private String type = null;
	
	public String execute() {
		//判断用户名是否为空
		if(username == null || username.length() == 0) {
				//System.out.println("用户名为空");
			//session存放错误信息
				session.put("LoginFailMessage", "用户名不能为空");
				return "fail";
		}
		//判断密码是否为空
		if(password == null || password.length() == 0) {
			//session存放错误信息
			session.put("LoginFailMessage", "密码不能为空");
			return "fail";
		}
		//若验证码为空
		if(checkcode == null || checkcode.length() == 0) {
			//session存放错误信息
			session.put("LoginFailMessage", "请输入验证码");
			return "fail";
		}
		//判断验证码是否正确
		//将checkcode和hidden的前后空格去掉
		checkcode = checkcode.trim();
		hidden = hidden.trim();
		if(checkcode.compareTo(hidden) != 0) {
			//session存放错误信息
			session.put("LoginFailMessage", "验证码错误");
			return "fail";
		}
		//System.out.println(username);
		//通过userDao获取用户名为username的记录
		user = userDao.findById(username);
		//若记录为null,表示不存在该用户，返回fail
		if(user == null) {
			session.put("LoginFailMessage", "不存在该用户");
			return "fail";
		}
		//若存在该用户，判断输入密码是否正确
		if(user.getPassword().compareTo(password) != 0) {
			//若输入密码不正确
			session.put("LoginFailMessage", "密码错误");
			return "fail";
		}
		//若用户名和密码均正确
		//将用户名和用户类型保存到session中
		//System.out.println(username);
		//System.out.println(type);
		//System.out.println(user.getUsername()+" "+user.getType());
		session.put("username", username);
		session.put("user", user);
		//获取所有用户信息并存放入session
		session.put("userList", userDao.findByHql("from User"));
		return SUCCESS;
	}
}
