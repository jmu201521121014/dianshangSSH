package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lib.User;
import lib.UserDao;

public class RegisterAction extends ActionSupport {
	private String username,password1;
	//获取request，response，context，session
	private HttpServletRequest request = ServletActionContext.getRequest();
	private HttpServletResponse response = ServletActionContext.getResponse();
	private ActionContext context = ActionContext.getContext();
	private Map<String, Object> session = context.getSession();
	//声明并获取UserDao
	@Autowired
	UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String execute(){
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		//建立一个标志用来判断用户名是否已经存在
		int sign = 1;
		//获取所有用户的记录
		List<User> userList = userDao.findByHql("from User");
		//获取用户名为username的记录
		//System.out.println("register:"+username);
		User user = userDao.findById(username);
		//若已经存在该用户
		if(user != null) {
			sign = 0;
		}
		//若用户名已经存在，返回注册页面并提示用户名已经存在
		if(sign == 0) {
			return "fail";
		}else {
			//若该用户名不存在时，将用户名和密码加入数据库中
			//计算当前共有几位用户
			user = new User();
			int rowNum = userList.size();
			if(rowNum == 0) {
				//若注册时一个用户都没有,即该用户是第一个注册用户，将其设置为管理员
				user.setUsername(username);
				user.setPassword(password1);
				user.setType("管理员");
				user.setHead("defaulthead.png");
				userDao.save(user);
				//若插入成功，提示注册成功并进入登入页面
				session.put("userType", "admin");
				return SUCCESS;
			}else {
				//若表中已经有用户了，将新注册用户设置为普通用户
				user.setUsername(username);
				user.setPassword(password1);
				user.setType("普通用户");
				user.setHead("defaulthead.png");
				userDao.save(user);
				//若插入成功，提示注册成功并进入登入页面
				session.put("userType", "user");
				return SUCCESS;
			}	
		}
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}
}
