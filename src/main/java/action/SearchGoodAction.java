package action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lib.Goods;
import lib.GoodsDao;

public class SearchGoodAction extends ActionSupport {
	//获取表单中元素（要查找的商品名）
	private String goodname;
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	@Autowired
	private GoodsDao goodsDao;
	public GoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}
	
	public String execute(){
		Map<String, Object> session = (Map<String, Object>)ActionContext.getContext().getSession();
		if(goodname == null || goodname.length() == 0) {
			//若商品名为空，查找结果信息设置为fail
			session.put("searchRes", "fail");
		}else {
			//否则的话
			//用商品名查找该商品
			Goods good = goodsDao.findById(goodname);
			if(good == null) {
				//若没有查找该商品,查找结果信息设置为fail
				session.put("searchRes", "fail");
			}else {
				//若找到该商品,查找结果信息设置为success，并且将查找到的商品放入session
				session.put("searchRes", "success");
				session.put("searchGood", good);
			}
		}
		//返回res，进入查找结果页面（SearchGoodRes.jsp）
		return "res";
	}
}
