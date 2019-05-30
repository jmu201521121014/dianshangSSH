package action;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lib.User;
import lib.UserDao;

public class userManageAction extends ActionSupport {
	@Autowired
	UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public String execute(){
		return "res";
	}
	
	/*删除用户操作，jsp会提交到该方法中*/
	public String deleteUser() {
		Map<String,Object> session = ActionContext.getContext().getSession();
		String oldusername = (String)session.get("oldusername");
		//根据username查找是否存在该用户
		//System.out.println(oldusername);
		User user = userDao.findById(oldusername);
		if(user == null) {
			session.put("userManageRes", "fail");
		}else {
			session.put("userManageRes", "success");
			//从数据库中删除该用户
			userDao.Delete(user);
			//从session中获取用户列表
			List<User> userList = (List<User>)session.get("userList");
			for(int i = 0;i < userList.size();i++) {
				//从userList列表中移除删除的用户
				if(userList.get(i).getUsername().compareTo(oldusername) == 0) {
					userList.remove(i);
					break;
				}
			}
			//重新放回session
			session.put("userList", userList);
		}
		return "res";
	}
	
	/*将用户设置为管理员操作，jsp会提交到该方法中*/
	public String setManage() {
		Map<String,Object> session = ActionContext.getContext().getSession();
		String oldusername = (String)session.get("oldusername");
		//根据username查找是否存在该用户
		//System.out.println(oldusername);
		User user = userDao.findById(oldusername);
		if(user == null) {
			session.put("userManageRes", "fail");
		}else {
			session.put("userManageRes", "success");
			//将用户权限修改为管理员，
			user.setType("管理员");
			userDao.Update(user);
			//从session中获取用户列表
			List<User> userList = (List<User>)session.get("userList");
			for(int i = 0;i < userList.size();i++) {
				//从userList列表中修改用户信息
				if(userList.get(i).getUsername().compareTo(oldusername) == 0) {
					userList.remove(i);
					userList.add(user);
					break;
				}
			}
			//重新放回session
			session.put("userList", userList);
		}
		return "res";
	}
	
	/*将用户管理员权限删除操作，jsp会提交到该方法中*/
	public String dropManage() {
		Map<String,Object> session = ActionContext.getContext().getSession();
		String oldusername = (String)session.get("oldusername");
		//根据username查找是否存在该用户
		//System.out.println(oldusername);
		User user = userDao.findById(oldusername);
		if(user == null) {
			session.put("userManageRes", "fail");
		}else {
			session.put("userManageRes", "success");
			//将用户权限修改为普通用户，
			user.setType("普通用户");
			userDao.Update(user);
			//从session中获取用户列表
			List<User> userList = (List<User>)session.get("userList");
			for(int i = 0;i < userList.size();i++) {
				//从userList列表中修改用户信息
				if(userList.get(i).getUsername().compareTo(oldusername) == 0) {
					userList.remove(i);
					userList.add(user);
					break;
				}
			}
		}
		return "res";
	}
	
}
