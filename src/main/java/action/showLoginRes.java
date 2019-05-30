package action;

import java.util.*;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lib.*;
/**********在成功后将当前所有商品信息goodList，当前登入用户的购物车信息userCart放入session中***********/
public class showLoginRes extends ActionSupport {
	List<Goods> list;
	@Autowired
	GoodsDao goodsDao;
	public GoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}
	
	@Autowired
	CartDao cartDao;
	public CartDao getCartDao() {
		return cartDao;
	}
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	//获取Session
	private ActionContext context = ActionContext.getContext();
	private Map<String, Object> session = context.getSession();
	
	public String execute(){
		//根据session中的type判断是管理员还是普通用户
		Map<String,Object> session = ServletActionContext.getContext().getSession();
		User user = (User)ActionContext.getContext().getSession().get("user");
		//获取所有商品信息并放入session
		String hql = "from Goods";
		List<Goods> list = goodsDao.findByHql(hql);
		session.put("GoodList", list);
		//判断是管理员登入还是普通用户登入
		if(user.getType().compareTo("管理员") == 0) {
			return "admin";
		}else {
			//若是用户登入
			//获取当前登入用户的购物车表中信息(username,goodname)
			List<String> cartList = cartDao.findByUsername(user.getUsername());
			
			//存放用户购物车中商品的所有信息
			List<Goods> userCartGood = new ArrayList<Goods>();
			System.out.println("show userCartGood:");
			for(int i = 0;i < cartList.size();i++) {
				Goods goods = goodsDao.findById(cartList.get(i));
				System.out.println(goods.getGoods_name());
				userCartGood.add(goods);
			}
			//将该用户购物车中商品信息放入session中
			ActionContext.getContext().getSession().put("userCartGood", userCartGood);
			return "user";
		}
	}
}
