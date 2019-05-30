package action;

import java.util.*;
import lib.*;

import org.apache.struts2.components.If;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class addCartAction extends ActionSupport {
	private String goodname;
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}

	Map<String, Object> session;
	//获取当前登入用户的信息
	User user;
	//自动注入CartDao
	@Autowired
	CartDao cartDao;
	public CartDao getCartDao() {
		return cartDao;
	}
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	@Autowired
	GoodsDao goodsDao;
	public GoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	public String execute(){
		session = ActionContext.getContext().getSession();
		user = (User)session.get("user");
		String username = user.getUsername(); 
		System.out.println(goodname);
		//根据username和goodname获取cart
		List<Cart> cartList = (List<Cart>)cartDao.findById(username, goodname);

		//若没有获取到该商品在购物车的记录，将其加入购物车
		if(cartList == null || cartList.size() == 0) {
			Cart cart = new Cart();
			cart.setUsername(username);
			cart.setGoodname(goodname);
			cartDao.save(cart);
			//获取新增商品信息
			Goods goods = goodsDao.findById(goodname);
			List<Goods> userCartGood = (List<Goods>)ActionContext.getContext().getSession().get("userCartGood");
			userCartGood.add(goods);
			//注意一定要将增加的商品信息放入session
			ActionContext.getContext().getSession().put("userCartGood", userCartGood);
			ActionContext.getContext().getSession().put("addCartMessage", "success");
		}else {
			//若购物车中已经有该商品
			session.put("addCartMessage", "fail");
		}
		return "res";
	}
}
