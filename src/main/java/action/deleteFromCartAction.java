package action;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lib.*;
//从cart表中删除记录
public class deleteFromCartAction extends ActionSupport {
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
		Map<String, Object> session = ActionContext.getContext().getSession();
		//获取要删除商品的商品名
		String goodname = (String)session.get("goodname");
		//获取当前登入用户的信息
		User user = (User)session.get("user");
		//创建Cart记录
		Cart cart = new Cart();
		cart.setUsername(user.getUsername());
		cart.setGoodname(goodname);
		//删除记录
		//try {
			cartDao.Delete(cart);
		//}catch (Exception e) {
		//	session.put("message", "fail");
		//	return "res";
		//}
		//获取被删除的商品信息
		Goods goods = goodsDao.findById(goodname);
		//从session中获取当前登入用户购物车中商品的信息
		List<Goods> userCartGood = (List<Goods>)session.get("userCartGood");
		//从中删除被移除购物车的商品信息
		//System.out.println(goods.getGoods_name());
		for(int i=0;i<userCartGood.size();i++) {
			System.out.println(userCartGood.get(i).getGoods_name());
			if(userCartGood.get(i).getGoods_name().compareTo(goodname) == 0) {
				userCartGood.remove(i);
			}
		}
		//从新放入session中
		session.put("userCartGood", userCartGood);
		session.put("message", "success");
		return "res";
	}
}
