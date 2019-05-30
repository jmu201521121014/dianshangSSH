package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Statement;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lib.User;
import lib.UserDao;

public class changeHead extends ActionSupport {
	//封装上传文件域的成员变量
	private File upload;
	//封装上传文件类型的成员变量
	private String uploadContentType;
	//封装上传文件名的属性
	private String uploadFileName;
	//直接在struts.xml文件中配置的成员变量
	private String savePath;
	//接受struts.xml文件中配置的savePath方法
	public void setSavePath(String value) {
		this.savePath = value;
	}
	//获取上传文件的保存位置
	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}
	
	//获取当前登入的用户信息
	private User user = (User)ActionContext.getContext().getSession().get("user");
	//获取UserDao
	@Autowired
	private UserDao userDao;
	public UserDao getUserDao() {
		//int a;
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//在execute中实现将用户上传的文件拷贝到指定路径下
	public String execute(){
		//以服务器的文件保存地址和源文件名建立上传文件输出流
		try {
			if(upload != null)
					System.out.println(upload.getName());
			else {
				System.out.println("null");
			}
			FileOutputStream fileOutputStream = new FileOutputStream(getSavePath()
					+ "\\" + getUploadFileName());
			System.out.println(getSavePath()
					+ "\\" + uploadFileName);
			//以用户上传的文件File打开输入流
			FileInputStream fileInputStream = new FileInputStream(getUpload());
			byte[] buffer = new byte[1024];
			int len = 0;
			//以下执行复制操作
			while((len = fileInputStream.read(buffer)) > 0) {
				fileOutputStream.write(buffer,0,len);
			}
			//将文件名保更新到数据库中
			user.setHead(getUploadFileName());
			userDao.Update(user);
			//将修改后的数据再保存会session中
			ActionContext.getContext().getSession().put("user", user);
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	//file文件的get/set方法
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	//文件类型的get/set方法
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	//文件名的get/set方法
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
}
