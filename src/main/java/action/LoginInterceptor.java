package action;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor {
	public void destroy() {
		// TODO Auto-generated method stub

	}
	public void init() {
		// TODO Auto-generated method stub

	}
	public String intercept(ActionInvocation invocation) throws Exception {
		//获取session
		Map<String,Object> session = invocation.getInvocationContext().getSession();
		//获取用户名
		String userName = (String)session.get("username");
		//若用户名为null说明还没登入
		if(userName == null || userName.length() == 0) {
			//返回Login
			return "Login";
		}
		String reString = invocation.invoke();
		return reString;
	}
}
